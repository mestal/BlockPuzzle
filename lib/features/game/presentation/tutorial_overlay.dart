import 'dart:async';
import 'dart:math';
import 'dart:ui' show lerpDouble;

import 'package:block_puzzle/app/theme.dart';
import 'package:block_puzzle/features/game/domain/board.dart';
import 'package:block_puzzle/features/game/domain/tutorial.dart';
import 'package:block_puzzle/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// Drawn over the grid during a tutorial step: dims everything but the
/// lines the step is about, acts out the clue (see-through blocks, the
/// sliding block of the overlap rule) and shows a hand doing the gesture,
/// with see-through blocks or X marks where it would land. Ignores touches.
class TutorialGuide extends StatelessWidget {
  const TutorialGuide({
    required this.step,
    required this.board,
    required this.cell,
    super.key,
  });

  final TutorialStep step;
  final Board board;
  final double cell;

  int get _rows => board.puzzle.rows;
  int get _cols => board.puzzle.cols;

  Rect _lineRect(TutorialLine line) => line.isRow
      ? Rect.fromLTWH(0, line.index * cell, _cols * cell, cell)
      : Rect.fromLTWH(line.index * cell, 0, cell, _rows * cell);

  @override
  Widget build(BuildContext context) {
    final lines = [for (final line in step.focus) _lineRect(line)];
    final slide = step.slide;
    final hasGhosts =
        step.ghostFills.isNotEmpty || step.ghostCrosses.isNotEmpty;
    return Positioned.fill(
      child: IgnorePointer(
        child: Stack(
          key: ObjectKey(step),
          clipBehavior: Clip.none,
          children: [
            if (lines.isNotEmpty)
              Positioned.fill(
                child: CustomPaint(
                  painter: _SpotlightPainter(lines, cell),
                ).animate().fadeIn(duration: 350.ms),
              ),
            for (final rect in lines)
              Positioned.fromRect(
                rect: rect.inflate(1.5),
                child:
                    DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.gold,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(cell * 0.25),
                            color: AppColors.gold.withValues(alpha: 0.12),
                          ),
                        )
                        .animate(onPlay: (c) => c.repeat(reverse: true))
                        .fade(begin: 0.6, end: 1, duration: 700.ms),
              ),
            if (slide != null && step.focus.isNotEmpty)
              Positioned.fill(
                child: _SlideDemo(
                  line: step.focus.first,
                  length: slide,
                  lineLength: step.focus.first.isRow ? _cols : _rows,
                  cell: cell,
                ),
              ),
            if (hasGhosts)
              Positioned.fill(
                child: _GhostPattern(step: step, board: board, cell: cell),
              ),
            if (step.gesture case final gesture?)
              if (step.from case final from?)
                Positioned.fill(
                  child: _Hand(
                    gesture: gesture,
                    from: from,
                    to: step.to ?? from,
                    board: board,
                    cell: cell,
                    delay: step.selfTry
                        ? const Duration(seconds: 4)
                        : Duration.zero,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------- painting

/// A see-through block: where a fill would go.
void _paintGhostBlock(Canvas canvas, Rect cell, double opacity) {
  if (opacity <= 0) return;
  final r = cell.deflate(cell.width * 0.08);
  final rrect = RRect.fromRectAndRadius(r, Radius.circular(r.width * 0.22));
  canvas
    ..drawRRect(
      rrect,
      Paint()..color = AppColors.blockTop.withValues(alpha: 0.55 * opacity),
    )
    ..drawRRect(
      rrect,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..color = Colors.white.withValues(alpha: 0.85 * opacity),
    );
}

/// A see-through X: where a cross would go.
void _paintGhostCross(Canvas canvas, Rect cell, double opacity) {
  if (opacity <= 0) return;
  final r = cell.deflate(cell.width * 0.27);
  final paint = Paint()
    ..color = AppColors.crossUser.withValues(alpha: 0.75 * opacity)
    ..strokeWidth = cell.width * 0.11
    ..strokeCap = StrokeCap.round;
  canvas
    ..drawLine(r.topLeft, r.bottomRight, paint)
    ..drawLine(r.topRight, r.bottomLeft, paint);
}

/// Covers an X: where an X would be removed.
void _paintGhostErase(Canvas canvas, Rect cell, double opacity) {
  if (opacity <= 0) return;
  final r = cell.deflate(cell.width * 0.06);
  canvas.drawRRect(
    RRect.fromRectAndRadius(r, Radius.circular(r.width * 0.2)),
    Paint()..color = AppColors.emptyCell.withValues(alpha: opacity),
  );
}

Rect _cellRect(CellPos p, double cell) =>
    Rect.fromLTWH(p.$2 * cell, p.$1 * cell, cell, cell);

/// Cells from [from] to [to] along a row or column, both included.
List<CellPos> _path(CellPos from, CellPos to) {
  final steps = max((to.$1 - from.$1).abs(), (to.$2 - from.$2).abs());
  return [
    for (var i = 0; i <= steps; i++)
      (
        from.$1 + (to.$1 - from.$1).sign * i,
        from.$2 + (to.$2 - from.$2).sign * i,
      ),
  ];
}

/// Darkens the grid outside the focused lines.
class _SpotlightPainter extends CustomPainter {
  _SpotlightPainter(this.lines, this.cell);

  final List<Rect> lines;
  final double cell;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..fillType = PathFillType.evenOdd
      ..addRRect(
        RRect.fromRectAndRadius(
          Offset.zero & size,
          Radius.circular(cell * 0.3),
        ),
      );
    // Overlapping lines (a row and a column) form one hole.
    final hole = lines
        .map(
          (r) => Path()
            ..addRRect(
              RRect.fromRectAndRadius(r, Radius.circular(cell * 0.25)),
            ),
        )
        .reduce((a, b) => Path.combine(PathOperation.union, a, b));
    canvas.drawPath(
      Path.combine(PathOperation.difference, path, hole),
      Paint()..color = AppColors.blockShadow.withValues(alpha: 0.5),
    );
  }

  @override
  bool shouldRepaint(_SpotlightPainter old) =>
      old.cell != cell || old.lines.length != lines.length;
}

// ------------------------------------------------------------ slide demo

/// The overlap rule acted out: a block of [length] cells slides from one end
/// of [line] to the other and back. The cells it covers in both places glow
/// gold - they are filled whatever the answer is.
class _SlideDemo extends StatefulWidget {
  const _SlideDemo({
    required this.line,
    required this.length,
    required this.lineLength,
    required this.cell,
  });

  final TutorialLine line;
  final int length;
  final int lineLength;
  final double cell;

  @override
  State<_SlideDemo> createState() => _SlideDemoState();
}

class _SlideDemoState extends State<_SlideDemo>
    with SingleTickerProviderStateMixin {
  late final _loop = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 3600),
  );

  @override
  void initState() {
    super.initState();
    unawaited(_loop.repeat());
  }

  @override
  void dispose() {
    _loop.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => CustomPaint(
    painter: _SlidePainter(
      t: _loop,
      line: widget.line,
      length: widget.length,
      lineLength: widget.lineLength,
      cell: widget.cell,
    ),
  );
}

class _SlidePainter extends CustomPainter {
  _SlidePainter({
    required this.t,
    required this.line,
    required this.length,
    required this.lineLength,
    required this.cell,
  }) : super(repaint: t);

  final Animation<double> t;
  final TutorialLine line;
  final int length;
  final int lineLength;
  final double cell;

  /// Rect of [count] cells starting [start] cells into the line.
  Rect _span(double start, double count) => line.isRow
      ? Rect.fromLTWH(start * cell, line.index * cell, count * cell, cell)
      : Rect.fromLTWH(line.index * cell, start * cell, cell, count * cell);

  /// 0 (block at the start) .. 1 (block at the end), with pauses at both.
  static double _position(double t) {
    double ease(double from, double to) =>
        Curves.easeInOut.transform(((t - from) / (to - from)).clamp(0, 1));
    if (t < 0.5) return ease(0.15, 0.42);
    return 1 - ease(0.65, 0.92);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final room = lineLength - length;
    final pulse = 0.5 + 0.5 * sin(t.value * 4 * pi);

    // The sliding block: one bar, so it reads as a single group.
    final start = _position(t.value) * room;
    final bar = _span(start, length.toDouble()).deflate(cell * 0.07);
    final barShape = RRect.fromRectAndRadius(bar, Radius.circular(cell * 0.22));
    canvas
      ..drawRRect(
        barShape.shift(Offset(0, cell * 0.05)),
        Paint()..color = AppColors.blockShadow.withValues(alpha: 0.45),
      )
      ..drawRRect(
        barShape,
        Paint()..color = AppColors.blockTop.withValues(alpha: 0.82),
      );
    // Seams between its cells, so the length can be counted.
    final seam = Paint()
      ..color = Colors.white.withValues(alpha: 0.45)
      ..strokeWidth = 1.5;
    for (var i = 1; i < length; i++) {
      final at = _span(start + i, 0).topLeft;
      final across = line.isRow
          ? (
              Offset(at.dx, at.dy + cell * 0.2),
              Offset(at.dx, at.dy + cell * 0.8),
            )
          : (
              Offset(at.dx + cell * 0.2, at.dy),
              Offset(at.dx + cell * 0.8, at.dy),
            );
      canvas.drawLine(across.$1, across.$2, seam);
    }
    canvas.drawRRect(
      barShape,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.5
        ..color = Colors.white.withValues(alpha: 0.9),
    );

    // The cells every placement covers: a gold ring on top, pulsing.
    for (var i = room; i < length; i++) {
      final r = _span(i.toDouble(), 1).deflate(cell * 0.02);
      canvas.drawRRect(
        RRect.fromRectAndRadius(r, Radius.circular(cell * 0.24)),
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3 + 2 * pulse
          ..color = AppColors.gold,
      );
    }
  }

  @override
  bool shouldRepaint(_SlidePainter old) =>
      old.cell != cell || old.length != length || old.line != line;
}

// --------------------------------------------------------- ghost pattern

/// How a clue lays out on its line, shown cell by cell on loop: blocks for
/// the filled cells, X marks for the gaps.
class _GhostPattern extends StatefulWidget {
  const _GhostPattern({
    required this.step,
    required this.board,
    required this.cell,
  });

  final TutorialStep step;
  final Board board;
  final double cell;

  @override
  State<_GhostPattern> createState() => _GhostPatternState();
}

class _GhostPatternState extends State<_GhostPattern>
    with SingleTickerProviderStateMixin {
  late final _loop = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 3400),
  );

  @override
  void initState() {
    super.initState();
    unawaited(_loop.repeat());
  }

  @override
  void dispose() {
    _loop.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => CustomPaint(
    painter: _GhostPainter(
      t: _loop,
      step: widget.step,
      board: widget.board,
      cell: widget.cell,
    ),
  );
}

class _GhostPainter extends CustomPainter {
  _GhostPainter({
    required this.t,
    required this.step,
    required this.board,
    required this.cell,
  }) : super(repaint: t);

  final Animation<double> t;
  final TutorialStep step;
  final Board board;
  final double cell;

  @override
  void paint(Canvas canvas, Size size) {
    // Reading order, so each line fills in from left to right.
    final cells = [
      for (final p in step.ghostFills) (p, true),
      for (final p in step.ghostCrosses) (p, false),
    ]..sort((a, b) => (a.$1.$1 * 100 + a.$1.$2) - (b.$1.$1 * 100 + b.$1.$2));
    final fadeOut = ((1 - t.value) / 0.12).clamp(0.0, 1.0);
    for (final (i, (p, fill)) in cells.indexed) {
      if (board.at(p.$1, p.$2).isOpen) continue;
      final appear = ((t.value - 0.08 - i * 0.05) / 0.06).clamp(0.0, 1.0);
      final opacity = min(appear, fadeOut);
      final rect = _cellRect(p, cell);
      // Pops in from a little smaller.
      final scaled = Rect.fromCenter(
        center: rect.center,
        width: rect.width * (0.7 + 0.3 * appear),
        height: rect.height * (0.7 + 0.3 * appear),
      );
      if (fill) {
        _paintGhostBlock(canvas, scaled, opacity);
      } else {
        _paintGhostCross(canvas, scaled, opacity);
      }
    }
  }

  @override
  bool shouldRepaint(_GhostPainter old) =>
      old.step != step || old.board != board || old.cell != cell;
}

// ------------------------------------------------------------------ hand

/// A pointing hand that taps, double taps or drags, then starts again. What
/// the gesture would do appears under it (see-through blocks or X marks).
class _Hand extends StatefulWidget {
  const _Hand({
    required this.gesture,
    required this.from,
    required this.to,
    required this.board,
    required this.cell,
    required this.delay,
  });

  final TutorialGesture gesture;
  final CellPos from;
  final CellPos to;
  final Board board;
  final double cell;

  /// How long to wait before the hand first shows up.
  final Duration delay;

  @override
  State<_Hand> createState() => _HandState();
}

class _HandState extends State<_Hand> with SingleTickerProviderStateMixin {
  late final _loop = AnimationController(
    vsync: this,
    duration: _duration(widget.gesture),
  );
  Timer? _start;
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    if (widget.delay == Duration.zero) {
      _begin();
    } else {
      _start = Timer(widget.delay, _begin);
    }
  }

  void _begin() {
    if (!mounted) return;
    setState(() => _visible = true);
    unawaited(_loop.repeat());
  }

  static Duration _duration(TutorialGesture g) => switch (g) {
    TutorialGesture.tap => const Duration(milliseconds: 1700),
    TutorialGesture.doubleTap => const Duration(milliseconds: 2100),
    TutorialGesture.drag => const Duration(milliseconds: 2700),
    TutorialGesture.crossDrag => const Duration(milliseconds: 3200),
  };

  @override
  void dispose() {
    _start?.cancel();
    _loop.dispose();
    super.dispose();
  }

  Offset _centre(CellPos p) =>
      Offset((p.$2 + 0.5) * widget.cell, (p.$1 + 0.5) * widget.cell);

  @override
  Widget build(BuildContext context) {
    if (!_visible) return const SizedBox.shrink();
    return AnimatedBuilder(
      animation: _loop,
      builder: (context, _) {
        final pose = _pose(_loop.value);
        return CustomPaint(
          painter: _HandPainter(
            pose: pose,
            gesture: widget.gesture,
            path: _path(widget.from, widget.to),
            board: widget.board,
            cell: widget.cell,
            from: _centre(widget.from),
          ),
          child: Stack(clipBehavior: Clip.none, children: _hand(pose)),
        );
      },
    );
  }

  /// Where the hand is at loop time [t] (0..1), and what it is doing.
  _Pose _pose(double t) {
    final start = _centre(widget.from);
    final end = _centre(widget.to);
    double? ring(double from, double to) =>
        t >= from && t <= to ? (t - from) / (to - from) : null;
    double move(double from, double to) =>
        Curves.easeInOut.transform(((t - from) / (to - from)).clamp(0.0, 1.0));
    final fade = _fade(t);
    switch (widget.gesture) {
      case TutorialGesture.tap:
        return _Pose(
          at: start,
          down: t > 0.3 && t < 0.42,
          ring: ring(0.34, 0.8),
          result: t > 0.36 ? 1 : 0,
          opacity: fade,
        );
      case TutorialGesture.doubleTap:
        return _Pose(
          at: start,
          down: (t > 0.22 && t < 0.29) || (t > 0.37 && t < 0.45),
          ring: ring(0.25, 0.5) ?? ring(0.4, 0.75),
          result: t > 0.42 ? 1 : 0,
          twice: t > 0.15 && t < 0.62,
          opacity: fade,
        );
      case TutorialGesture.drag:
        return _Pose(
          at: Offset.lerp(start, end, move(0.22, 0.72))!,
          down: t > 0.14 && t < 0.8,
          result: t > 0.16 ? move(0.22, 0.72) : -1,
          opacity: fade,
        );
      case TutorialGesture.crossDrag:
        return _Pose(
          at: Offset.lerp(start, end, move(0.36, 0.76))!,
          down: (t > 0.1 && t < 0.16) || (t > 0.24 && t < 0.84),
          ring: ring(0.12, 0.34),
          result: t > 0.27 ? move(0.36, 0.76) : -1,
          twice: t > 0.04 && t < 0.4,
          opacity: fade,
        );
    }
  }

  /// Fades in at the start of the loop and out at the end.
  static double _fade(double t) => min(t / 0.1, (1 - t) / 0.1).clamp(0.0, 1.0);

  List<Widget> _hand(_Pose pose) {
    final size = (widget.cell * 1.2).clamp(42.0, 72.0);
    // The fingertip of the icon sits near its top centre.
    final tip = Offset(size * 0.47, size * 0.1);
    final lift = pose.down ? 0.0 : size * 0.14;
    return [
      Positioned(
        left: pose.at.dx - tip.dx,
        top: pose.at.dy - tip.dy + lift,
        child: Opacity(
          opacity: pose.opacity,
          child: Transform.scale(
            scale: pose.down ? 0.9 : 1,
            alignment: Alignment.topCenter,
            child: Icon(
              Icons.pan_tool_alt_rounded,
              size: size,
              color: Colors.white,
              shadows: const [
                Shadow(color: AppColors.blockShadow, blurRadius: 3),
                Shadow(color: AppColors.blockShadow, offset: Offset(0, 3)),
                Shadow(color: Colors.black26, blurRadius: 10),
              ],
            ),
          ),
        ),
      ),
      // "x2" next to the finger while it double taps.
      if (pose.twice)
        Positioned(
          left: pose.at.dx + size * 0.4,
          top: pose.at.dy - size * 0.55,
          child: Opacity(
            opacity: pose.opacity,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.gold,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: const Text(
                '×2',
                style: TextStyle(
                  color: AppColors.block,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ),
    ];
  }
}

@immutable
class _Pose {
  const _Pose({
    required this.at,
    required this.down,
    required this.opacity,
    required this.result,
    this.ring,
    this.twice = false,
  });

  final Offset at;
  final bool down;
  final double opacity;

  /// How far the gesture's effect has got: for a tap 0 (not yet) or 1
  /// (done); for a drag the share of the path covered, or -1 before the
  /// finger is down.
  final double result;

  /// Progress (0..1) of the ring that marks a tap, or null.
  final double? ring;

  /// Whether to show the "x2" badge.
  final bool twice;
}

/// The effect of the hand's gesture, its drag trail and its tap ring.
class _HandPainter extends CustomPainter {
  _HandPainter({
    required this.pose,
    required this.gesture,
    required this.path,
    required this.board,
    required this.cell,
    required this.from,
  });

  final _Pose pose;
  final TutorialGesture gesture;
  final List<CellPos> path;
  final Board board;
  final double cell;
  final Offset from;

  @override
  void paint(Canvas canvas, Size size) {
    final opacity = pose.opacity;
    // Starting on the player's own X, an X gesture removes X marks.
    final first = board.at(path.first.$1, path.first.$2);
    final erase = first.isUserCross;
    final crosses =
        gesture == TutorialGesture.doubleTap ||
        gesture == TutorialGesture.crossDrag;
    final dragging =
        gesture == TutorialGesture.drag || gesture == TutorialGesture.crossDrag;

    if (pose.result >= 0) {
      final reached = dragging
          ? (pose.result * (path.length - 1) + 0.5).floor()
          : (pose.result >= 1 ? 0 : -1);
      for (var i = 0; i <= reached && i < path.length; i++) {
        final p = path[i];
        final cellNow = board.at(p.$1, p.$2);
        final rect = _cellRect(p, cell);
        if (erase) {
          if (cellNow.isUserCross) _paintGhostErase(canvas, rect, opacity);
        } else if (!cellNow.isOpen) {
          if (crosses) {
            _paintGhostCross(canvas, rect, opacity);
          } else {
            _paintGhostBlock(canvas, rect, opacity);
          }
        }
      }
    }

    if (dragging && pose.down && pose.result >= 0) {
      canvas.drawLine(
        from,
        pose.at,
        Paint()
          ..color = Colors.white.withValues(alpha: 0.45 * opacity)
          ..strokeWidth = cell * 0.36
          ..strokeCap = StrokeCap.round,
      );
    }
    final r = pose.ring;
    if (r != null) {
      canvas.drawCircle(
        pose.at,
        lerpDouble(cell * 0.15, cell * 0.65, r)!,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3
          ..color = Colors.white.withValues(alpha: (1 - r) * opacity),
      );
    }
  }

  @override
  bool shouldRepaint(_HandPainter old) => true;
}

// ---------------------------------------------------------------- mascot

/// Bloo, the jelly block who explains the tutorial: bobs, blinks, and hops
/// when [cheer] changes.
class TutorialMascot extends StatefulWidget {
  const TutorialMascot({this.size = 52, this.cheer = 0, super.key});

  final double size;

  /// Bumped to make the mascot hop.
  final int cheer;

  @override
  State<TutorialMascot> createState() => _TutorialMascotState();
}

class _TutorialMascotState extends State<TutorialMascot>
    with TickerProviderStateMixin {
  late final _idle = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 3600),
  );
  late final _hop = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 520),
  );

  @override
  void initState() {
    super.initState();
    unawaited(_idle.repeat());
  }

  @override
  void didUpdateWidget(TutorialMascot old) {
    super.didUpdateWidget(old);
    if (old.cheer != widget.cheer) unawaited(_hop.forward(from: 0));
  }

  @override
  void dispose() {
    _idle.dispose();
    _hop.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: Listenable.merge([_idle, _hop]),
    builder: (context, _) {
      final t = _idle.value;
      final hop = sin(_hop.value * pi);
      final bob = sin(t * 2 * pi) * widget.size * 0.03;
      // A quick blink near the end of each idle loop.
      final blink = t > 0.9 && t < 0.95 ? 0.1 : 1.0;
      // Squash before the jump, stretch in the air.
      final squash = 1 + 0.08 * sin(_hop.value * 2 * pi);
      return Transform.translate(
        offset: Offset(0, bob - hop * widget.size * 0.3),
        child: Transform.scale(
          scaleX: squash,
          scaleY: 2 - squash,
          alignment: Alignment.bottomCenter,
          child: CustomPaint(
            size: Size.square(widget.size),
            painter: _MascotPainter(blink: blink, happy: hop > 0.05),
          ),
        ),
      );
    },
  );
}

class _MascotPainter extends CustomPainter {
  _MascotPainter({required this.blink, required this.happy});

  final double blink;
  final bool happy;

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.width;
    final body = Rect.fromLTWH(s * 0.06, s * 0.08, s * 0.88, s * 0.84);
    final radius = Radius.circular(s * 0.26);
    // Bottom shadow, then the jelly body.
    canvas
      ..drawRRect(
        RRect.fromRectAndRadius(body.translate(0, s * 0.06), radius),
        Paint()..color = AppColors.blockShadow,
      )
      ..drawRRect(
        RRect.fromRectAndRadius(body, radius),
        Paint()
          ..shader = const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.blockTop, AppColors.block],
          ).createShader(body),
      )
      // Shine.
      ..drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(s * 0.18, s * 0.15, s * 0.38, s * 0.13),
          Radius.circular(s * 0.07),
        ),
        Paint()..color = AppColors.blockShine.withValues(alpha: 0.7),
      );

    // Cheeks.
    final cheek = Paint()..color = AppColors.heart.withValues(alpha: 0.45);
    canvas
      ..drawCircle(Offset(s * 0.24, s * 0.62), s * 0.07, cheek)
      ..drawCircle(Offset(s * 0.76, s * 0.62), s * 0.07, cheek);

    // Eyes, looking a little to the side (towards the text).
    final white = Paint()..color = Colors.white;
    final pupil = Paint()..color = AppColors.blockShadow;
    for (final x in [0.36, 0.64]) {
      final eye = Rect.fromCenter(
        center: Offset(s * x, s * 0.47),
        width: s * 0.17,
        height: s * 0.21 * blink,
      );
      canvas.drawOval(eye, white);
      if (blink > 0.5) {
        canvas
          ..drawCircle(Offset(s * (x + 0.025), s * 0.49), s * 0.055, pupil)
          ..drawCircle(Offset(s * (x + 0.045), s * 0.465), s * 0.02, white);
      }
    }

    // Smile; wider when happy.
    final mouth = Rect.fromCenter(
      center: Offset(s * 0.5, s * (happy ? 0.62 : 0.64)),
      width: s * (happy ? 0.26 : 0.18),
      height: s * (happy ? 0.2 : 0.12),
    );
    canvas.drawArc(
      mouth,
      0.15 * pi,
      0.7 * pi,
      happy,
      happy
          ? (Paint()..color = AppColors.blockShadow)
          : (Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = s * 0.045
              ..strokeCap = StrokeCap.round
              ..color = AppColors.blockShadow),
    );
  }

  @override
  bool shouldRepaint(_MascotPainter old) =>
      old.blink != blink || old.happy != happy;
}

// ------------------------------------------------------------------ card

/// The mascot's explanation of the current step: lesson number, progress
/// dots, skip, and - for text-only steps - a "Got it" button. Keeps a steady
/// height so the board does not jump between steps.
class TutorialCard extends StatefulWidget {
  const TutorialCard({
    required this.lesson,
    required this.step,
    required this.index,
    required this.count,
    required this.onSkip,
    required this.onAck,
    super.key,
  });

  final int lesson;
  final TutorialStep step;
  final int index;
  final int count;
  final VoidCallback onSkip;
  final VoidCallback onAck;

  static String text(AppLocalizations l10n, TutorialText text) =>
      switch (text) {
        TutorialText.welcome => l10n.tutorialWelcome,
        TutorialText.l1Fill => l10n.tutorialL1Fill,
        TutorialText.l1Drag => l10n.tutorialL1Drag,
        TutorialText.l1Row => l10n.tutorialL1Row,
        TutorialText.l1AutoCross => l10n.tutorialL1AutoCross,
        TutorialText.l1Column => l10n.tutorialL1Column,
        TutorialText.l1Count => l10n.tutorialL1Count,
        TutorialText.l1Finish => l10n.tutorialL1Finish,
        TutorialText.l2Groups => l10n.tutorialL2Groups,
        TutorialText.l2Cross => l10n.tutorialL2Cross,
        TutorialText.l2Drag => l10n.tutorialL2Drag,
        TutorialText.l2CrossSelf => l10n.tutorialL2CrossSelf,
        TutorialText.l2DragSelf => l10n.tutorialL2DragSelf,
        TutorialText.l2Mistakes => l10n.tutorialL2Mistakes,
        TutorialText.l2Finish => l10n.tutorialL2Finish,
        TutorialText.l3Overlap => l10n.tutorialL3Overlap,
        TutorialText.l3OverlapFill => l10n.tutorialL3OverlapFill,
        TutorialText.l3OverlapSelf => l10n.tutorialL3OverlapSelf,
        TutorialText.l3OverlapRow => l10n.tutorialL3OverlapRow,
        TutorialText.l3Finish => l10n.tutorialL3Finish,
        TutorialText.l4Ones => l10n.tutorialL4Ones,
        TutorialText.l4CrossDrag => l10n.tutorialL4CrossDrag,
        TutorialText.l4CrossDragSelf => l10n.tutorialL4CrossDragSelf,
        TutorialText.l4Erase => l10n.tutorialL4Erase,
        TutorialText.l4Finish => l10n.tutorialL4Finish,
        TutorialText.l5Sum => l10n.tutorialL5Sum,
        TutorialText.l5Hint => l10n.tutorialL5Hint,
        TutorialText.l5Finish => l10n.tutorialL5Finish,
      };

  /// `[2 2]` → a clue chip; sums like `2 + 1 + 2 = 5` keep left-to-right
  /// order in right-to-left languages.
  /// Left-to-right isolate and its end (U+2066, U+2069).
  static final _isolate = String.fromCharCode(0x2066);
  static final _popIsolate = String.fromCharCode(0x2069);

  static final _markup = RegExp(r'\[([^\]]+)\]|(\d+(?:\s*[+=]\s*\d+)+)');

  static List<InlineSpan> spans(String text, double fontSize) {
    final spans = <InlineSpan>[];
    var at = 0;
    for (final m in _markup.allMatches(text)) {
      if (m.start > at) spans.add(TextSpan(text: text.substring(at, m.start)));
      if (m.group(1) case final clue?) {
        spans.add(
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: _ClueBadge(clue: clue, fontSize: fontSize),
          ),
        );
      } else {
        spans.add(TextSpan(text: '$_isolate${m.group(2)}$_popIsolate'));
      }
      at = m.end;
    }
    if (at < text.length) spans.add(TextSpan(text: text.substring(at)));
    return spans;
  }

  @override
  State<TutorialCard> createState() => _TutorialCardState();
}

class _TutorialCardState extends State<TutorialCard> {
  /// Bumped when the player completes a step: the mascot hops.
  int _cheer = 0;

  @override
  void didUpdateWidget(TutorialCard old) {
    super.didUpdateWidget(old);
    if (widget.index > old.index && !old.step.needsAck) {
      _cheer++;
      unawaited(HapticFeedback.lightImpact());
    }
  }

  static const _mascot = 50.0;
  static const _fontSize = 15.0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final step = widget.step;
    final first = widget.lesson == 1 && widget.index == 0;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 22, 16, 0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(14, 6, 6, 8),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.97),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.gold, width: 2.5),
              boxShadow: [
                BoxShadow(
                  color: AppColors.blockShadow.withValues(alpha: 0.3),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _Header(
                  lesson: widget.lesson,
                  index: widget.index,
                  count: widget.count,
                  onSkip: widget.onSkip,
                  indent: _mascot,
                ),
                // Room for three lines, so short texts do not shrink the
                // card (and move the board).
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: _fontSize * 1.35 * 3,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child:
                        Text.rich(
                              TextSpan(
                                children: TutorialCard.spans(
                                  TutorialCard.text(l10n, step.text),
                                  _fontSize,
                                ),
                              ),
                              key: ValueKey(step),
                              style: const TextStyle(
                                color: AppColors.block,
                                fontSize: _fontSize,
                                height: 1.35,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                            .animate(key: ValueKey(step))
                            .fadeIn(duration: 260.ms)
                            .slideX(begin: 0.04, curve: Curves.easeOut),
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: step.needsAck
                        ? FilledButton(
                                onPressed: widget.onAck,
                                style: FilledButton.styleFrom(
                                  backgroundColor: AppColors.gold,
                                  foregroundColor: AppColors.block,
                                  visualDensity: VisualDensity.compact,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                ),
                                child: Text(
                                  first
                                      ? l10n.tutorialStart
                                      : l10n.tutorialGotIt,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              )
                              .animate(key: ValueKey(step))
                              .scale(
                                begin: const Offset(0.8, 0.8),
                                delay: 250.ms,
                                duration: 300.ms,
                                curve: Curves.easeOutBack,
                              )
                        // An action step: the hand on the board shows what to
                        // do; this just says "your move".
                        : const Padding(
                                padding: EdgeInsetsDirectional.only(end: 10),
                                child: Icon(
                                  Icons.touch_app_rounded,
                                  color: AppColors.blockTop,
                                ),
                              )
                              .animate(
                                onPlay: (c) => c.repeat(reverse: true),
                              )
                              .moveY(begin: 0, end: -4, duration: 600.ms),
                  ),
                ),
              ],
            ),
          ),
          PositionedDirectional(
            start: 4,
            top: -22,
            child: TutorialMascot(size: _mascot, cheer: _cheer),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.25);
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.lesson,
    required this.index,
    required this.count,
    required this.onSkip,
    required this.indent,
  });

  final int lesson;
  final int index;
  final int count;
  final VoidCallback onSkip;
  final double indent;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Row(
      children: [
        SizedBox(width: indent),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.tutorialLesson(lesson, Tutorial.levels.length),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.goldDeep,
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.4,
                ),
              ),
              const SizedBox(height: 3),
              Row(
                children: [
                  for (var i = 0; i < count; i++)
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOutBack,
                      margin: const EdgeInsetsDirectional.only(end: 4),
                      width: i == index ? 16 : 7,
                      height: 7,
                      decoration: BoxDecoration(
                        color: i < index
                            ? AppColors.gold
                            : i == index
                            ? AppColors.goldDeep
                            : AppColors.emptyCell,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: onSkip,
          style: TextButton.styleFrom(
            foregroundColor: AppColors.crossAuto,
            visualDensity: VisualDensity.compact,
            padding: const EdgeInsets.symmetric(horizontal: 10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(l10n.tutorialSkip),
              const Icon(Icons.skip_next_rounded, size: 18),
            ],
          ),
        ),
      ],
    );
  }
}

/// A clue inside the tutorial text, drawn like a highlighted clue.
class _ClueBadge extends StatelessWidget {
  const _ClueBadge({required this.clue, required this.fontSize});

  final String clue;
  final double fontSize;

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 1),
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
    decoration: BoxDecoration(
      color: AppColors.gold,
      borderRadius: BorderRadius.circular(6),
      border: Border.all(color: AppColors.goldDeep, width: 1.5),
    ),
    child: Text(
      // An en space between numbers, so "1 1 1" does not read as 111.
      clue.split(' ').join(String.fromCharCode(0x2002)),
      textDirection: TextDirection.ltr,
      style: TextStyle(
        color: AppColors.block,
        fontSize: fontSize - 1,
        height: 1.15,
        fontWeight: FontWeight.w800,
      ),
    ),
  );
}

/// Makes a control outside the board (the hearts, the hint button) glow
/// while a tutorial step talks about it.
class TutorialSpot extends StatelessWidget {
  const TutorialSpot({required this.active, required this.child, super.key});

  final bool active;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!active) return child;
    return DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            // White reads on both the sky and the gold hint button.
            boxShadow: [
              BoxShadow(
                color: Colors.white.withValues(alpha: 0.9),
                blurRadius: 22,
                spreadRadius: 4,
              ),
            ],
          ),
          child: DecoratedBox(
            position: DecorationPosition.foreground,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: Colors.white, width: 3),
            ),
            child: child,
          ),
        )
        .animate(onPlay: (c) => c.repeat(reverse: true))
        .scaleXY(
          begin: 1,
          end: 1.12,
          duration: 650.ms,
          curve: Curves.easeInOut,
        );
  }
}
