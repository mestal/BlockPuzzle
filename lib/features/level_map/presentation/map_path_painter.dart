import 'package:block_puzzle/app/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// The winding road through a world's nodes. The part the player has
/// already travelled ([reached] points from the start) glows gold.
class MapPathPainter extends CustomPainter {
  MapPathPainter({required this.points, required this.reached});

  final List<Offset> points;

  /// Index into [points] up to which the road is travelled.
  final int reached;

  static const _roadWidth = 26.0;
  static const _dash = 10.0;
  static const _gap = 12.0;

  @override
  void paint(Canvas canvas, Size size) {
    if (points.length < 2) return;
    final road = _smooth(points);
    canvas
      ..drawPath(
        road.shift(const Offset(0, 5)),
        _stroke(AppColors.mapRoadEdge, _roadWidth + 4),
      )
      ..drawPath(road, _stroke(AppColors.mapRoad, _roadWidth));

    final dashes = _stroke(Colors.white.withValues(alpha: 0.75), 5);
    for (final metric in road.computeMetrics()) {
      for (var d = 0.0; d < metric.length; d += _dash + _gap) {
        canvas.drawPath(metric.extractPath(d, d + _dash), dashes);
      }
    }

    if (reached <= 0) return;
    final travelled = _smooth(points.sublist(0, reached + 1));
    canvas
      ..drawPath(
        travelled,
        _stroke(AppColors.gold.withValues(alpha: 0.6), 14)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6),
      )
      ..drawPath(travelled, _stroke(AppColors.gold, 8));
  }

  Paint _stroke(Color color, double width) => Paint()
    ..color = color
    ..style = PaintingStyle.stroke
    ..strokeWidth = width
    ..strokeCap = StrokeCap.round
    ..strokeJoin = StrokeJoin.round;

  /// A Catmull-Rom spline through [pts] as cubic Béziers.
  static Path _smooth(List<Offset> pts) {
    final path = Path()..moveTo(pts.first.dx, pts.first.dy);
    for (var i = 0; i < pts.length - 1; i++) {
      final p0 = pts[i == 0 ? 0 : i - 1];
      final p1 = pts[i];
      final p2 = pts[i + 1];
      final p3 = pts[i + 2 < pts.length ? i + 2 : pts.length - 1];
      final c1 = p1 + (p2 - p0) / 6;
      final c2 = p2 - (p3 - p1) / 6;
      path.cubicTo(c1.dx, c1.dy, c2.dx, c2.dy, p2.dx, p2.dy);
    }
    return path;
  }

  @override
  bool shouldRepaint(MapPathPainter old) =>
      old.reached != reached || !listEquals(old.points, points);
}
