/// Scoring rules (pure Dart). Rewards streaks so that careful, confident
/// play feels better than guessing.
abstract final class Scoring {
  /// Points for one correct fill before the combo multiplier.
  static const fillPoints = 10;

  /// Bonus for finishing a row or column.
  static const linePoints = 50;

  /// Awarded when the level is solved, plus [lifeBonus] per heart left.
  static const levelPoints = 100;
  static const lifeBonus = 50;

  /// Extra for a level solved without a single mistake.
  static const perfectBonus = 200;

  /// Correct fills in a row needed to raise the multiplier by one.
  static const comboStep = 5;
  static const maxMultiplier = 5;

  /// Multiplier for a streak of [combo] correct fills (x1 ... x5).
  static int multiplier(int combo) =>
      (1 + combo ~/ comboStep).clamp(1, maxMultiplier);

  /// Points for a correct fill that extends the streak to [combo].
  static int fill(int combo) => fillPoints * multiplier(combo);

  /// Bonus for completing [lines] rows/columns with one move.
  static int lines(int lines, int combo) =>
      linePoints * lines * multiplier(combo);

  static int levelBonus({required int lives, required int mistakes}) =>
      levelPoints + lifeBonus * lives + (mistakes == 0 ? perfectBonus : 0);

  /// 3 stars for a flawless level, 2 for one mistake, otherwise 1.
  static int stars(int mistakes) => switch (mistakes) {
    0 => 3,
    1 => 2,
    _ => 1,
  };
}
