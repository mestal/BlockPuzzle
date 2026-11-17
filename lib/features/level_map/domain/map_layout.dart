import 'dart:math';

import 'package:meta/meta.dart';

/// A point on the map canvas (y grows downwards).
typedef MapPoint = ({double x, double y});

/// Positions of a world's level nodes along a winding path. The first level
/// sits at the bottom and the path climbs to a goal at the top.
@immutable
final class MapLayout {
  const MapLayout({
    required this.count,
    required this.width,
    this.spacing = 116,
    this.topPadding = 400,
    this.bottomPadding = 260,
  });

  final int count;
  final double width;

  /// Vertical distance between neighbouring nodes.
  final double spacing;

  /// Room above the last node (goal) and below the first (start sign).
  final double topPadding;
  final double bottomPadding;

  /// How far the path swings sideways, as a share of [width].
  static const swing = 0.27;

  /// Phase step between nodes; ~0.85 rad gives a lazy S-curve.
  static const _step = 0.85;

  double get height => topPadding + bottomPadding + (count - 1) * spacing;

  /// Centre of the node for the [i]th level (0-based) of the world.
  MapPoint node(int i) => (
    x: width / 2 + width * swing * sin(i * _step),
    y: height - bottomPadding - i * spacing,
  );

  /// Where the path begins, below the first node.
  MapPoint get start => (x: width / 2, y: height - bottomPadding + spacing);

  /// The world's goal, above the last node.
  MapPoint get goal => (x: width / 2, y: topPadding - spacing * 1.1);

  /// Start, every node, then the goal: the points the path runs through.
  List<MapPoint> get pathPoints => [
    start,
    for (var i = 0; i < count; i++) node(i),
    goal,
  ];

  /// Scroll offset (from the bottom, for a reversed scroll view) that puts
  /// node [i] in the middle of a viewport of [viewport] height.
  double offsetFor(int i, double viewport) =>
      max(0, height - node(i).y - viewport / 2);
}
