import 'dart:async';
import 'dart:math';

import 'package:block_puzzle/app/theme.dart';
import 'package:flutter/material.dart';

/// A world's themed background: sky gradient plus drifting scenery that
/// moves slower than the map when [scroll] is given (parallax).
class WorldBackground extends StatefulWidget {
  const WorldBackground({
    required this.palette,
    this.scroll,
    this.animate = true,
    super.key,
  });

  final WorldPalette palette;
  final ScrollController? scroll;

  /// False paints a still frame (for lists with many backgrounds).
  final bool animate;

  @override
  State<WorldBackground> createState() => _WorldBackgroundState();
}

class _WorldBackgroundState extends State<WorldBackground>
    with SingleTickerProviderStateMixin {
  late final _time = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 30),
  );

  @override
  void initState() {
    super.initState();
    if (widget.animate) unawaited(_time.repeat());
  }

  @override
  void dispose() {
    _time.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => RepaintBoundary(
    child: CustomPaint(
      painter: _SceneryPainter(
        palette: widget.palette,
        time: _time,
        scroll: widget.scroll,
      ),
      size: Size.infinite,
    ),
  );
}

typedef _Item = ({double x, double y, double size, double phase});

class _SceneryPainter extends CustomPainter {
  _SceneryPainter({required this.palette, required this.time, this.scroll})
    : super(repaint: Listenable.merge([time, ?scroll]));

  final WorldPalette palette;
  final Animation<double> time;
  final ScrollController? scroll;

  /// Scenery repeats every this many pixels of map height.
  static const _tile = 940.0;

  /// Background moves at this share of the map's scroll speed.
  static const _parallax = 0.35;

  /// Large pieces hug the screen edges so the path stays readable.
  static final _big = List<_Item>.generate(8, (i) {
    final r = Random(i * 31 + 7);
    final side = i.isEven
        ? r.nextDouble() * 0.16
        : 0.84 + r.nextDouble() * 0.16;
    return (
      x: side,
      y: (i + r.nextDouble() * 0.6) / 8,
      size: 0.7 + r.nextDouble() * 0.6,
      phase: r.nextDouble() * 2 * pi,
    );
  });

  static final _small = List<_Item>.generate(26, (i) {
    final r = Random(i * 17 + 3);
    return (
      x: r.nextDouble(),
      y: r.nextDouble(),
      size: 0.4 + r.nextDouble() * 0.6,
      phase: r.nextDouble() * 2 * pi,
    );
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    canvas.drawRect(
      rect,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: palette.sky,
        ).createShader(rect),
    );

    final t = time.value * 2 * pi;
    final scrolled = scroll?.hasClients ?? false ? scroll!.offset : 0.0;
    final shift = scrolled * _parallax;

    // Repeat the scenery tile to cover the screen at the current shift.
    for (var base = -_tile; base < size.height + _tile; base += _tile) {
      double yOf(_Item item) => base + item.y * _tile + shift % _tile;
      for (final item in _small) {
        final y = yOf(item);
        if (y < -40 || y > size.height + 40) continue;
        _sparkle(canvas, Offset(item.x * size.width, y), item, t);
      }
      for (final item in _big) {
        final y = yOf(item);
        if (y < -120 || y > size.height + 120) continue;
        _drawMotif(canvas, Offset(item.x * size.width, y), item, t, size);
      }
    }
  }

  void _sparkle(Canvas canvas, Offset p, _Item item, double t) {
    final twinkle = (sin(t * 8 + item.phase) + 1) / 2;
    canvas.drawCircle(
      p,
      1 + twinkle * 1.6 * item.size,
      Paint()..color = Colors.white.withValues(alpha: 0.12 + 0.45 * twinkle),
    );
  }

  void _drawMotif(Canvas canvas, Offset p, _Item item, double t, Size size) {
    final s = 46 * item.size;
    final ground = Paint()..color = palette.ground.withValues(alpha: 0.55);
    final light = Paint()..color = Colors.white.withValues(alpha: 0.35);
    switch (palette.motif) {
      case SceneryMotif.hills:
        canvas
          ..drawOval(
            Rect.fromCenter(center: p, width: s * 3.2, height: s * 1.6),
            ground,
          )
          ..drawOval(
            Rect.fromCenter(
              center: p.translate(-s * 0.4, -s * 0.35),
              width: s * 1.4,
              height: s * 0.45,
            ),
            light,
          );
        for (var k = 0; k < 3; k++) {
          final f = p.translate((k - 1) * s * 0.7, s * 0.2 - (k % 2) * s * 0.3);
          canvas
            ..drawCircle(f, s * 0.12, Paint()..color = AppColors.gold)
            ..drawCircle(f, s * 0.05, Paint()..color = Colors.white);
        }
      case SceneryMotif.waves:
        final sway = sin(t * 2 + item.phase) * s * 0.3;
        final stroke = Paint()
          ..color = Colors.white.withValues(alpha: 0.4)
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round
          ..strokeWidth = s * 0.12;
        for (var line = 0; line < 2; line++) {
          final path = Path();
          for (var k = 0; k <= 24; k++) {
            final x = p.dx - s * 1.5 + k * s * 0.125 + sway;
            final y = p.dy + line * s * 0.4 + sin(k * pi / 4) * s * 0.12;
            k == 0 ? path.moveTo(x, y) : path.lineTo(x, y);
          }
          canvas.drawPath(path, stroke);
        }
      case SceneryMotif.pines:
        for (var k = 0; k < 2; k++) {
          final base = p.translate(k * s * 0.9 - s * 0.45, k * s * 0.4);
          canvas.drawRect(
            Rect.fromCenter(
              center: base.translate(0, s * 0.55),
              width: s * 0.18,
              height: s * 0.4,
            ),
            ground,
          );
          for (var tier = 0; tier < 3; tier++) {
            final w = s * (0.9 - tier * 0.2);
            final top = base.dy - s * 0.2 - tier * s * 0.35;
            canvas.drawPath(
              Path()
                ..moveTo(base.dx, top - s * 0.5)
                ..lineTo(base.dx - w / 2, top + s * 0.3)
                ..lineTo(base.dx + w / 2, top + s * 0.3)
                ..close(),
              ground,
            );
          }
        }
      case SceneryMotif.mountains:
        final peak = p.translate(0, -s * 1.1);
        canvas
          ..drawPath(
            Path()
              ..moveTo(peak.dx, peak.dy)
              ..lineTo(p.dx - s * 1.5, p.dy + s * 0.6)
              ..lineTo(p.dx + s * 1.5, p.dy + s * 0.6)
              ..close(),
            ground,
          )
          ..drawPath(
            Path()
              ..moveTo(peak.dx, peak.dy)
              ..lineTo(peak.dx - s * 0.45, peak.dy + s * 0.5)
              ..lineTo(peak.dx - s * 0.1, peak.dy + s * 0.38)
              ..lineTo(peak.dx + s * 0.15, peak.dy + s * 0.52)
              ..lineTo(peak.dx + s * 0.45, peak.dy + s * 0.5)
              ..close(),
            Paint()..color = palette.sky.last.withValues(alpha: 0.85),
          );
        // Falling flakes / ash.
        for (var k = 0; k < 4; k++) {
          final fall = (time.value * 3 + k / 4 + item.phase) % 1;
          canvas.drawCircle(
            Offset(
              p.dx + sin(t * 3 + k) * s,
              p.dy - s * 2 + fall * s * 3,
            ),
            s * 0.06,
            light,
          );
        }
      case SceneryMotif.bubbles:
        final ring = Paint()
          ..color = Colors.white.withValues(alpha: 0.45)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2;
        for (var k = 0; k < 3; k++) {
          final rise = (time.value * 4 + k / 3 + item.phase) % 1;
          final c = Offset(
            p.dx + sin(t * 4 + k * 2) * s * 0.4,
            p.dy + s - rise * s * 2.4,
          );
          final r = s * (0.18 + k * 0.08);
          canvas
            ..drawCircle(c, r, ring)
            ..drawCircle(c.translate(-r * 0.35, -r * 0.35), r * 0.2, light);
        }
      case SceneryMotif.clouds:
        final drift = Offset(sin(t + item.phase) * s * 0.6, 0);
        final cloud = Paint()..color = Colors.white.withValues(alpha: 0.6);
        final c = p + drift;
        canvas
          ..drawCircle(c.translate(-s * 0.6, 0), s * 0.45, cloud)
          ..drawCircle(c.translate(0, -s * 0.25), s * 0.6, cloud)
          ..drawCircle(c.translate(s * 0.65, 0), s * 0.42, cloud)
          ..drawRRect(
            RRect.fromRectAndRadius(
              Rect.fromCenter(
                center: c.translate(0, s * 0.18),
                width: s * 2.1,
                height: s * 0.55,
              ),
              Radius.circular(s * 0.3),
            ),
            cloud,
          );
      case SceneryMotif.space:
        final planet = Paint()..color = palette.ground;
        canvas
          ..drawCircle(p, s * 0.55, planet)
          ..drawCircle(p.translate(-s * 0.18, -s * 0.18), s * 0.2, light)
          ..save()
          ..translate(p.dx, p.dy)
          ..rotate(-0.35 + sin(t + item.phase) * 0.05)
          ..drawOval(
            Rect.fromCenter(
              center: Offset.zero,
              width: s * 1.8,
              height: s * 0.45,
            ),
            Paint()
              ..color = Colors.white.withValues(alpha: 0.5)
              ..style = PaintingStyle.stroke
              ..strokeWidth = s * 0.08,
          )
          ..restore();
    }
  }

  @override
  bool shouldRepaint(_SceneryPainter old) =>
      old.palette != palette || old.scroll != scroll;
}
