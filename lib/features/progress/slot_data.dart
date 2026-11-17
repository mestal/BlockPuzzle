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
    this.hints = startingHints,
    this.totalScore = 0,
    this.snapshot,
  });

  factory SlotData.fromJson(Map<String, Object?> json) => SlotData(
    name: json['name']! as String,
    colorIndex: json['colorIndex']! as int,
    unlockedLevel: json['unlockedLevel']! as int,
    completed: {...(json['completed']! as List).cast<int>()},
    hints: json['hints']! as int,
    totalScore: json['totalScore'] as int? ?? 0,
    snapshot: switch (json['snapshot']) {
      final Map<String, Object?> s => LevelSnapshot.fromJson(s),
      _ => null,
    },
  );

  static const startingHints = 5;

  final String name;
  final int colorIndex;

  /// Highest level the player may open.
  final int unlockedLevel;
  final Set<int> completed;
  final int hints;

  /// Sum of the scores of all finished levels.
  final int totalScore;
  final LevelSnapshot? snapshot;

  SlotData copyWith({
    int? unlockedLevel,
    Set<int>? completed,
    int? hints,
    int? totalScore,
    LevelSnapshot? Function()? snapshot,
  }) => SlotData(
    name: name,
    colorIndex: colorIndex,
    unlockedLevel: unlockedLevel ?? this.unlockedLevel,
    completed: completed ?? this.completed,
    hints: hints ?? this.hints,
    totalScore: totalScore ?? this.totalScore,
    snapshot: snapshot != null ? snapshot() : this.snapshot,
  );

  Map<String, Object?> toJson() => {
    'name': name,
    'colorIndex': colorIndex,
    'unlockedLevel': unlockedLevel,
    'completed': completed.toList()..sort(),
    'hints': hints,
    'totalScore': totalScore,
    'snapshot': snapshot?.toJson(),
  };
}
