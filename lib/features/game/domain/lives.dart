import 'package:block_puzzle/features/game/domain/puzzle.dart';
import 'package:block_puzzle/features/game/domain/tutorial.dart';

/// How many lives (hearts) a level starts with. Pure Dart.
///
/// Placing an X is free; only a wrong fill costs a life, and that mistake
/// also reveals the cell, so lives stay few to keep guessing costly. Bigger
/// boards get a little more room. Watching an ad gives +1 when they run out.
abstract final class Lives {
  /// Lives for a level of [rows] x [cols] cells: 5x5 → 3, 10x5 → 4,
  /// 10x10 and up → 5.
  static int forSize(int rows, int cols) => switch (rows * cols) {
    <= 25 => 3,
    <= 50 => 4,
    _ => 5,
  };

  static int start(Puzzle puzzle) => forSize(puzzle.rows, puzzle.cols);

  /// Tutorial levels cannot be lost: mistakes still cost hearts (and stars)
  /// but the last heart is never taken.
  static bool canRunOut(int levelId) => !Tutorial.levels.contains(levelId);

  /// Lives left after one mistake on level [levelId].
  static int afterMistake(int levelId, int lives) =>
      canRunOut(levelId) || lives > 1 ? lives - 1 : lives;
}
