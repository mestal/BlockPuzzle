import 'dart:async';
import 'dart:math';
import 'dart:ui' show lerpDouble;

import 'package:block_puzzle/app/theme.dart';
import 'package:block_puzzle/features/game/domain/tutorial.dart';
import 'package:block_puzzle/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// Drawn over the grid during a tutorial step: the line it is about and a
/// hand that acts out the gesture on loop. Ignores touches.
class TutorialGuide extends StatelessWidget {
  const TutorialGuide({
    required this.step,
    required this.cell,
    required this.rows,
    required this.cols,
    super.key,
  });

  final TutorialStep step;
  final double cell;
  final int rows;
  final int cols;

  @override
  Widget build(BuildContext context) {
    final focus = step.focus;
    return Positioned.fill(
      child: IgnorePointer(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            if (focus != null)
              Positioned.fromRect(
                rect: focus.isRow
                    ? Rect.fromLTWH(0, focus.index * cell, cols * cell, cell)
                    : Rect.fromLTWH(focus.index * cell, 0, cell, rows * cell),
                child:
                    DecoratedBox(
                          decoration: BoxDecoration(
                            color: AppColors.gold.withValues(alpha: 0.14),
                            border: Border.all(
                              color: AppColors.gold,
                              width: 2.5,
                            ),
                            borderRadius: BorderRadius.circular(cell * 0.25),
                          ),
                        )
                        .animate(onPlay: (c) => c.repeat(reverse: true))
                        .fade(begin: 0.55, end: 1, duration: 700.ms),
              ),
            if (step.gesture != null && step.from != null)
              Positioned.fill(
                child: _Hand(
                  gesture: step.gesture!,
                  from: step.from!,
                  to: step.to ?? step.from!,
                  cell: cell,
                ),
              ),
          ],
        ),
      ),
    ).animate(key: ValueKey(step)).fadeIn(duration: 300.ms);
  }
}

/// A pointing hand that taps, double taps or drags, then starts again.
class _Hand extends StatefulWidget {
  const _Hand({
    required this.gesture,
    required this.from,
    required this.to,
    required this.cell,
  });

  final TutorialGesture gesture;
  final CellPos from;
  final CellPos to;
  final double cell;

  @override
  State<_Hand> createState() => _HandState();
}

class _HandState extends State<_Hand> with SingleTickerProviderStateMixin {
  late final _loop = AnimationController(
    vsync: this,
    duration: _duration(widget.gesture),
  );

  @override
  void initState() {
    super.initState();
    unawaited(_loop.repeat());
  }

  static Duration _duration(TutorialGesture g) => switch (g) {
    TutorialGesture.tap => const Duration(milliseconds: 1600),
    TutorialGesture.doubleTap => const Duration(milliseconds: 1900),
    TutorialGesture.drag => const Duration(milliseconds: 2600),
  };

  @override
  void didUpdateWidget(_Hand old) {
    super.didUpdateWidget(old);
    if (old.gesture != widget.gesture) {
      _loop.duration = _duration(widget.gesture);
      unawaited(_loop.repeat());
    }
  }

  @override
  void dispose() {
    _loop.dispose();
    super.dispose();
  }

  Offset _centre(CellPos p) =>
      Offset((p.$2 + 0.5) * widget.cell, (p.$1 + 0.5) * widget.cell);

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: _loop,
    builder: (context, _) {
      final pose = _pose(_loop.value);
      return CustomPaint(
        painter: _HandTrailPainter(
          from: _centre(widget.from),
          to: pose.at,
          cell: widget.cell,
          visible: widget.gesture == TutorialGesture.drag && pose.down,
          ripple: pose.ripple,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [_handAt(pose)],
        ),
      );
    },
  );

  /// Where the hand is at loop time [t] (0..1), and whether it is pressed.
  _Pose _pose(double t) {
    final start = _centre(widget.from);
    double? ripple(double from, double to) =>
        t >= from && t <= to ? (t - from) / (to - from) : null;
    switch (widget.gesture) {
      case TutorialGesture.tap:
        return _Pose(
          at: start,
          down: t > 0.3 && t < 0.42,
          ripple: ripple(0.36, 0.8),
          opacity: _fade(t),
        );
      case TutorialGesture.doubleTap:
        return _Pose(
          at: start,
          down: (t > 0.25 && t < 0.33) || (t > 0.42 && t < 0.5),
          ripple: ripple(0.28, 0.6) ?? ripple(0.45, 0.85),
          opacity: _fade(t),
        );
      case TutorialGesture.drag:
        final end = _centre(widget.to);
        final move = Curves.easeInOut.transform(
          ((t - 0.2) / 0.5).clamp(0.0, 1.0),
        );
        return _Pose(
          at: Offset.lerp(start, end, move)!,
          down: t > 0.12 && t < 0.78,
          opacity: _fade(t),
        );
    }
  }

  /// Fades in at the start of the loop and out at the end.
  static double _fade(double t) => min(t / 0.1, (1 - t) / 0.12).clamp(0.0, 1.0);

  Widget _handAt(_Pose pose) {
    final size = (widget.cell * 1.15).clamp(40.0, 72.0);
    // The fingertip of the icon sits near its top centre.
    final tip = Offset(size * 0.44, size * 0.12);
    return Positioned(
      left: pose.at.dx - tip.dx,
      top: pose.at.dy - tip.dy + (pose.down ? 0 : size * 0.12),
      child: Opacity(
        opacity: pose.opacity,
        child: Transform.scale(
          scale: pose.down ? 0.88 : 1,
          alignment: Alignment.topCenter,
          child: Icon(
            Icons.touch_app_rounded,
            size: size,
            color: Colors.white,
            shadows: const [
              Shadow(color: AppColors.blockShadow, blurRadius: 6),
              Shadow(color: AppColors.blockShadow, offset: Offset(0, 2)),
            ],
          ),
        ),
      ),
    );
  }
}

class _Pose {
  const _Pose({
    required this.at,
    required this.down,
    required this.opacity,
    this.ripple,
  });

  final Offset at;
  final bool down;
  final double opacity;

  /// Progress (0..1) of the ring that marks a tap, or null.
  final double? ripple;
}

/// The glowing trail of a drag and the ring of a tap.
class _HandTrailPainter extends CustomPainter {
  _HandTrailPainter({
    required this.from,
    required this.to,
    required this.cell,
    required this.visible,
    this.ripple,
  });

  final Offset from;
  final Offset to;
  final double cell;
  final bool visible;
  final double? ripple;

  @override
  void paint(Canvas canvas, Size size) {
    if (visible) {
      canvas.drawLine(
        from,
        to,
        Paint()
          ..color = Colors.white.withValues(alpha: 0.55)
          ..strokeWidth = cell * 0.4
          ..strokeCap = StrokeCap.round,
      );
    }
    final r = ripple;
    if (r != null) {
      canvas.drawCircle(
        to,
        lerpDouble(cell * 0.15, cell * 0.6, r)!,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3
          ..color = Colors.white.withValues(alpha: 1 - r),
      );
    }
  }

  @override
  bool shouldRepaint(_HandTrailPainter old) =>
      old.to != to ||
      old.from != from ||
      old.visible != visible ||
      old.ripple != ripple ||
      old.cell != cell;
}

/// The explanation of the current tutorial step, with progress dots, a
/// skip button and - for text-only steps - a "Got it" button.
class TutorialCard extends StatelessWidget {
  const TutorialCard({
    required this.step,
    required this.index,
    required this.count,
    required this.onSkip,
    required this.onAck,
    super.key,
  });

  final TutorialStep step;
  final int index;
  final int count;
  final VoidCallback onSkip;
  final VoidCallback onAck;

  static String text(AppLocalizations l10n, TutorialText text) =>
      switch (text) {
        TutorialText.l1Fill => l10n.tutorialL1Fill,
        TutorialText.l1Drag => l10n.tutorialL1Drag,
        TutorialText.l1Column => l10n.tutorialL1Column,
        TutorialText.l1Finish => l10n.tutorialL1Finish,
        TutorialText.l2Cross => l10n.tutorialL2Cross,
        TutorialText.l2Drag => l10n.tutorialL2Drag,
        TutorialText.l2Rules => l10n.tutorialL2Rules,
      };

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(14, 12, 8, 4),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.96),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.gold, width: 2),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.school_rounded, color: AppColors.goldDeep),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    text(l10n, step.text),
                    style: const TextStyle(
                      color: AppColors.block,
                      fontSize: 15,
                      height: 1.3,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(width: 32),
                for (var i = 0; i < count; i++)
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.only(right: 5),
                    width: i == index ? 18 : 7,
                    height: 7,
                    decoration: BoxDecoration(
                      color: i <= index ? AppColors.gold : AppColors.emptyCell,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                const Spacer(),
                TextButton(
                  onPressed: onSkip,
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.crossAuto,
                  ),
                  child: Text(l10n.tutorialSkip),
                ),
                if (step.needsAck)
                  FilledButton(
                    onPressed: onAck,
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.gold,
                      foregroundColor: AppColors.block,
                      visualDensity: VisualDensity.compact,
                    ),
                    child: Text(l10n.tutorialGotIt),
                  ),
              ],
            ),
          ],
        ),
      ),
    ).animate(key: ValueKey(step)).fadeIn(duration: 250.ms).slideY(begin: 0.3);
  }
}
