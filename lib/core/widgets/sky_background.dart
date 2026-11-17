import 'dart:math';

import 'package:block_puzzle/app/theme.dart';
import 'package:flutter/material.dart';

/// Animated sunset gradient with drifting glowing bubbles and twinkles.
class SkyBackground extends StatefulWidget {
  const SkyBackground({super.key});

  @override
  State<SkyBackground> createState() => _SkyBackgroundState();
}

class _SkyBackgroundState extends State<SkyBackground>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 24),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => RepaintBoundary(
    child: CustomPaint(
      painter: _SkyPainter(_controller),
      size: Size.infinite,
    ),
  );
}

class _SkyPainter extends CustomPainter {
  _SkyPainter(this.t) : super(repaint: t);

  final Animation<double> t;

  static final _bubbles = List.generate(9, (i) {
    final r = Random(i * 7 + 3);
    return (
      x: r.nextDouble(),
      y: r.nextDouble(),
      radius: 0.12 + r.nextDouble() * 0.22,
      speed: 0.5 + r.nextDouble(),
      phase: r.nextDouble() * 2 * pi,
    );
  });

  static final _stars = List.generate(28, (i) {
    final r = Random(i * 13 + 1);
    return (
      x: r.nextDouble(),
      y: r.nextDouble() * 0.55,
      phase: r.nextDouble() * 2 * pi,
    );
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    canvas.drawRect(
      rect,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.skyTop, AppColors.skyMiddle, AppColors.skyBottom],
          stops: [0, 0.55, 1],
        ).createShader(rect),
    );

    final time = t.value * 2 * pi;
    for (final b in _bubbles) {
      final center = Offset(
        size.width * (b.x + 0.06 * sin(time * b.speed + b.phase)),
        size.height * (b.y + 0.04 * cos(time * b.speed + b.phase)),
      );
      final radius = size.width * b.radius;
      canvas.drawCircle(
        center,
        radius,
        Paint()
          ..shader = RadialGradient(
            colors: [
              Colors.white.withValues(alpha: 0.16),
              Colors.white.withValues(alpha: 0),
            ],
          ).createShader(Rect.fromCircle(center: center, radius: radius)),
      );
    }

    final starPaint = Paint();
    for (final s in _stars) {
      final twinkle = (sin(time * 6 + s.phase) + 1) / 2;
      starPaint.color = Colors.white.withValues(alpha: 0.15 + 0.6 * twinkle);
      canvas.drawCircle(
        Offset(s.x * size.width, s.y * size.height),
        1 + twinkle * 1.4,
        starPaint,
      );
    }
  }

  @override
  bool shouldRepaint(_SkyPainter oldDelegate) => false;
}
