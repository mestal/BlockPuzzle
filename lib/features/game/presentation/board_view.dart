import 'dart:async';
import 'dart:math';

import 'package:block_puzzle/app/theme.dart';
import 'package:block_puzzle/core/widgets/particles.dart';
import 'package:block_puzzle/features/game/application/game_controller.dart';
import 'package:block_puzzle/features/game/domain/board.dart';
import 'package:block_puzzle/features/game/presentation/board_cell.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// [step] is how many cells the current drag has covered (0 for a tap).
typedef MarkCallback =
    bool Function(int row, int col, MoveAction action, {int step});

/// Clues + grid. Gestures:
/// * single tap → X, single press-and-drag → X along a line
/// * double tap → fill, double tap with the 2nd press dragged → fill a line
class BoardView extends StatefulWidget {
  const BoardView({
    required this.state,
    required this.onMark,
    required this.particles,
    super.key,
  });

  final GameState state;
  final MarkCallback onMark;
  final ParticleController particles;

  @override
  State<BoardView> createState() => _BoardViewState();
}

typedef _Pos = (int, int);

class _BoardViewState extends State<BoardView> {
  final _gridKey = GlobalKey();
  double _cell = 40;

  // Gesture state.
  int? _pointer;
  _Pos? _down;
  _Pos? _last;
  MoveAction _action = MoveAction.cross;
  bool _isSecondTap = false;
  bool _moved = false;
  bool _stopped = false;
  int _step = 0;
  Axis? _axis;
  Timer? _singleTap;
  _Pos? _pendingTap;
  _Pos? _pressed;

  // Effects.
  final _flashSeq = <int, int>{};
  final _flashDelay = <int, Duration>{};

  GameState get _state => widget.state;
  int get _rows => _state.puzzle.rows;
  int get _cols => _state.puzzle.cols;

  @override
  void didUpdateWidget(BoardView old) {
    super.didUpdateWidget(old);
    final fx = _state.fx;
    if (fx != null && fx.seq != old.state.fx?.seq) _playFx(fx);
  }

  @override
  void dispose() {
    _singleTap?.cancel();
    super.dispose();
  }

  // ---------------------------------------------------------------- effects

  static const _waveStep = Duration(milliseconds: 45);

  void _playFx(MoveFx fx) {
    if (fx.hint) {
      _burst(fx.row, fx.col, AppColors.gold, count: 16);
    }
    if (!fx.completedLine) return;
    unawaited(HapticFeedback.mediumImpact());
    for (final r in fx.completedRows) {
      for (var c = 0; c < _cols; c++) {
        _flash(r, c, fx, (c - fx.col).abs());
      }
    }
    for (final c in fx.completedCols) {
      for (var r = 0; r < _rows; r++) {
        _flash(r, c, fx, (r - fx.row).abs());
      }
    }
  }

  void _flash(int r, int c, MoveFx fx, int distance) {
    final index = r * _cols + c;
    final delay = _waveStep * distance;
    _flashSeq[index] = fx.seq;
    _flashDelay[index] = delay;
    if (_state.board.at(r, c).mark == CellMark.filled) {
      Timer(delay, () {
        if (mounted) _burst(r, c, Colors.white, count: 5);
      });
    }
  }

  void _burst(int r, int c, Color color, {required int count}) {
    final box = _gridKey.currentContext?.findRenderObject() as RenderBox?;
    if (box == null) return;
    final center = box.localToGlobal(
      Offset((c + 0.5) * _cell, (r + 0.5) * _cell),
    );
    widget.particles.burst(
      center,
      count: count,
      colors: [color, AppColors.gold, AppColors.blockShine],
      size: _cell * 0.28,
      speed: _cell * 4,
    );
  }

  // --------------------------------------------------------------- gestures

  _Pos? _hit(Offset local, {bool clamp = false}) {
    var r = (local.dy / _cell).floor();
    var c = (local.dx / _cell).floor();
    if (clamp) {
      r = r.clamp(0, _rows - 1);
      c = c.clamp(0, _cols - 1);
    } else if (r < 0 || c < 0 || r >= _rows || c >= _cols) {
      return null;
    }
    return (r, c);
  }

  void _onDown(PointerDownEvent e) {
    if (_pointer != null) return;
    final pos = _hit(e.localPosition);
    if (pos == null) return;
    _pointer = e.pointer;

    final pending = _pendingTap;
    _singleTap?.cancel();
    _pendingTap = null;
    if (pending != null && _near(pending, pos)) {
      _isSecondTap = true;
      _action = MoveAction.fill;
      _down = pending;
    } else {
      if (pending != null) _mark(pending, MoveAction.cross);
      _isSecondTap = false;
      _action = MoveAction.cross;
      _down = pos;
    }
    _last = _down;
    _moved = false;
    _stopped = false;
    _step = 0;
    _axis = null;
    setState(() => _pressed = _down);
  }

  bool _near(_Pos a, _Pos b) =>
      (a.$1 - b.$1).abs() <= 1 && (a.$2 - b.$2).abs() <= 1;

  void _onMove(PointerMoveEvent e) {
    if (e.pointer != _pointer || _stopped) return;
    final down = _down!;
    final pos = _hit(e.localPosition, clamp: true)!;
    if (!_moved) {
      if (pos == down) return;
      _moved = true;
      final dr = (pos.$1 - down.$1).abs();
      final dc = (pos.$2 - down.$2).abs();
      _axis = dc >= dr ? Axis.horizontal : Axis.vertical;
      if (!_mark(down, _action)) {
        _stopped = true;
        return;
      }
    }
    final target = _axis == Axis.horizontal
        ? (down.$1, pos.$2)
        : (pos.$1, down.$2);
    var current = _last!;
    while (current != target) {
      current = (
        current.$1 + (target.$1 - current.$1).sign,
        current.$2 + (target.$2 - current.$2).sign,
      );
      _last = current;
      _step++;
      if (!_mark(current, _action, step: _step)) {
        _stopped = true;
        break;
      }
    }
    setState(() => _pressed = _stopped ? null : _last);
  }

  void _onUp(PointerEvent e) {
    if (e.pointer != _pointer) return;
    _pointer = null;
    final down = _down;
    if (down != null && !_moved) {
      if (_isSecondTap) {
        _mark(down, MoveAction.fill);
      } else {
        _pendingTap = down;
        _singleTap = Timer(kDoubleTapTimeout, () {
          _pendingTap = null;
          _mark(down, MoveAction.cross);
          if (mounted) setState(() => _pressed = null);
        });
        return; // keep the pressed highlight while we wait
      }
    }
    setState(() => _pressed = null);
  }

  bool _mark(_Pos p, MoveAction action, {int step = 0}) {
    if (!_state.board.at(p.$1, p.$2).isLocked) {
      unawaited(HapticFeedback.selectionClick());
    }
    return widget.onMark(p.$1, p.$2, action, step: step);
  }

  // ----------------------------------------------------------------- layout

  @override
  Widget build(BuildContext context) {
    final puzzle = _state.puzzle;
    final maxRowClues = puzzle.rowClues
        .map((c) => max(c.length, 1))
        .reduce(max);
    final maxColClues = puzzle.colClues
        .map((c) => max(c.length, 1))
        .reduce(max);

    return LayoutBuilder(
      builder: (context, constraints) {
        final rowClueUnits = 0.55 * maxRowClues + 0.45;
        final colClueUnits = 0.5 * maxColClues + 0.5;
        _cell = min(
          min(
            constraints.maxWidth / (_cols + rowClueUnits),
            constraints.maxHeight / (_rows + colClueUnits),
          ),
          76,
        );
        final rowClueWidth = rowClueUnits * _cell;
        final colClueHeight = colClueUnits * _cell;
        final fontSize = (_cell * 0.42).clamp(11, 28).toDouble();

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: rowClueWidth),
                for (var c = 0; c < _cols; c++)
                  _ClueChip(
                    clue: puzzle.colClues[c],
                    solved: _state.board.solvedCols.contains(c),
                    vertical: true,
                    width: _cell,
                    height: colClueHeight,
                    fontSize: fontSize,
                  ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    for (var r = 0; r < _rows; r++)
                      _ClueChip(
                        clue: puzzle.rowClues[r],
                        solved: _state.board.solvedRows.contains(r),
                        vertical: false,
                        width: rowClueWidth,
                        height: _cell,
                        fontSize: fontSize,
                      ),
                  ],
                ),
                _grid(),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _grid() {
    final puzzle = _state.puzzle;
    final won = _state.status == GameStatus.won;
    final fx = _state.fx;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.board,
        borderRadius: BorderRadius.circular(_cell * 0.3),
        boxShadow: [
          BoxShadow(
            color: AppColors.blockShadow.withValues(alpha: 0.35),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Listener(
        onPointerDown: _onDown,
        onPointerMove: _onMove,
        onPointerUp: _onUp,
        onPointerCancel: _onUp,
        child: SizedBox(
          key: _gridKey,
          width: _cols * _cell,
          height: _rows * _cell,
          child: CustomPaint(
            painter: _GuidePainter(_rows, _cols, _cell),
            child: Stack(
              children: [
                for (var r = 0; r < _rows; r++)
                  for (var c = 0; c < _cols; c++)
                    Positioned(
                      left: c * _cell,
                      top: r * _cell,
                      child: BoardCell(
                        cell: _state.board.at(r, c),
                        size: _cell,
                        pressed: _pressed == (r, c),
                        entranceDelay:
                            fx == null ||
                                _state.board.at(r, c).source != MarkSource.auto
                            ? Duration.zero
                            : _waveStep *
                                  ((r - fx.row).abs() + (c - fx.col).abs()),
                        flashSeq: _flashSeq[r * _cols + c],
                        flashDelay: _flashDelay[r * _cols + c] ?? Duration.zero,
                        revealColor: !won
                            ? null
                            : puzzle.isFilled(r, c)
                            ? Color(puzzle.colorAt(r, c)!)
                            : Colors.transparent,
                        revealDelay: Duration(
                          milliseconds: 500 + (r + c) * 80,
                        ),
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Thin guides every 5 cells on larger boards.
class _GuidePainter extends CustomPainter {
  const _GuidePainter(this.rows, this.cols, this.cell);

  final int rows;
  final int cols;
  final double cell;

  @override
  void paint(Canvas canvas, Size size) {
    if (rows < 10 && cols < 10) return;
    final paint = Paint()
      ..color = AppColors.crossAuto.withValues(alpha: 0.5)
      ..strokeWidth = 1.5;
    for (var c = 5; c < cols; c += 5) {
      canvas.drawLine(
        Offset(c * cell, 4),
        Offset(c * cell, size.height - 4),
        paint,
      );
    }
    for (var r = 5; r < rows; r += 5) {
      canvas.drawLine(
        Offset(4, r * cell),
        Offset(size.width - 4, r * cell),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_GuidePainter old) =>
      old.cell != cell || old.rows != rows || old.cols != cols;
}

class _ClueChip extends StatelessWidget {
  const _ClueChip({
    required this.clue,
    required this.solved,
    required this.vertical,
    required this.width,
    required this.height,
    required this.fontSize,
  });

  final List<int> clue;
  final bool solved;
  final bool vertical;
  final double width;
  final double height;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final numbers = clue.isEmpty ? const [0] : clue;
    final style = TextStyle(
      fontSize: fontSize,
      height: 1.1,
      fontWeight: FontWeight.w700,
      color: solved ? AppColors.goldDeep : AppColors.clueText,
    );
    final text = vertical
        ? Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [for (final n in numbers) Text('$n', style: style)],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              for (final n in numbers)
                Padding(
                  padding: EdgeInsets.only(left: fontSize * 0.35),
                  child: Text('$n', style: style),
                ),
            ],
          );

    return SizedBox(
      width: width,
      height: height,
      child: Padding(
        padding: EdgeInsets.all(min(width, height) * 0.05),
        child:
            AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: EdgeInsets.symmetric(
                    horizontal: vertical ? 0 : fontSize * 0.35,
                    vertical: vertical ? fontSize * 0.3 : 0,
                  ),
                  decoration: BoxDecoration(
                    color: solved
                        ? AppColors.gold
                        : AppColors.clueChip.withValues(alpha: 0.85),
                    borderRadius: BorderRadius.circular(fontSize * 0.5),
                  ),
                  alignment: vertical
                      ? Alignment.bottomCenter
                      : Alignment.centerRight,
                  child: FittedBox(fit: BoxFit.scaleDown, child: text),
                )
                .animate(target: solved ? 1 : 0)
                .scaleXY(begin: 1, end: 1.18, duration: 160.ms)
                .then()
                .scaleXY(begin: 1, end: 1 / 1.18, duration: 220.ms),
      ),
    );
  }
}
