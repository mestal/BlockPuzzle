import 'package:meta/meta.dart';

/// A half-finished level, saved so the player can resume it.
@immutable
final class LevelSnapshot {
  const LevelSnapshot({
    required this.levelId,
    required this.cells,
    required this.lives,
    this.score = 0,
    this.mistakes = 0,
  });

  factory LevelSnapshot.fromJson(Map<String, Object?> json) => LevelSnapshot(
    levelId: json['levelId']! as int,
    cells: json['cells']! as String,
    lives: json['lives']! as int,
    score: json['score'] as int? ?? 0,
    mistakes: json['mistakes'] as int? ?? 0,
  );

  final int levelId;
  final String cells;
  final int lives;
  final int score;
  final int mistakes;

  Map<String, Object?> toJson() => {
    'levelId': levelId,
    'cells': cells,
    'lives': lives,
    'score': score,
    'mistakes': mistakes,
  };
}

/// One player's saved progress.
@immutable
final class SlotData {
  const SlotData({
    required this.name,
    required this.colorIndex,
    this.unlockedLevel = 1,
    this.completed = const {},
    this.stars = const {},
    this.hints = startingHints,
    this.totalScore = 0,
    this.tutorials = const {},
    this.snapshot,
  });

  factory SlotData.fromJson(Map<String, Object?> json) => SlotData(
    name: json['name']! as String,
    colorIndex: json['colorIndex']! as int,
    unlockedLevel: json['unlockedLevel']! as int,
    completed: {...(json['completed']! as List).cast<int>()},
    stars: {
      for (final MapEntry(:key, :value)
          in ((json['stars'] as Map?) ?? const {}).entries)
        int.parse(key as String): value as int,
    },
    hints: json['hints']! as int,
    totalScore: json['totalScore'] as int? ?? 0,
    tutorials: {...((json['tutorials'] as List?) ?? const []).cast<int>()},
    snapshot: switch (json['snapshot']) {
      final Map<String, Object?> s => LevelSnapshot.fromJson(s),
      _ => null,
    },
  );

  static const startingHints = 3;

  final String name;
  final int colorIndex;

  /// Highest level the player may open.
  final int unlockedLevel;
  final Set<int> completed;

  /// Best star rating per finished level.
  final Map<int, int> stars;
  final int hints;

  /// Sum of the scores of all finished levels.
  final int totalScore;

  /// Levels whose tutorial was finished or skipped (not shown again).
  final Set<int> tutorials;
  final LevelSnapshot? snapshot;

  SlotData copyWith({
    int? unlockedLevel,
    Set<int>? completed,
    Map<int, int>? stars,
    int? hints,
    int? totalScore,
    Set<int>? tutorials,
    LevelSnapshot? Function()? snapshot,
  }) => SlotData(
    name: name,
    colorIndex: colorIndex,
    unlockedLevel: unlockedLevel ?? this.unlockedLevel,
    completed: completed ?? this.completed,
    stars: stars ?? this.stars,
    hints: hints ?? this.hints,
    totalScore: totalScore ?? this.totalScore,
    tutorials: tutorials ?? this.tutorials,
    snapshot: snapshot != null ? snapshot() : this.snapshot,
  );

  Map<String, Object?> toJson() => {
    'name': name,
    'colorIndex': colorIndex,
    'unlockedLevel': unlockedLevel,
    'completed': completed.toList()..sort(),
    'stars': {
      for (final MapEntry(:key, :value) in stars.entries) '$key': value,
    },
    'hints': hints,
    'totalScore': totalScore,
    'tutorials': tutorials.toList()..sort(),
    'snapshot': snapshot?.toJson(),
  };
}
