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

/// Cells from [from] to [to] along one line, both included.
List<CellPos> _path(CellPos from, CellPos to) {
  expect(
    from.$1 == to.$1 || from.$2 == to.$2,
    isTrue,
    reason: 'a drag stays on one line',
  );
  final n = (to.$1 - from.$1).abs() + (to.$2 - from.$2).abs();
  return [
    for (var i = 0; i <= n; i++)
      (
        from.$1 + (to.$1 - from.$1).sign * i,
        from.$2 + (to.$2 - from.$2).sign * i,
      ),
  ];
}

/// Plays what the hand shows for [step], the way the board view would. The
/// hand never shows a mistake: fills land on filled cells of the answer and
/// X marks on empty ones.
Board _perform(Board board, TutorialStep step) {
  final from = step.from!;
  final cells = switch (step.gesture!) {
    TutorialGesture.tap || TutorialGesture.doubleTap => [from],
    TutorialGesture.drag ||
    TutorialGesture.crossDrag => _path(from, step.to ?? from),
  };
  final fill =
      step.gesture == TutorialGesture.tap ||
      step.gesture == TutorialGesture.drag;
  var b = board;
  for (final (r, c) in cells) {
    // A drag skips cells that are already open (filled or X).
    if (b.at(r, c).isOpen) continue;
    expect(
      b.puzzle.isFilled(r, c),
      fill,
      reason: 'the hand ${fill ? 'fills' : 'crosses'} ($r, $c)',
    );
    final result = b.apply(r, c, fill ? MoveAction.fill : MoveAction.cross);
    expect(result.mistake, isFalse);
    b = result.board;
  }
  return b;
}

Board _fillLines(Board board, List<TutorialLine> lines) {
  var b = board;
  final p = b.puzzle;
  for (final line in lines) {
    for (var i = 0; i < (line.isRow ? p.cols : p.rows); i++) {
      final (r, c) = line.isRow ? (line.index, i) : (i, line.index);
      if (p.isFilled(r, c)) b = b.apply(r, c, MoveAction.fill).board;
    }
  }
  return b;
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

void main() {
  test('the first five levels are guided, one lesson each', () {
    expect(Tutorial.levels, {1, 2, 3, 4, 5});
    for (final id in Tutorial.levels) {
      expect(Tutorial.forLevel(id)!.lesson, id);
    }
    expect(Tutorial.forLevel(6), isNull);
  });

  test('every text is used once', () {
    final used = [
      for (final id in Tutorial.levels)
        for (final step in Tutorial.forLevel(id)!.steps) step.text,
    ];
    expect(used.toSet().length, used.length);
    expect(used.toSet(), TutorialText.values.toSet());
  });

  for (final id in Tutorial.levels) {
    test('level $id: following the hand finishes every step', () {
      final puzzle = _level(id);
      final tutorial = Tutorial.forLevel(id)!;
      var board = Board.start(puzzle);
      final acked = <int>{};
      final shown = <int>[];

      for (var guard = 0; guard < 40; guard++) {
        final i = tutorial.currentStep(board, acked);
        if (i == null) break;
        shown.add(i);
        final step = tutorial.steps[i];
        for (final line in step.focus) {
          expect(
            line.index,
            lessThan(line.isRow ? puzzle.rows : puzzle.cols),
          );
        }
        for (final (r, c) in [...step.ghostFills, ...step.ghostCrosses]) {
          expect(
            puzzle.isFilled(r, c),
            step.ghostFills.contains((r, c)),
            reason: 'ghost at ($r, $c) shows the answer',
          );
        }
        if (step.from case (final r, final c)) {
          final cell = board.at(r, c);
          // A fill may start on a filled cell (the drag skips it), but never
          // on an X; an X slide from a taken cell would erase, and a double
          // tap only acts on an empty cell or the player's own X.
          final ok = switch (step.gesture!) {
            TutorialGesture.tap ||
            TutorialGesture.drag => cell.mark != CellMark.crossed,
            TutorialGesture.crossDrag => !cell.isOpen,
            TutorialGesture.doubleTap => !cell.isLocked,
          };
          expect(ok, isTrue, reason: 'step $i starts on ($r, $c)');
        }
        if (step.slide case final length?) {
          final line = step.focus.first;
          final cells = line.isRow ? puzzle.cols : puzzle.rows;
          expect(length * 2, greaterThan(cells), reason: 'overlap exists');
          final clue = line.isRow
              ? puzzle.rowClues[line.index]
              : puzzle.colClues[line.index];
          expect(clue, [length]);
        }
        if (step.needsAck) {
          acked.add(i);
        } else if (step.gesture != null) {
          final before = board;
          board = _perform(board, step);
          expect(board, isNot(same(before)), reason: 'step $i does nothing');
          // A nudge for a try-it-yourself step may show only the start; the
          // player finishes the line.
          if (step.selfTry && !step.done!(board)) {
            board = _fillLines(board, step.focus);
          }
          expect(step.done!(board), isTrue, reason: 'step $i not done');
        } else {
          // "Finish the picture": the player is on their own.
          board = _solve(board);
        }
      }
      expect(shown, [for (var i = 0; i < tutorial.steps.length; i++) i]);
      expect(tutorial.currentStep(board, acked), isNull);
      expect(board.isSolved, isTrue);
    });
  }

  test('running ahead skips the steps already covered', () {
    final tutorial = Tutorial.forLevel(1)!;
    var board = Board.start(_level(1));
    for (var c = 0; c < 5; c++) {
      board = board.apply(1, c, MoveAction.fill).board;
    }
    // Welcome acknowledged; tap and drag on row 2 are done.
    expect(tutorial.currentStep(board, const {0}), 3);
  });

  test('a text-only step is skipped once its lesson is done', () {
    final tutorial = Tutorial.forLevel(3)!;
    var board = Board.start(_level(3));
    for (var r = 1; r <= 3; r++) {
      board = board.apply(r, 0, MoveAction.fill).board;
    }
    expect(tutorial.steps[0].needsAck, isTrue);
    expect(tutorial.currentStep(board, const {}), 2);
  });

  test('a text-only step waits for the player', () {
    final tutorial = Tutorial.forLevel(2)!;
    var board = Board.start(_level(2));
    for (final r in [3, 4]) {
      board = board.apply(r, 2, MoveAction.cross).board;
      for (var c = 0; c < 5; c++) {
        board = board.apply(r, c, MoveAction.fill).board;
      }
    }
    final mistakes = tutorial.steps.indexWhere(
      (s) => s.text == TutorialText.l2Mistakes,
    );
    expect(tutorial.steps[mistakes].needsAck, isTrue);
    expect(tutorial.steps[mistakes].anchor, TutorialAnchor.lives);
    expect(tutorial.currentStep(board, const {}), mistakes);
    expect(tutorial.currentStep(board, {mistakes}), mistakes + 1);
  });

  test('the X line lesson needs all three X marks', () {
    final tutorial = Tutorial.forLevel(4)!;
    var board = Board.start(_level(4));
    expect(tutorial.currentStep(board, const {0}), 1);
    board = board.apply(1, 1, MoveAction.cross).board;
    expect(tutorial.currentStep(board, const {0}), 1);
    board = board.apply(2, 1, MoveAction.cross).board;
    expect(tutorial.currentStep(board, const {0}), 1);
    board = board.apply(0, 1, MoveAction.cross).board;
    expect(tutorial.currentStep(board, const {0}), 2);
  });

  test('lesson 5 crosses the middle row in two sideways slides', () {
    final tutorial = Tutorial.forLevel(5)!;
    final slides = [
      for (final step in tutorial.steps)
        if (step.gesture == TutorialGesture.crossDrag) step,
    ];
    expect(slides, hasLength(2));
    for (final step in slides) {
      expect(step.from!.$1, 2, reason: 'a slide along the middle row');
      expect(step.to!.$1, 2);
    }
    var board = Board.start(_level(5));
    expect(tutorial.currentStep(board, const {0}), 1);
    board = board.apply(2, 0, MoveAction.cross).board;
    expect(tutorial.currentStep(board, const {0}), 2);
  });

  test('lesson 5 skips the slides once the middle row is solved', () {
    final tutorial = Tutorial.forLevel(5)!;
    final board = Board.start(_level(5)).apply(2, 2, MoveAction.fill).board;
    expect(board.at(2, 0).isLocked, isTrue);
    final i = tutorial.currentStep(board, const {});
    expect(tutorial.steps[i!].text, TutorialText.l5Hint);
  });

  test('the hand never starts a slide on an automatic X', () {
    final tutorial = Tutorial.forLevel(4)!;
    var board = Board.start(_level(4));
    // The player solves the first `1 1 1` row before drawing any X: the
    // game crosses (0, 1) and (0, 3) itself.
    for (final c in [0, 2, 4]) {
      board = board.apply(0, c, MoveAction.fill).board;
    }
    expect(board.at(0, 1).isLocked, isTrue);
    final i = tutorial.currentStep(board, const {0});
    final step = tutorial.steps[i!];
    if (step.from case (final r, final c)) {
      expect(board.at(r, c).isLocked, isFalse, reason: 'step $i');
    }
  });
}
