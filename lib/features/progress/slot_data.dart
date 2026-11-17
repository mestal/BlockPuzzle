import 'package:meta/meta.dart';

/// A half-finished level, saved so the player can resume it.
@immutable
final class LevelSnapshot {
  const LevelSnapshot({
    required this.levelId,
    required this.cells,
    required this.lives,
  });

  factory LevelSnapshot.fromJson(Map<String, Object?> json) => LevelSnapshot(
    levelId: json['levelId']! as int,
    cells: json['cells']! as String,
    lives: json['lives']! as int,
  );

  final int levelId;
  final String cells;
  final int lives;

  Map<String, Object?> toJson() => {
    'levelId': levelId,
    'cells': cells,
    'lives': lives,
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
    this.snapshot,
  });

  factory SlotData.fromJson(Map<String, Object?> json) => SlotData(
    name: json['name']! as String,
    colorIndex: json['colorIndex']! as int,
    unlockedLevel: json['unlockedLevel']! as int,
    completed: {...(json['completed']! as List).cast<int>()},
    hints: json['hints']! as int,
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
  final LevelSnapshot? snapshot;

  SlotData copyWith({
    int? unlockedLevel,
    Set<int>? completed,
    int? hints,
    LevelSnapshot? Function()? snapshot,
  }) => SlotData(
    name: name,
    colorIndex: colorIndex,
    unlockedLevel: unlockedLevel ?? this.unlockedLevel,
    completed: completed ?? this.completed,
    hints: hints ?? this.hints,
    snapshot: snapshot != null ? snapshot() : this.snapshot,
  );

  Map<String, Object?> toJson() => {
    'name': name,
    'colorIndex': colorIndex,
    'unlockedLevel': unlockedLevel,
    'completed': completed.toList()..sort(),
    'hints': hints,
    'snapshot': snapshot?.toJson(),
  };
}
