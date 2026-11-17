import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

enum ParticleShape { star, confetti, circle }

class _Particle {
  _Particle({
    required this.position,
    required this.velocity,
    required this.color,
    required this.size,
    required this.shape,
    required this.life,
    required this.gravity,
    required this.spin,
  });

  Offset position;
  Offset velocity;
  final Color color;
  final double size;
  final ParticleShape shape;
  final double life;
  final double gravity;
  final double spin;
  double age = 0;
  double rotation = 0;

  double get progress => (age / life).clamp(0, 1);
}

/// Spawns particles on a [ParticleLayer]. Positions are global coordinates.
class ParticleController {
  void Function(List<_Particle>)? _sink;
  Offset Function(Offset global)? _toLocal;
  final _random = Random();

  void burst(
    Offset global, {
    int count = 12,
    List<Color> colors = const [Colors.white],
    ParticleShape shape = ParticleShape.star,
    double speed = 220,
    double size = 10,
    double gravity = 380,
    double life = 0.9,
    double spread = 2 * pi,
    double direction = -pi / 2,
  }) {
    final sink = _sink;
    final toLocal = _toLocal;
    if (sink == null || toLocal == null) return;
    final origin = toLocal(global);
    sink([
      for (var i = 0; i < count; i++)
        () {
          final angle = direction + (_random.nextDouble() - 0.5) * spread;
          final v = speed * (0.45 + _random.nextDouble() * 0.75);
          return _Particle(
            position: origin,
            velocity: Offset(cos(angle) * v, sin(angle) * v),
            color: colors[_random.nextInt(colors.length)],
            size: size * (0.6 + _random.nextDouble() * 0.8),
            shape: shape,
            life: life * (0.7 + _random.nextDouble() * 0.6),
            gravity: gravity,
            spin: (_random.nextDouble() - 0.5) * 12,
          );
        }(),
    ]);
  }
}

/// Paints particles above its child without rebuilding widgets.
class ParticleLayer extends StatefulWidget {
  const ParticleLayer({required this.controller, super.key});

  final ParticleController controller;

  @override
  State<ParticleLayer> createState() => _ParticleLayerState();
}

class _ParticleLayerState extends State<ParticleLayer>
    with SingleTickerProviderStateMixin {
  final _particles = <_Particle>[];
  final _repaint = ValueNotifier<int>(0);
  // Created up front: a lazy ticker would first be built in dispose() when
  // no particle was ever spawned, which is not allowed there.
  late final Ticker _ticker;
  Duration _last = Duration.zero;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker(_tick);
    widget.controller
      .._sink = _add
      .._toLocal = (global) {
        final box = context.findRenderObject() as RenderBox?;
        return box?.globalToLocal(global) ?? global;
      };
  }

  void _add(List<_Particle> particles) {
    _particles.addAll(particles);
    if (!_ticker.isActive) {
      _last = Duration.zero;
      unawaited(_ticker.start());
    }
  }

  void _tick(Duration elapsed) {
    final dt = _last == Duration.zero
        ? 1 / 60
        : (elapsed - _last).inMicroseconds / 1e6;
    _last = elapsed;
    for (final p in _particles) {
      p
        ..age += dt
        ..velocity = Offset(
          p.velocity.dx * 0.985,
          p.velocity.dy * 0.985 + p.gravity * dt,
        )
        ..position += p.velocity * dt
        ..rotation += p.spin * dt;
    }
    _particles.removeWhere((p) => p.age >= p.life);
    _repaint.value++;
    if (_particles.isEmpty) _ticker.stop();
  }

  @override
  void dispose() {
    widget.controller
      .._sink = null
      .._toLocal = null;
    _ticker.dispose();
    _repaint.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => IgnorePointer(
    child: CustomPaint(
      painter: _ParticlePainter(_particles, _repaint),
      size: Size.infinite,
    ),
  );
}

class _ParticlePainter extends CustomPainter {
  _ParticlePainter(this.particles, Listenable repaint)
    : super(repaint: repaint);

  final List<_Particle> particles;
  final _paint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    for (final p in particles) {
      final fade = p.progress < 0.7 ? 1.0 : 1 - (p.progress - 0.7) / 0.3;
      _paint.color = p.color.withValues(alpha: fade);
      canvas
        ..save()
        ..translate(p.position.dx, p.position.dy)
        ..rotate(p.rotation);
      switch (p.shape) {
        case ParticleShape.star:
          canvas.drawPath(_star(p.size * (1 - p.progress * 0.4)), _paint);
        case ParticleShape.confetti:
          canvas.drawRRect(
            RRect.fromRectAndRadius(
              Rect.fromCenter(
                center: Offset.zero,
                width: p.size * cos(p.rotation * 1.7).abs().clamp(0.2, 1),
                height: p.size * 0.55,
              ),
              const Radius.circular(2),
            ),
            _paint,
          );
        case ParticleShape.circle:
          canvas.drawCircle(Offset.zero, p.size / 2, _paint);
      }
      canvas.restore();
    }
  }

  static Path _star(double size) {
    final path = Path();
    final outer = size / 2;
    final inner = outer * 0.45;
    for (var i = 0; i < 10; i++) {
      final r = i.isEven ? outer : inner;
      final a = -pi / 2 + i * pi / 5;
      final point = Offset(cos(a) * r, sin(a) * r);
      if (i == 0) {
        path.moveTo(point.dx, point.dy);
      } else {
        path.lineTo(point.dx, point.dy);
      }
    }
    return path..close();
  }

  @override
  bool shouldRepaint(_ParticlePainter oldDelegate) => false;
}
