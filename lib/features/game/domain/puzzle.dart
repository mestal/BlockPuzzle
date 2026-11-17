import 'package:meta/meta.dart';

/// Lengths of consecutive filled runs in [line]. Empty list for a blank line.
List<int> lineRuns(Iterable<bool> line) {
  final runs = <int>[];
  var current = 0;
  for (final filled in line) {
    if (filled) {
      current++;
    } else if (current > 0) {
      runs.add(current);
      current = 0;
    }
  }
  if (current > 0) runs.add(current);
  return runs;
}

/// An immutable nonogram level: its solution and the picture it reveals.
@immutable
final class Puzzle {
  Puzzle({
    required this.id,
    required this.name,
    required List<List<bool>> solution,
    required List<String> colors,
    required Map<String, int> palette,
  }) : solution = List.unmodifiable(solution.map(List<bool>.unmodifiable)),
       colors = List.unmodifiable(colors),
       palette = Map.unmodifiable(palette),
       rows = solution.length,
       cols = solution.first.length {
    if (solution.any((r) => r.length != cols)) {
      throw FormatException('Level $id: rows have different lengths');
    }
    if (colors.length != rows || colors.any((r) => r.length != cols)) {
      throw FormatException('Level $id: colors do not match the grid size');
    }
    for (var r = 0; r < rows; r++) {
      for (var c = 0; c < cols; c++) {
        final key = colors[r][c];
        if (solution[r][c] != (key != '.')) {
          throw FormatException('Level $id: color/solution mismatch at $r,$c');
        }
        if (key != '.' && !palette.containsKey(key)) {
          throw FormatException('Level $id: unknown palette key "$key"');
        }
      }
    }
  }

  factory Puzzle.fromJson(Map<String, Object?> json) {
    final solution = (json['solution']! as List).cast<String>();
    return Puzzle(
      id: json['id']! as int,
      name: json['name']! as String,
      solution: [
        for (final row in solution) [for (final ch in row.split('')) ch == '#'],
      ],
      colors: (json['colors']! as List).cast<String>(),
      palette: {
        for (final MapEntry(:key, :value)
            in (json['palette']! as Map).cast<String, String>().entries)
          key: _parseHex(value),
      },
    );
  }

  final int id;
  final String name;
  final int rows;
  final int cols;

  /// `solution[r][c]` is true when the cell must be filled.
  final List<List<bool>> solution;

  /// Palette key per cell (`.` for empty cells).
  final List<String> colors;

  /// Palette key → ARGB colour.
  final Map<String, int> palette;

  late final List<List<int>> rowClues = [
    for (var r = 0; r < rows; r++) lineRuns(solution[r]),
  ];

  late final List<List<int>> colClues = [
    for (var c = 0; c < cols; c++)
      lineRuns([for (final row in solution) row[c]]),
  ];

  late final int filledCount = solution.fold(
    0,
    (sum, row) => sum + row.where((f) => f).length,
  );

  bool isFilled(int r, int c) => solution[r][c];

  /// ARGB colour of the revealed picture at (r, c), or null for empty cells.
  int? colorAt(int r, int c) => palette[colors[r][c]];

  static int _parseHex(String hex) {
    final digits = hex.replaceFirst('#', '');
    return int.parse(digits.length == 6 ? 'FF$digits' : digits, radix: 16);
  }

  @override
  bool operator ==(Object other) => other is Puzzle && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
