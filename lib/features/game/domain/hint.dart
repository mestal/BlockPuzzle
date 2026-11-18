import 'package:block_puzzle/features/game/domain/board.dart';
import 'package:block_puzzle/features/game/domain/line_solver.dart';
import 'package:meta/meta.dart';

/// Why a hinted cell is certain. Each reason is one rule the player can
/// learn; [Hint.difficulty] orders them from the easiest to the hardest.
enum HintReason {
  /// The groups plus one gap between each fill the whole line exactly.
  fullLine,

  /// A group slid as far as it can go to either end still covers the cell.
  overlap,

  /// No group can stretch this far: the cell lies outside every group's
  /// reach.
  outOfReach,

  /// The cell touches a run of blocks that is already as long as the
  /// biggest group that could be there: the run is complete, so its ends
  /// stay empty.
  blockDone,

  /// The cell sits in a run between X marks (or the edge) that is too short
  /// for any group that could reach it.
  tooSmall,

  /// Every possible placement of the groups fills the cell (no simpler rule
  /// explains it).
  forcedFill,

  /// Every possible placement of the groups leaves the cell empty (no
  /// simpler rule explains it).
  forcedEmpty,

  /// No single line explains it (should not happen on valid levels).
  fallback,
}

/// Where one clue group can lie in its line, counted in cells from the start
/// of the line (left of a row, top of a column), 0-based.
@immutable
final class GroupReach {
  const GroupReach({
    required this.size,
    required this.earliest,
    required this.latest,
  });

  /// Length of the group (its clue number).
  final int size;

  /// First cell of the group when it is slid as far to the start as it can.
  final int earliest;

  /// First cell of the group when it is slid as far to the end as it can.
  final int latest;

  /// Last cell the group can cover.
  int get end => latest + size - 1;

  /// Cells the group covers wherever it lies (none when the first is past
  /// the last).
  (int first, int last) get common => (latest, earliest + size - 1);

  @override
  bool operator ==(Object other) =>
      other is GroupReach &&
      other.size == size &&
      other.earliest == earliest &&
      other.latest == latest;

  @override
  int get hashCode => Object.hash(size, earliest, latest);

  @override
  String toString() => 'GroupReach($size: $earliest..$latest)';
}

/// A logical next step for the player: which cell, what it is, and the line
/// whose clue proves it, with the numbers the explanation needs.
@immutable
final class Hint {
  const Hint({
    required this.row,
    required this.col,
    required this.fill,
    required this.reason,
    this.isRow = true,
    this.line = 0,
    this.length = 0,
    this.clue = const [],
    this.groups = const [],
    this.span,
    this.blankLine = false,
    this.fixesCross = false,
  });

  final int row;
  final int col;

  /// True when the cell is a block, false when it is empty (gets an X).
  final bool fill;
  final HintReason reason;

  /// The line that explains the step: row [line] if [isRow], else column.
  final bool isRow;
  final int line;

  /// Number of cells in that line.
  final int length;
  final List<int> clue;

  /// The groups the explanation talks about: the sliding group for
  /// [HintReason.overlap], the neighbouring groups for
  /// [HintReason.outOfReach], the groups that could hold the run for
  /// [HintReason.blockDone] or reach the short run for [HintReason.tooSmall].
  final List<GroupReach> groups;

  /// Cells of the line (0-based, inclusive) the explanation points at: the
  /// certain run for [HintReason.overlap], the finished blocks for
  /// [HintReason.blockDone], the short run for [HintReason.tooSmall].
  final (int first, int last)? span;

  /// Whether nothing in the line was known yet (the easiest overlaps).
  final bool blankLine;

  /// Whether the cell held the player's own X although it is a block.
  final bool fixesCross;

  /// Position of the cell inside [line], 0-based from its start.
  int get index => isRow ? col : row;

  /// How hard the step is to see; lower is easier.
  int get difficulty => switch (reason) {
    HintReason.fullLine => 0,
    HintReason.overlap when blankLine => 1,
    HintReason.outOfReach => 2,
    HintReason.overlap => 3,
    HintReason.blockDone => 4,
    HintReason.tooSmall => 5,
    HintReason.forcedFill => 6,
    HintReason.forcedEmpty => 7,
    HintReason.fallback => 8,
  };
}

/// Finds the easiest next step on [board]: a single-line deduction from what
/// is already certain, explained by the simplest rule that proves it. Among
/// equally easy steps one that fixes a wrong player X wins; other ties are
/// broken by [seed].
///
/// What counts as known: every filled cell, every locked X, and the player's
/// own X marks that are right. Wrong X marks are ignored, so a hint can
/// point out (and fix) a cell the player crossed by mistake.
Hint? findHint(Board board, {int seed = 0}) {
  if (board.isSolved) return null;
  final puzzle = board.puzzle;

  Known known(int r, int c) {
    final cell = board.at(r, c);
    return switch (cell.mark) {
      CellMark.filled => Known.filled,
      CellMark.crossed when cell.isLocked || !puzzle.isFilled(r, c) =>
        Known.empty,
      _ => Known.unknown,
    };
  }

  final found = <Hint>[];
  for (var r = 0; r < puzzle.rows; r++) {
    found.addAll(
      lineHints(
        clue: puzzle.rowClues[r],
        line: [for (var c = 0; c < puzzle.cols; c++) known(r, c)],
        isRow: true,
        index: r,
      ),
    );
  }
  for (var c = 0; c < puzzle.cols; c++) {
    found.addAll(
      lineHints(
        clue: puzzle.colClues[c],
        line: [for (var r = 0; r < puzzle.rows; r++) known(r, c)],
        isRow: false,
        index: c,
      ),
    );
  }

  if (found.isEmpty) {
    final cell = board.hintCell(seed);
    if (cell == null) return null;
    return Hint(
      row: cell.$1,
      col: cell.$2,
      fill: true,
      reason: HintReason.fallback,
    );
  }

  final easiest = found
      .map((h) => h.difficulty)
      .reduce((a, b) => a < b ? a : b);
  var pool = [
    for (final h in found)
      if (h.difficulty == easiest) h,
  ];
  final fixes = [
    for (final h in pool)
      if (board.at(h.row, h.col).isUserCross) h,
  ];
  if (fixes.isNotEmpty) pool = fixes;
  final pick = pool[seed.abs() % pool.length];
  return board.at(pick.row, pick.col).isUserCross
      ? Hint(
          row: pick.row,
          col: pick.col,
          fill: pick.fill,
          reason: pick.reason,
          isRow: pick.isRow,
          line: pick.line,
          length: pick.length,
          clue: pick.clue,
          groups: pick.groups,
          span: pick.span,
          blankLine: pick.blankLine,
          fixesCross: pick.fill,
        )
      : pick;
}

/// Every cell of one line that [clue] decides given [line], each explained
/// by the simplest rule that proves it.
@visibleForTesting
List<Hint> lineHints({
  required List<int> clue,
  required List<Known> line,
  required bool isRow,
  required int index,
}) {
  final n = line.length;
  if (clue.isEmpty || !line.contains(Known.unknown)) return const [];
  final solved = solveLine(clue, line);
  final reach = groupReach(clue, line);
  if (solved == null || reach == null) return const [];

  final blankLine = !line.any((k) => k != Known.unknown);
  final full = clue.fold(0, (sum, g) => sum + g) + clue.length - 1 == n;
  final hints = <Hint>[];

  Hint hint(
    int i,
    HintReason reason, {
    List<GroupReach> groups = const [],
    (int, int)? span,
  }) => Hint(
    row: isRow ? index : i,
    col: isRow ? i : index,
    fill: solved[i] == Known.filled,
    reason: reason,
    isRow: isRow,
    line: index,
    length: n,
    clue: clue,
    groups: groups,
    span: span,
    blankLine: blankLine,
  );

  for (var i = 0; i < n; i++) {
    if (line[i] != Known.unknown || solved[i] == Known.unknown) continue;
    if (solved[i] == Known.filled) {
      if (full) {
        hints.add(hint(i, HintReason.fullLine));
        continue;
      }
      final group = reach.where((g) {
        final (first, last) = g.common;
        return first <= i && i <= last;
      }).firstOrNull;
      hints.add(
        group == null
            ? hint(i, HintReason.forcedFill)
            : hint(i, HintReason.overlap, groups: [group], span: group.common),
      );
      continue;
    }

    // Empty: no group reaches the cell, a block beside it is complete, or
    // the run around it is too short.
    final reaching = [
      for (final g in reach)
        if (g.earliest <= i && i <= g.end) g,
    ];
    if (reaching.isEmpty) {
      final before = reach.where((g) => g.end < i).lastOrNull;
      final after = reach.where((g) => g.earliest > i).firstOrNull;
      hints.add(
        hint(
          i,
          HintReason.outOfReach,
          groups: [?before, ?after],
        ),
      );
      continue;
    }
    if (_finishedBlock(line, reach, i) case (final run, final holders)?) {
      hints.add(hint(i, HintReason.blockDone, groups: holders, span: run));
      continue;
    }
    var first = i;
    var last = i;
    while (first > 0 && line[first - 1] != Known.empty) {
      first--;
    }
    while (last < n - 1 && line[last + 1] != Known.empty) {
      last++;
    }
    final run = last - first + 1;
    final hasBlock = line.sublist(first, last + 1).contains(Known.filled);
    final fits = reach.any(
      (g) => g.size <= run && g.earliest <= last && g.end >= first,
    );
    hints.add(
      !hasBlock && !fits
          ? hint(
              i,
              HintReason.tooSmall,
              groups: [
                for (final g in reach)
                  if (g.earliest <= last && g.end >= first) g,
              ],
              span: (first, last),
            )
          : hint(i, HintReason.forcedEmpty),
    );
  }
  return hints;
}

/// A run of blocks right beside cell [i] that already has the size of the
/// biggest group able to hold it, with those groups; null if there is none.
((int, int), List<GroupReach>)? _finishedBlock(
  List<Known> line,
  List<GroupReach> reach,
  int i,
) {
  for (final step in const [-1, 1]) {
    var a = i + step;
    if (a < 0 || a >= line.length || line[a] != Known.filled) continue;
    var b = a;
    while (b + step >= 0 &&
        b + step < line.length &&
        line[b + step] == Known.filled) {
      b += step;
    }
    if (a > b) (a, b) = (b, a);
    final size = b - a + 1;
    final holders = [
      for (final g in reach)
        if (g.size >= size && g.earliest <= a && g.end >= b) g,
    ];
    if (holders.isNotEmpty && holders.every((g) => g.size == size)) {
      return ((a, b), holders);
    }
  }
  return null;
}

/// How far each group of [clue] can slide in [line]: its start when every
/// group is pushed to the start of the line, and when pushed to the end.
/// Null if the clue does not fit.
List<GroupReach>? groupReach(List<int> clue, List<Known> line) {
  final left = _leftmost(clue, line);
  final right = _leftmost(clue.reversed.toList(), line.reversed.toList());
  if (left == null || right == null) return null;
  final n = line.length;
  final k = clue.length;
  return [
    for (var g = 0; g < k; g++)
      GroupReach(
        size: clue[g],
        earliest: left[g],
        latest: n - right[k - 1 - g] - clue[g],
      ),
  ];
}

/// Start of every group in the leftmost placement consistent with [line].
/// The leftmost placement puts each group at its earliest possible start.
List<int>? _leftmost(List<int> clue, List<Known> line) {
  final n = line.length;
  final starts = List<int>.filled(clue.length, 0);
  final failed = <int>{};

  bool place(int g, int from) {
    if (g == clue.length) {
      for (var i = from; i < n; i++) {
        if (line[i] == Known.filled) return false;
      }
      return true;
    }
    final key = g * (n + 2) + from;
    if (failed.contains(key)) return false;
    final len = clue[g];
    for (var s = from; s + len <= n; s++) {
      if (s > from && line[s - 1] == Known.filled) break;
      var fits = true;
      for (var i = s; i < s + len; i++) {
        if (line[i] == Known.empty) {
          fits = false;
          break;
        }
      }
      if (!fits) continue;
      if (s + len < n && line[s + len] == Known.filled) continue;
      starts[g] = s;
      if (place(g + 1, s + len + 1)) return true;
    }
    failed.add(key);
    return false;
  }

  return place(0, 0) ? starts : null;
}
