import 'dart:convert';
import 'dart:io';

import 'package:block_puzzle/core/localized_text.dart';
import 'package:block_puzzle/features/game/domain/board.dart';
import 'package:block_puzzle/features/game/domain/hint.dart';
import 'package:block_puzzle/features/game/domain/puzzle.dart';
import 'package:flutter_test/flutter_test.dart';

Puzzle _puzzle(List<String> rows) => Puzzle(
  id: 1,
  name: const LocalizedText({'en': 'test'}),
  solution: [
    for (final r in rows) [for (final ch in r.split('')) ch == '#'],
  ],
  colors: [for (final r in rows) r.replaceAll('#', 'A')],
  palette: const {'A': 0xFF000000},
);

final _seen = <HintReason>{};

/// Follows hints only, checking that each one is right and logical.
Board _solveWithHints(Puzzle puzzle) {
  var board = Board.start(puzzle);
  for (var i = 0; i < puzzle.rows * puzzle.cols && !board.isSolved; i++) {
    final hint = findHint(board, seed: i)!;
    expect(hint.reason, isNot(HintReason.fallback));
    _seen.add(hint.reason);
    expect(puzzle.isFilled(hint.row, hint.col), hint.fill);
    final result = board.apply(
      hint.row,
      hint.col,
      hint.fill ? MoveAction.fill : MoveAction.cross,
      source: MarkSource.hint,
    );
    expect(result.mistake, isFalse);
    expect(result.changed, isTrue);
    board = result.board;
  }
  return board;
}

void main() {
  test('a full line is the first thing a hint teaches', () {
    final puzzle = _puzzle(['#####', '#....', '#.#..', '#....', '#....']);
    final hint = findHint(Board.start(puzzle))!;
    expect(hint.reason, HintReason.fullLine);
    expect(hint.fill, isTrue);
    expect(puzzle.isFilled(hint.row, hint.col), isTrue);
    expect(hint.line, 0);
    expect(hint.clue, [5]);
  });

  test('overlap: a 4 in a 5-wide line always covers the middle', () {
    final puzzle = _puzzle(['####.', '.#...', '.#...', '.#...', '.....']);
    final board = Board.start(puzzle);
    for (var seed = 0; seed < 20; seed++) {
      final hint = findHint(board, seed: seed)!;
      expect(hint.reason, HintReason.overlap);
      expect(hint.fill, isTrue);
      expect(puzzle.isFilled(hint.row, hint.col), isTrue);
    }
  });

  test('uses the cells already known (here: automatic X marks)', () {
    final puzzle = _puzzle(['#..', '...', '...']);
    final hint = findHint(Board.start(puzzle))!;
    expect(hint.reason, HintReason.forcedFill);
    expect((hint.row, hint.col), (0, 0));
  });

  test('a wrong player X is ignored and can be corrected by a hint', () {
    final puzzle = _puzzle(['###', '...', '...']);
    final board = Board.start(puzzle).apply(0, 1, MoveAction.cross).board;
    final hint = findHint(board)!;
    expect(hint.fill, isTrue);
    expect(hint.row, 0);
    final filled = board.apply(
      hint.row,
      hint.col,
      MoveAction.fill,
      source: MarkSource.hint,
    );
    expect(filled.mistake, isFalse);
    expect(filled.changed, isTrue);
  });

  test('no hint on a solved board', () {
    final puzzle = _puzzle(['#']);
    final board = Board.start(puzzle).apply(0, 0, MoveAction.fill).board;
    expect(findHint(board), isNull);
  });

  final files = Directory(
    'assets/levels',
  ).listSync().whereType<File>().where((f) => f.path.endsWith('.json'));
  for (final file in files) {
    test('hints alone solve ${file.uri.pathSegments.last} logically', () {
      final puzzle = Puzzle.fromJson(
        jsonDecode(file.readAsStringSync()) as Map<String, Object?>,
      );
      expect(_solveWithHints(puzzle).isSolved, isTrue);
    });
  }

  test('shipped levels exercise every kind of explanation', () {
    expect(
      _seen,
      containsAll(HintReason.values.where((r) => r != HintReason.fallback)),
    );
  });
}
