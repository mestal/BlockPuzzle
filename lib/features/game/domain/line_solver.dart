/// Pure line-logic nonogram solver used to validate levels: a level is
/// accepted only if line logic alone fills the whole grid, which proves the
/// solution is unique and reachable without guessing.
library;

enum Known { unknown, filled, empty }

/// Narrows [line] using every placement of [clue] consistent with it.
/// Returns null if no placement fits (contradiction).
List<Known>? solveLine(List<int> clue, List<Known> line) {
  final n = line.length;
  final canFill = List<bool>.filled(n, false);
  final canEmpty = List<bool>.filled(n, false);
  final current = List<bool>.filled(n, false);
  var found = false;

  final suffix = List<int>.filled(clue.length + 1, 0);
  for (var i = clue.length - 1; i >= 0; i--) {
    suffix[i] = suffix[i + 1] + clue[i] + (i + 1 < clue.length ? 1 : 0);
  }

  void place(int index, int start) {
    if (index == clue.length) {
      for (var i = start; i < n; i++) {
        if (line[i] == Known.filled) return;
      }
      found = true;
      for (var i = 0; i < n; i++) {
        if (current[i]) {
          canFill[i] = true;
        } else {
          canEmpty[i] = true;
        }
      }
      return;
    }
    final len = clue[index];
    final tail = suffix[index + 1] + (index + 1 < clue.length ? 1 : 0);
    for (var s = start; s + len + tail <= n; s++) {
      if (s > start && line[s - 1] == Known.filled) break;
      var fits = true;
      for (var i = s; i < s + len; i++) {
        if (line[i] == Known.empty) {
          fits = false;
          break;
        }
      }
      if (!fits) continue;
      if (s + len < n && line[s + len] == Known.filled) continue;
      for (var i = s; i < s + len; i++) {
        current[i] = true;
      }
      place(index + 1, s + len + 1);
      for (var i = s; i < s + len; i++) {
        current[i] = false;
      }
    }
  }

  place(0, 0);
  if (!found) return null;
  return [
    for (var i = 0; i < n; i++)
      canFill[i] && !canEmpty[i]
          ? Known.filled
          : canEmpty[i] && !canFill[i]
          ? Known.empty
          : Known.unknown,
  ];
}

/// Solves the grid by repeated line logic. Returns the solution when line
/// logic determines every cell, otherwise null.
List<List<bool>>? solveByLineLogic(
  List<List<int>> rowClues,
  List<List<int>> colClues,
) {
  final rows = rowClues.length;
  final cols = colClues.length;
  final grid = List.generate(rows, (_) => List.filled(cols, Known.unknown));

  var changed = true;
  while (changed) {
    changed = false;
    for (var r = 0; r < rows; r++) {
      final solved = solveLine(rowClues[r], grid[r]);
      if (solved == null) return null;
      for (var c = 0; c < cols; c++) {
        if (grid[r][c] != solved[c]) {
          grid[r][c] = solved[c];
          changed = true;
        }
      }
    }
    for (var c = 0; c < cols; c++) {
      final column = [for (var r = 0; r < rows; r++) grid[r][c]];
      final solved = solveLine(colClues[c], column);
      if (solved == null) return null;
      for (var r = 0; r < rows; r++) {
        if (grid[r][c] != solved[r]) {
          grid[r][c] = solved[r];
          changed = true;
        }
      }
    }
  }

  if (grid.any((row) => row.contains(Known.unknown))) return null;
  return [
    for (final row in grid) [for (final k in row) k == Known.filled],
  ];
}
