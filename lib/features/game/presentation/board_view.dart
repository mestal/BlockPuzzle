import 'dart:async';
import 'dart:math';

import 'package:block_puzzle/app/theme.dart';
import 'package:block_puzzle/core/widgets/particles.dart';
import 'package:block_puzzle/features/game/application/game_controller.dart';
import 'package:block_puzzle/features/game/domain/board.dart';
import 'package:block_puzzle/features/game/domain/hint.dart';
import 'package:block_puzzle/features/game/domain/tutorial.dart';
import 'package:block_puzzle/features/game/presentation/board_cell.dart';
import 'package:block_puzzle/features/game/presentation/tutorial_overlay.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// [step] is how many cells the current drag has covered (0 for a tap).
typedef MarkCallback =
    bool Function(int row, int col, MoveAction action, {int step});

/// Clues + grid. Gestures:
/// * single tap → fill, single press-and-drag → fill along a line
///   (cells holding the player's X are skipped: remove the X first); a
///   single press-and-drag that starts on an X draws X marks instead
/// * double tap → X (or removes a manual X), double tap with the 2nd press
///   dragged → X along a line; starting that drag on a manual X removes the
///   manual X marks along the line instead
class BoardView extends StatefulWidget {
  const BoardView({
    required this.state,
    required this.onMark,
    required this.particles,
    this.onStrokeStart,
    this.onStrokeEnd,
    this.guide,
    super.key,
  });

  final GameState state;
  final MarkCallback onMark;

  final ParticleController particles;

  /// A finger went down on / lifted off the grid.
  final VoidCallback? onStrokeStart;
  final VoidCallback? onStrokeEnd;

  /// The tutorial step to act out on the board, if any.
  final TutorialStep? guide;

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
  MoveAction _action = MoveAction.fill;
  bool _isSecondTap = false;
  bool _moved = false;
  bool _stopped = false;
  int _step = 0;
  Axis? _axis;
  Timer? _singleTap;
  _Pos? _pendingTap;
  Offset? _pendingTapAt;
  Offset _downAt = Offset.zero;
  _Pos? _pressed;

  /// Cell drawn as filled before the tap is committed, so a single tap feels
  /// instant even though it waits [kDoubleTapTimeout] for a second tap. It
  /// always looks like a correct fill: the result is revealed on commit.
  _Pos? _preview;

  // Effects.
  final _flashSeq = <int, int>{};
  final _flashDelay = <int, Duration>{};

  GameState get _state => widget.state;
  TutorialStep? get _guide => widget.guide;
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

  /// How a previewed tap is drawn: like a correct fill.
  static const _previewCell = Cell(CellMark.filled);

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
    final pendingAt = _pendingTapAt;
    _singleTap?.cancel();
    _pendingTap = null;
    _pendingTapAt = null;
    if (pending != null &&
        pendingAt != null &&
        _isSameSpot(pending, pendingAt, pos, e.localPosition)) {
      // Second tap: X, or - starting on the player's own X - remove X marks.
      _isSecondTap = true;
      _down = pending;
      _preview = null;
      _action = _state.board.at(pending.$1, pending.$2).isUserCross
          ? MoveAction.erase
          : MoveAction.cross;
    } else {
      // A quick tap on another cell is a new single tap: settle the
      // previous one as a fill right away.
      if (pending != null) _commitFill(pending);
      _isSecondTap = false;
      // A drag that starts on an X keeps drawing X marks, never fills.
      _action = _state.board.at(pos.$1, pos.$2).mark == CellMark.crossed
          ? MoveAction.cross
          : MoveAction.fill;
      _down = pos;
      if (!_state.board.at(pos.$1, pos.$2).isOpen) {
        _preview = pos;
        // Drawn and felt at once; the sound waits for the move itself, so a
        // double tap plays only the X sound.
        unawaited(HapticFeedback.selectionClick());
      }
    }
    widget.onStrokeStart?.call();
    _downAt = e.localPosition;
    _last = _down;
    _moved = false;
    _stopped = false;
    _step = 0;
    _axis = null;
    setState(() => _pressed = _down);
  }

  /// Whether a second press counts as a double tap on the first one: same
  /// cell, or a few pixels across a cell border (fat-finger tolerance).
  bool _isSameSpot(_Pos first, Offset firstAt, _Pos second, Offset secondAt) =>
      first == second ||
      (firstAt - secondAt).distance < min(_cell * 0.3, _doubleTapSlop);

  static const _doubleTapSlop = 12.0;

  void _onMove(PointerMoveEvent e) {
    if (e.pointer != _pointer || _stopped) return;
    final down = _down!;
    final pos = _hit(e.localPosition, clamp: true)!;
    if (!_moved) {
      // Ignore jitter: a drag starts once the finger reaches another cell
      // and has travelled a little.
      if (pos == down || (e.localPosition - _downAt).distance < _cell * 0.3) {
        return;
      }
      _moved = true;
      final dr = (pos.$1 - down.$1).abs();
      final dc = (pos.$2 - down.$2).abs();
      _axis = dc >= dr ? Axis.horizontal : Axis.vertical;
      final first = _action == MoveAction.fill
          ? _commitFill(down)
          : _mark(down, _action);
      if (!first) {
        _stopped = true;
        return;
      }
    }
    final target = _axis == Axis.horizontal
        ? (down.$1, pos.$2)
        : (pos.$1, down.$2);
    var current = _last!;
    if (current == target) return;
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
    widget.onStrokeEnd?.call();
    final down = _down;
    if (down != null && !_moved && e is PointerUpEvent) {
      if (_isSecondTap) {
        _mark(down, _action);
      } else {
        _pendingTap = down;
        _pendingTapAt = _downAt;
        _singleTap = Timer(kDoubleTapTimeout, () {
          _pendingTap = null;
          _pendingTapAt = null;
          _commitFill(down);
          if (mounted) setState(() => _pressed = null);
        });
        return; // keep the pressed highlight while we wait
      }
    }
    setState(() {
      _pressed = null;
      // A cancelled touch never commits, so drop its preview.
      if (e is! PointerUpEvent && _preview == down) _preview = null;
    });
  }

  /// Commits the fill of [p]; quiet (no second haptic) when its preview
  /// already gave one.
  bool _commitFill(_Pos p) {
    final quiet = _preview == p;
    if (quiet) _preview = null;
    return _mark(p, MoveAction.fill, quiet: quiet);
  }

  bool _mark(_Pos p, MoveAction action, {int step = 0, bool quiet = false}) {
    final cell = _state.board.at(p.$1, p.$2);
    final acts = switch (action) {
      MoveAction.fill => !cell.isOpen,
      MoveAction.cross => !cell.isOpen,
      MoveAction.erase => cell.isUserCross,
    };
    if (acts && !quiet) unawaited(HapticFeedback.selectionClick());
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

    // Clues and cells keep their left-to-right order in every language
    // (including right-to-left ones): the clues must line up with the grid.
    return Directionality(
      textDirection: TextDirection.ltr,
      child: _layout(maxRowClues, maxColClues),
    );
  }

  Widget _layout(int maxRowClues, int maxColClues) {
    final puzzle = _state.puzzle;
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
        final hint = _state.hint;
        final won = _state.status == GameStatus.won;
        // A tutorial step spotlights its lines: their clues pulse, the other
        // clues fade back.
        final focus = hint == null && !won
            ? _guide?.focus ?? const <TutorialLine>[]
            : const <TutorialLine>[];
        bool focused(TutorialLine line) => focus.contains(line);

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
                    highlighted:
                        (hint != null && !hint.isRow && hint.line == c) ||
                        focused((isRow: false, index: c)),
                    pulsing: focused((isRow: false, index: c)),
                    dimmed:
                        focus.isNotEmpty && !focused((isRow: false, index: c)),
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
                        highlighted:
                            (hint != null && hint.isRow && hint.line == r) ||
                            focused((isRow: true, index: r)),
                        pulsing: focused((isRow: true, index: r)),
                        dimmed:
                            focus.isNotEmpty &&
                            !focused((isRow: true, index: r)),
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
        // Cell animations repaint only the grid, not the whole screen.
        child: RepaintBoundary(
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
                          cell:
                              _preview == (r, c) &&
                                  !_state.board.at(r, c).isOpen
                              ? _previewCell
                              : _state.board.at(r, c),
                          size: _cell,
                          pressed: _pressed == (r, c),
                          entranceDelay:
                              fx == null ||
                                  _state.board.at(r, c).source !=
                                      MarkSource.auto
                              ? Duration.zero
                              : _waveStep *
                                    ((r - fx.row).abs() + (c - fx.col).abs()),
                          flashSeq: _flashSeq[r * _cols + c],
                          flashDelay:
                              _flashDelay[r * _cols + c] ?? Duration.zero,
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
                  if (_state.hint case final hint? when !won)
                    _HintLine(
                      hint: hint,
                      cell: _cell,
                      rows: _rows,
                      cols: _cols,
                    )
                  else if (_guide case final guide? when !won)
                    TutorialGuide(
                      step: guide,
                      board: _state.board,
                      cell: _cell,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Guides after every 5 cells, so long lines can be counted in blocks of 5.
class _GuidePainter extends CustomPainter {
  const _GuidePainter(this.rows, this.cols, this.cell);

  final int rows;
  final int cols;
  final double cell;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.block.withValues(alpha: 0.45)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
    for (var c = 5; c < cols; c += 5) {
      canvas.drawLine(
        Offset(c * cell, 2),
        Offset(c * cell, size.height - 2),
        paint,
      );
    }
    for (var r = 5; r < rows; r += 5) {
      canvas.drawLine(
        Offset(2, r * cell),
        Offset(size.width - 2, r * cell),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_GuidePainter old) =>
      old.cell != cell || old.rows != rows || old.cols != cols;
}

/// Outlines the line that explains the current hint and rings its cell.
class _HintLine extends StatelessWidget {
  const _HintLine({
    required this.hint,
    required this.cell,
    required this.rows,
    required this.cols,
  });

  final Hint hint;
  final double cell;
  final int rows;
  final int cols;

  @override
  Widget build(BuildContext context) {
    final line = hint.isRow
        ? Rect.fromLTWH(0, hint.line * cell, cols * cell, cell)
        : Rect.fromLTWH(hint.line * cell, 0, cell, rows * cell);
    final target = Rect.fromLTWH(hint.col * cell, hint.row * cell, cell, cell);
    return Positioned.fill(
      child: IgnorePointer(
        child: Stack(
          children: [
            Positioned.fromRect(
              rect: line,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.gold.withValues(alpha: 0.16),
                  border: Border.all(color: AppColors.gold, width: 2.5),
                  borderRadius: BorderRadius.circular(cell * 0.25),
                ),
              ),
            ),
            Positioned.fromRect(
              rect: target.deflate(cell * 0.02),
              child:
                  DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.goldDeep,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(cell * 0.25),
                        ),
                      )
                      .animate(onPlay: (c) => c.repeat(reverse: true))
                      .scaleXY(begin: 1, end: 1.1, duration: 600.ms),
            ),
          ],
        ),
      ),
    ).animate(key: ValueKey(hint)).fadeIn(duration: 250.ms);
  }
}

class _ClueChip extends StatelessWidget {
  const _ClueChip({
    required this.clue,
    required this.solved,
    required this.vertical,
    required this.width,
    required this.height,
    required this.fontSize,
    this.highlighted = false,
    this.pulsing = false,
    this.dimmed = false,
  });

  final List<int> clue;
  final bool solved;
  final bool highlighted;

  /// The clue a tutorial step is about: glows and gently pulses.
  final bool pulsing;

  /// Faded back while a tutorial step spotlights other lines.
  final bool dimmed;
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

    Widget chip = SizedBox(
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
                    border: highlighted
                        ? Border.all(color: AppColors.goldDeep, width: 2.5)
                        : null,
                    boxShadow: pulsing
                        ? [
                            BoxShadow(
                              color: AppColors.gold.withValues(alpha: 0.9),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ]
                        : null,
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
    if (pulsing) {
      chip = chip
          .animate(onPlay: (c) => c.repeat(reverse: true))
          .scaleXY(
            begin: 1,
            end: 1.1,
            duration: 600.ms,
            curve: Curves.easeInOut,
          );
    }
    return AnimatedOpacity(
      opacity: dimmed ? 0.4 : 1,
      duration: const Duration(milliseconds: 300),
      child: chip,
    );
  }
}
