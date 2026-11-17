import 'dart:math';

import 'package:block_puzzle/app/theme.dart';
import 'package:flutter/material.dart';

/// Glossy jelly-like rounded block.
class JellyPainter extends CustomPainter {
  JellyPainter({required this.color, Color? top, Color? shadow, this.glow = 0})
    : top = top ?? Color.lerp(color, Colors.white, 0.25)!,
      shadow = shadow ?? Color.lerp(color, Colors.black, 0.4)!;

  /// The default deep-blue game block.
  JellyPainter.blue({double glow = 0})
    : this(
        color: AppColors.block,
        top: AppColors.blockTop,
        shadow: AppColors.blockShadow,
        glow: glow,
      );

  final Color color;
  final Color top;
  final Color shadow;

  /// 0..1 white glow used by line-complete flashes.
  final double glow;

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.shortestSide;
    final inset = s * 0.05;
    final radius = Radius.circular(s * 0.24);
    final body = Rect.fromLTWH(
      inset,
      inset,
      size.width - inset * 2,
      size.height - inset * 2 - s * 0.07,
    );

    canvas
      ..drawRRect(
        RRect.fromRectAndRadius(body.shift(Offset(0, s * 0.07)), radius),
        Paint()..color = shadow,
      )
      ..drawRRect(
        RRect.fromRectAndRadius(body, radius),
        Paint()
          ..shader = LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [top, color],
          ).createShader(body),
      )
      ..drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            body.left + body.width * 0.16,
            body.top + body.height * 0.1,
            body.width * 0.42,
            body.height * 0.13,
          ),
          Radius.circular(s * 0.08),
        ),
        Paint()..color = Colors.white.withValues(alpha: 0.55),
      )
      ..drawCircle(
        Offset(body.left + body.width * 0.76, body.top + body.height * 0.17),
        s * 0.045,
        Paint()..color = Colors.white.withValues(alpha: 0.7),
      );

    if (glow > 0) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(body, radius),
        Paint()..color = Colors.white.withValues(alpha: 0.65 * glow),
      );
    }
  }

  @override
  bool shouldRepaint(JellyPainter old) =>
      old.color != color || old.top != top || old.glow != glow;
}

/// An X drawn stroke by stroke as [progress] goes 0 → 1.
class CrossPainter extends CustomPainter {
  const CrossPainter({
    required this.color,
    required this.thickness,
    this.progress = 1,
  });

  final Color color;
  final double thickness;
  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.shortestSide;
    final a = s * 0.3;
    final b = s * 0.7;
    final paint = Paint()
      ..color = color
      ..strokeWidth = s * thickness
      ..strokeCap = StrokeCap.round;
    final first = min(progress * 2, 1).toDouble();
    final second = max(progress * 2 - 1, 0).toDouble();
    canvas.drawLine(
      Offset(a, a),
      Offset.lerp(Offset(a, a), Offset(b, b), first)!,
      paint,
    );
    if (second > 0) {
      canvas.drawLine(
        Offset(b, a),
        Offset.lerp(Offset(b, a), Offset(a, b), second)!,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CrossPainter old) =>
      old.progress != progress || old.color != color;
}
