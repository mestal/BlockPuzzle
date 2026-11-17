import 'package:block_puzzle/features/game/domain/board.dart';
import 'package:block_puzzle/features/game/domain/line_solver.dart';
import 'package:meta/meta.dart';

/// Why a hinted cell is certain. Ordered from the easiest idea to learn.
enum HintReason {
  /// The groups plus one gap between each fill the whole line exactly.
  fullLine,

  /// Pushing the groups to either end still covers this cell (overlap).
  overlap,

  /// The clue together with the cells already known forces a block here.
  forcedFill,

  /// No placement of the groups can reach this cell: it must stay empty.
  forcedEmpty,

  /// No single line explains it (should not happen on valid levels).
  fallback,
}

/// A logical next step for the player: which cell, what it is, and the line
/// whose clue proves it.
@immutable
final class Hint {
  const Hint({
    required this.row,
    required this.col,
    required this.fill,
    required this.reason,
    this.isRow = true,
    this.line = 0,
    this.clue = const [],
  });

  final int row;
  final int col;

  /// True when the cell is a block, false when it is empty (gets an X).
  final bool fill;
  final HintReason reason;

  /// The line that explains the step: row [line] if [isRow], else column.
  final bool isRow;
  final int line;
  final List<int> clue;
}

/// Finds the most teachable next step on [board]: the simplest single-line
/// deduction from what is already certain. Filled cells are preferred over
/// empty ones; ties are broken by [seed].
///
/// What counts as known: every filled cell, every locked X, and the player's
/// own X marks that are right. Wrong X marks are ignored, so a hint can
/// point out (and fix) a cell the player crossed by mistake.
Hint? findHint(Board board, {int seed = 0}) {
  if (board.isSolved) return null;
  final puzzle = board.puzzle;
  final rows = puzzle.rows;
  final cols = puzzle.cols;

  Known known(int r, int c) {
    final cell = board.at(r, c);
    return switch (cell.mark) {
      CellMark.filled => Known.filled,
      CellMark.crossed when cell.isLocked || !puzzle.isFilled(r, c) =>
        Known.empty,
      _ => Known.unknown,
    };
  }

  // Candidates per reason, so the simplest reason wins.
  final found = {for (final reason in HintReason.values) reason: <Hint>[]};

  void scan({required bool isRow, required int index}) {
    final length = isRow ? cols : rows;
    final clue = isRow ? puzzle.rowClues[index] : puzzle.colClues[index];
    (int, int) pos(int i) => isRow ? (index, i) : (i, index);
    final line = [
      for (var i = 0; i < length; i++) known(pos(i).$1, pos(i).$2),
    ];
    if (!line.contains(Known.unknown)) return;

    final blank = solveLine(clue, List.filled(length, Known.unknown));
    final solved = solveLine(clue, line);
    if (blank == null || solved == null) return;
    final full =
        clue.isNotEmpty &&
        clue.fold(0, (sum, n) => sum + n) + clue.length - 1 == length;

    for (var i = 0; i < length; i++) {
      if (line[i] != Known.unknown || solved[i] == Known.unknown) continue;
      final fill = solved[i] == Known.filled;
      final reason = !fill
          ? HintReason.forcedEmpty
          : full
          ? HintReason.fullLine
          : blank[i] == Known.filled
          ? HintReason.overlap
          : HintReason.forcedFill;
      final (r, c) = pos(i);
      found[reason]!.add(
        Hint(
          row: r,
          col: c,
          fill: fill,
          reason: reason,
          isRow: isRow,
          line: index,
          clue: clue,
        ),
      );
    }
  }

  for (var r = 0; r < rows; r++) {
    scan(isRow: true, index: r);
  }
  for (var c = 0; c < cols; c++) {
    scan(isRow: false, index: c);
  }

  for (final reason in HintReason.values) {
    final list = found[reason]!;
    if (list.isNotEmpty) return list[seed.abs() % list.length];
  }

  final cell = board.hintCell(seed);
  if (cell == null) return null;
  return Hint(
    row: cell.$1,
    col: cell.$2,
    fill: true,
    reason: HintReason.fallback,
  );
}
