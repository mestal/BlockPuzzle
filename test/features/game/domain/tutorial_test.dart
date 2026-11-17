import 'dart:convert';
import 'dart:io';

import 'package:block_puzzle/features/game/domain/board.dart';
import 'package:block_puzzle/features/game/domain/puzzle.dart';
import 'package:block_puzzle/features/game/domain/tutorial.dart';
import 'package:flutter_test/flutter_test.dart';

Puzzle _level(int id) => Puzzle.fromJson(
  jsonDecode(
        File(
          'assets/levels/level_${id.toString().padLeft(3, '0')}.json',
        ).readAsStringSync(),
      )
      as Map<String, Object?>,
);

/// Plays what the hand shows for [step], the way the board view would.
Board _perform(Board board, TutorialStep step) {
  final (r, c) = step.from!;
  switch (step.gesture!) {
    case TutorialGesture.tap:
      return board.apply(r, c, MoveAction.fill).board;
    case TutorialGesture.doubleTap:
      return board.apply(r, c, MoveAction.cross).board;
    case TutorialGesture.drag:
      final (r2, c2) = step.to!;
      var b = board;
      for (var i = r; i <= r2; i++) {
        for (var j = c; j <= c2; j++) {
          final result = b.apply(i, j, MoveAction.fill);
          expect(result.mistake, isFalse, reason: 'drag hits an empty cell');
          b = result.board;
        }
      }
      return b;
  }
}

void main() {
  test('only the first two levels are guided', () {
    for (final id in Tutorial.levels) {
      expect(Tutorial.forLevel(id), isNotNull);
    }
    expect(Tutorial.forLevel(3), isNull);
  });

  for (final id in Tutorial.levels) {
    test('level $id: following the hand finishes every step', () {
      final puzzle = _level(id);
      final tutorial = Tutorial.forLevel(id)!;
      var board = Board.start(puzzle);
      final acked = <int>{};
      var shown = <int>[];

      for (var guard = 0; guard < 20; guard++) {
        final i = tutorial.currentStep(board, acked);
        if (i == null) break;
        shown = [...shown, i];
        final step = tutorial.steps[i];
        if (step.focus case final f?) {
          expect(f.index, lessThan(f.isRow ? puzzle.rows : puzzle.cols));
        }
        if (step.gesture == null) {
          if (step.needsAck) {
            acked.add(i);
          } else {
            // Text-only step that ends with the level: finish it.
            board = _solve(board);
          }
          continue;
        }
        final before = board;
        board = _perform(board, step);
        expect(board, isNot(same(before)), reason: 'step $i changes nothing');
        expect(step.done!(board), isTrue, reason: 'step $i not done');
      }
      expect(shown, [for (var i = 0; i < tutorial.steps.length; i++) i]);
      expect(tutorial.currentStep(board, acked), isNull);
    });
  }

  test('running ahead skips the steps already covered', () {
    final tutorial = Tutorial.forLevel(1)!;
    var board = Board.start(_level(1));
    for (var c = 0; c < 4; c++) {
      board = board.apply(1, c, MoveAction.fill).board;
    }
    expect(tutorial.currentStep(board, const {}), 2);
  });

  test('a text-only step waits for the player', () {
    final tutorial = Tutorial.forLevel(2)!;
    var board = Board.start(_level(2));
    board = board.apply(3, 2, MoveAction.cross).board;
    for (var c = 0; c < 4; c++) {
      board = board.apply(3, c, MoveAction.fill).board;
    }
    final last = tutorial.steps.length - 1;
    expect(tutorial.steps[last].needsAck, isTrue);
    expect(tutorial.currentStep(board, const {}), last);
    expect(tutorial.currentStep(board, {last}), isNull);
  });
}

Board _solve(Board board) {
  var b = board;
  final p = b.puzzle;
  for (var r = 0; r < p.rows; r++) {
    for (var c = 0; c < p.cols; c++) {
      if (p.isFilled(r, c)) b = b.apply(r, c, MoveAction.fill).board;
    }
  }
  return b;
}
