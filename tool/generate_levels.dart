// Builds `assets/levels/level_NNN.json` from the pixel art in
// `tool/level_art.dart`.
//
//   dart run tool/generate_levels.dart
//
// For every picture it:
// * trims empty border rows/columns, then centres the picture on the
//   smallest board in [boardSizes] that fits (every side a multiple of 5,
//   so the 5-cell guides split it evenly; empty lines are fine),
// * makes the puzzle solvable by line logic alone (unique, no guessing) by
//   flipping as few cells as possible when the art is ambiguous,
// * rates its difficulty with the line solver,
// and then numbers the pictures world by world: pinned pictures first, then
// smallest and easiest first.
import 'dart:io';

import 'package:block_puzzle/core/languages.dart';
import 'package:block_puzzle/core/localized_text.dart';
import 'package:block_puzzle/features/game/domain/line_solver.dart';
import 'package:block_puzzle/features/game/domain/puzzle.dart';

import 'level_art.dart';

/// Board sizes (rows, cols), smallest first. Columns stop at 10 so cells
/// stay big enough on a portrait phone.
const boardSizes = [(5, 5), (10, 5), (5, 10), (10, 10), (15, 10)];

void main() {
  final pictures = <_Picture>[];
  final failed = <String>[];
  for (final art in levelArt) {
    try {
      pictures.add(_Picture.fromArt(art));
    } on _Unsolvable {
      failed.add('w${art.world} ${art.names[1]}');
    }
  }
  if (failed.isNotEmpty) {
    stderr
      ..writeln('Too ambiguous, redraw:')
      ..writeln(failed.map((f) => '  $f').join('\n'));
    exitCode = 1;
    return;
  }

  // World by world, pinned first (in listed order), then by size and
  // difficulty.
  final listed = {for (final (i, art) in levelArt.indexed) art: i};
  pictures.sort((a, b) {
    final world = a.art.world.compareTo(b.art.world);
    if (world != 0) return world;
    if (a.art.pinned || b.art.pinned) {
      if (!b.art.pinned) return -1;
      if (!a.art.pinned) return 1;
      return listed[a.art]!.compareTo(listed[b.art]!);
    }
    final size = (a.rows * a.cols).compareTo(b.rows * b.cols);
    if (size != 0) return size;
    return a.difficulty.compareTo(b.difficulty);
  });

  var id = 1;
  final report = StringBuffer();
  for (final p in pictures) {
    final path = 'assets/levels/level_${id.toString().padLeft(3, '0')}.json';
    File(path).writeAsStringSync(p.toJson(id));
    report.writeln(
      '${id.toString().padLeft(3)}  w${p.art.world}  '
      '${p.rows.toString().padLeft(2)}x${p.cols.toString().padLeft(2)}  '
      'difficulty ${p.difficulty.toStringAsFixed(2).padLeft(6)}  '
      'flips ${p.flips}  ${p.art.names[1]}',
    );
    id++;
  }
  stdout
    ..write(report)
    ..writeln('Wrote levels 1..${id - 1}.');
}

class _Picture {
  _Picture(this.art, this.grid, this.flips, this.difficulty);

  factory _Picture.fromArt(LevelArt art) {
    final name = art.names[1];
    final picture = _trim(_pad(art.pixels));
    final size = boardSizes.where(
      (s) => picture.length <= s.$1 && picture.first.length <= s.$2,
    );
    if (size.isEmpty) {
      throw StateError(
        '$name is ${picture.length}x${picture.first.length}, too big',
      );
    }
    var grid = _centre(picture, size.first);
    if (art.names.length != artLanguages.length) {
      throw StateError('$name needs ${artLanguages.length} names');
    }
    for (final row in grid) {
      for (final key in row) {
        if (key != '.' && !artPalette.containsKey(key)) {
          throw StateError('$name uses unknown colour "$key"');
        }
      }
    }
    final (repaired, flips) = _repair(grid);
    grid = repaired;
    return _Picture(art, grid, flips, _difficulty(_solution(grid)));
  }

  final LevelArt art;
  final List<List<String>> grid;
  final int flips;
  final double difficulty;

  int get rows => grid.length;
  int get cols => grid.first.length;

  String toJson(int id) {
    final names = [
      for (final lang in supportedLanguages.keys)
        '"$lang": "${art.names[artLanguages.indexOf(lang)]}"',
    ].join(', ');
    String list(Iterable<String> rows) =>
        '[${rows.map((r) => '"$r"').join(', ')}]';
    final used = {
      for (final row in grid)
        for (final key in row)
          if (key != '.') key,
    }.toList()..sort();
    final palette = used.map((k) => '"$k": "${artPalette[k]}"').join(', ');

    // Validate with the game's own model before writing.
    Puzzle(
      id: id,
      name: LocalizedText({'en': art.names[1]}),
      solution: _solution(grid),
      colors: [for (final row in grid) row.join()],
      palette: {for (final k in used) k: 0},
    );

    final solution = grid.map(
      (r) => r.map((k) => k == '.' ? '.' : '#').join(),
    );
    return '{\n'
        '  "id": $id,\n'
        '  "name": {$names},\n'
        '  "solution": ${list(solution)},\n'
        '  "colors":   ${list(grid.map((r) => r.join()))},\n'
        '  "palette":  { $palette }\n'
        '}\n';
  }
}

List<List<String>> _pad(List<String> pixels) {
  final width = pixels.fold(0, (w, r) => r.length > w ? r.length : w);
  return [for (final r in pixels) r.padRight(width, '.').split('')];
}

List<List<String>> _trim(List<List<String>> grid) {
  bool emptyRow(int r) => grid[r].every((k) => k == '.');
  bool emptyCol(int c) => grid.every((row) => row[c] == '.');
  var top = 0;
  var bottom = grid.length - 1;
  var left = 0;
  var right = grid.first.length - 1;
  while (top < bottom && emptyRow(top)) {
    top++;
  }
  while (bottom > top && emptyRow(bottom)) {
    bottom--;
  }
  while (left < right && emptyCol(left)) {
    left++;
  }
  while (right > left && emptyCol(right)) {
    right--;
  }
  return [
    for (var r = top; r <= bottom; r++) grid[r].sublist(left, right + 1),
  ];
}

/// [picture] in the middle of an empty board of [size].
List<List<String>> _centre(List<List<String>> picture, (int, int) size) {
  final (rows, cols) = size;
  final top = (rows - picture.length) ~/ 2;
  final left = (cols - picture.first.length) ~/ 2;
  return [
    for (var r = 0; r < rows; r++)
      [
        for (var c = 0; c < cols; c++)
          r >= top &&
                  r < top + picture.length &&
                  c >= left &&
                  c < left + picture.first.length
              ? picture[r - top][c - left]
              : '.',
      ],
  ];
}

List<List<bool>> _solution(List<List<String>> grid) => [
  for (final row in grid) [for (final k in row) k != '.'],
];

/// Line logic from scratch; returns the grid it could determine and how
/// many sweeps it took.
(List<List<Known>>, int) _lineLogic(List<List<bool>> solution) {
  final rows = solution.length;
  final cols = solution.first.length;
  final rowClues = [for (final row in solution) lineRuns(row)];
  final colClues = [
    for (var c = 0; c < cols; c++)
      lineRuns([for (final row in solution) row[c]]),
  ];
  final grid = List.generate(rows, (_) => List.filled(cols, Known.unknown));
  var sweeps = 0;
  var changed = true;
  while (changed) {
    changed = false;
    sweeps++;
    for (var r = 0; r < rows; r++) {
      final solved = solveLine(rowClues[r], grid[r])!;
      for (var c = 0; c < cols; c++) {
        if (grid[r][c] != solved[c]) {
          grid[r][c] = solved[c];
          changed = true;
        }
      }
    }
    for (var c = 0; c < cols; c++) {
      final solved = solveLine(colClues[c], [
        for (var r = 0; r < rows; r++) grid[r][c],
      ])!;
      for (var r = 0; r < rows; r++) {
        if (grid[r][c] != solved[r]) {
          grid[r][c] = solved[r];
          changed = true;
        }
      }
    }
  }
  return (grid, sweeps);
}

int _known(List<List<bool>> solution) => _lineLogic(
  solution,
).$1.fold(0, (sum, row) => sum + row.where((k) => k != Known.unknown).length);

/// The art needs too many changes to become a fair puzzle: redraw it.
class _Unsolvable implements Exception {
  const _Unsolvable();
}

/// Flips the fewest cells needed for line logic to solve the picture,
/// preferring changes that blend in (filling cells next to blocks, emptying
/// cells on the edge of the shape).
(List<List<String>>, int) _repair(List<List<String>> input) {
  final grid = [
    for (final row in input) [...row],
  ];
  final rows = grid.length;
  final cols = grid.first.length;
  var flips = 0;
  // A cell is flipped at most once, so the search cannot cycle.
  final flipped = <(int, int)>{};

  int filledNeighbours(int r, int c) {
    var n = 0;
    for (final (dr, dc) in const [(-1, 0), (1, 0), (0, -1), (0, 1)]) {
      final rr = r + dr;
      final cc = c + dc;
      if (rr >= 0 && cc >= 0 && rr < rows && cc < cols && grid[rr][cc] != '.') {
        n++;
      }
    }
    return n;
  }

  String fillColour(int r, int c) {
    final counts = <String, int>{};
    for (final (dr, dc) in const [(-1, 0), (1, 0), (0, -1), (0, 1)]) {
      final rr = r + dr;
      final cc = c + dc;
      if (rr >= 0 && cc >= 0 && rr < rows && cc < cols && grid[rr][cc] != '.') {
        counts.update(grid[rr][cc], (v) => v + 1, ifAbsent: () => 1);
      }
    }
    if (counts.isEmpty) {
      for (final row in grid) {
        for (final k in row) {
          if (k != '.') counts.update(k, (v) => v + 1, ifAbsent: () => 1);
        }
      }
    }
    return (counts.entries.toList()..sort((a, b) => b.value - a.value))
        .first
        .key;
  }

  while (true) {
    final solution = _solution(grid);
    final (known, _) = _lineLogic(solution);
    final unknown = [
      for (var r = 0; r < rows; r++)
        for (var c = 0; c < cols; c++)
          if (known[r][c] == Known.unknown) (r, c),
    ];
    if (unknown.isEmpty) return (grid, flips);
    if (flips > rows * cols ~/ 8) throw const _Unsolvable();

    (int, int)? best;
    var bestScore = -1.0;
    for (final (r, c) in unknown) {
      if (flipped.contains((r, c))) continue;
      final filled = solution[r][c];
      solution[r][c] = !filled;
      // Never empty a whole line: it would only shrink the picture.
      final emptiesLine =
          filled &&
          (!solution[r].contains(true) || !solution.any((row) => row[c]));
      final gain = emptiesLine ? -1 : _known(solution);
      solution[r][c] = filled;
      if (gain < 0) continue;
      final n = filledNeighbours(r, c);
      // Blend-in bonus below one cell of gain, so it only breaks ties.
      final blend = (filled ? 4 - n : n) / 10;
      final score = gain + blend;
      if (score > bestScore) {
        bestScore = score;
        best = (r, c);
      }
    }
    if (best == null) throw const _Unsolvable();
    final (r, c) = best;
    grid[r][c] = grid[r][c] == '.' ? fillColour(r, c) : '.';
    flipped.add(best);
    flips++;
  }
}

/// Higher is harder: more line-logic sweeps, fewer cells given away by the
/// first sweep, and more groups per line.
double _difficulty(List<List<bool>> solution) {
  final rows = solution.length;
  final cols = solution.first.length;
  final (_, sweeps) = _lineLogic(solution);

  // What one sweep over every line (no chaining) reveals.
  final rowClues = [for (final row in solution) lineRuns(row)];
  var firstPass = 0;
  for (var r = 0; r < rows; r++) {
    firstPass += solveLine(
      rowClues[r],
      List.filled(cols, Known.unknown),
    )!.where((k) => k != Known.unknown).length;
  }
  final groups = rowClues.fold(0, (sum, clue) => sum + clue.length) / rows;
  return sweeps + (1 - firstPass / (rows * cols)) * 3 + groups;
}
