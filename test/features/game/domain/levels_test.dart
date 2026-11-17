import 'dart:convert';
import 'dart:io';

import 'package:block_puzzle/features/game/domain/line_solver.dart';
import 'package:block_puzzle/features/game/domain/puzzle.dart';
import 'package:block_puzzle/features/levels/level_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('solveLine narrows an overlapping block', () {
    final line = solveLine([3], List.filled(4, Known.unknown))!;
    expect(line, [Known.unknown, Known.filled, Known.filled, Known.unknown]);
  });

  test('solveLine detects contradictions', () {
    expect(solveLine([2], [Known.filled, Known.empty, Known.filled]), isNull);
  });

  test('solveByLineLogic rejects an ambiguous puzzle', () {
    // Two diagonals share the same clues.
    expect(
      solveByLineLogic(
        [
          [1],
          [1],
        ],
        [
          [1],
          [1],
        ],
      ),
      isNull,
    );
  });

  final files = Directory('assets/levels')
      .listSync()
      .whereType<File>()
      .where((f) => f.path.endsWith('.json'))
      .toList();

  test('catalog count matches the level files', () {
    expect(files.length, LevelRepository.levelCount);
  });

  for (final file in files) {
    test(
      '${file.uri.pathSegments.last} is valid, unique and logic-solvable',
      () {
        final json =
            jsonDecode(file.readAsStringSync()) as Map<String, Object?>;
        final puzzle = Puzzle.fromJson(json);
        expect(file.path, contains(puzzle.id.toString().padLeft(3, '0')));
        // Sides are multiples of 5 so the 5-cell guides split them evenly.
        expect(puzzle.rows % 5, 0, reason: '${puzzle.rows} rows');
        expect(puzzle.cols % 5, 0, reason: '${puzzle.cols} cols');
        expect(puzzle.rows, lessThanOrEqualTo(15));
        expect(puzzle.cols, lessThanOrEqualTo(10));
        final solved = solveByLineLogic(puzzle.rowClues, puzzle.colClues);
        expect(solved, isNotNull, reason: 'needs guessing or has many answers');
        expect(solved, puzzle.solution);
      },
    );
  }
}
