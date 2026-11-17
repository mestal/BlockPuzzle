import 'package:block_puzzle/features/game/domain/board.dart';
import 'package:block_puzzle/features/game/domain/puzzle.dart';
import 'package:flutter_test/flutter_test.dart';

Puzzle _puzzle(List<String> rows) => Puzzle(
  id: 1,
  name: 'test',
  solution: [
    for (final r in rows) [for (final ch in r.split('')) ch == '#'],
  ],
  colors: [for (final r in rows) r.replaceAll('#', 'A')],
  palette: const {'A': 0xFF000000},
);

void main() {
  group('lineRuns', () {
    test('counts groups in order', () {
      expect(lineRuns([true, true, false, true]), [2, 1]);
      expect(lineRuns([false, false]), isEmpty);
      expect(lineRuns([true, true, true]), [3]);
    });
  });

  group('Puzzle', () {
    test('computes row and column clues', () {
      final p = _puzzle(['.##.', '####', '.##.', '.##.']);
      expect(p.rowClues, [
        [2],
        [4],
        [2],
        [2],
      ]);
      expect(p.colClues, [
        [1],
        [4],
        [4],
        [1],
      ]);
      expect(p.filledCount, 10);
    });

    test('rejects colours that disagree with the solution', () {
      expect(
        () => Puzzle(
          id: 9,
          name: 'bad',
          solution: const [
            [true, false],
          ],
          colors: const ['AA'],
          palette: const {'A': 0},
        ),
        throwsFormatException,
      );
    });
  });

  group('Board.apply', () {
    final puzzle = _puzzle(['#.#', '###', '...']);

    test('empty-clue lines start crossed automatically', () {
      final board = Board.start(puzzle);
      expect(board.solvedRows, {2});
      expect(board.at(2, 1), const Cell(CellMark.crossed, MarkSource.auto));
    });

    test('correct fill and correct cross are not mistakes', () {
      final board = Board.start(puzzle);
      final fill = board.apply(0, 0, MoveAction.fill);
      expect(fill.mistake, isFalse);
      expect(fill.board.at(0, 0), const Cell(CellMark.filled));

      final cross = board.apply(0, 1, MoveAction.cross);
      expect(cross.mistake, isFalse);
      expect(cross.board.at(0, 1), const Cell(CellMark.crossed));
    });

    test('filling an empty cell is a mistake and becomes a red X', () {
      final result = Board.start(puzzle).apply(0, 1, MoveAction.fill);
      expect(result.mistake, isTrue);
      expect(
        result.board.at(0, 1),
        const Cell(CellMark.crossed, MarkSource.mistake),
      );
    });

    test('crossing is never a mistake, even on a filled cell', () {
      final result = Board.start(puzzle).apply(0, 0, MoveAction.cross);
      expect(result.mistake, isFalse);
      expect(result.changed, isTrue);
      expect(result.board.at(0, 0), const Cell(CellMark.crossed));
    });

    test('a wrong X can still be filled over (and is correct)', () {
      final crossed = Board.start(puzzle).apply(0, 0, MoveAction.cross).board;
      final result = crossed.apply(0, 0, MoveAction.fill);
      expect(result.mistake, isFalse);
      expect(result.board.at(0, 0), const Cell(CellMark.filled));
    });

    test('filling over an X on an empty cell is a mistake', () {
      final crossed = Board.start(puzzle).apply(0, 1, MoveAction.cross).board;
      final result = crossed.apply(0, 1, MoveAction.fill);
      expect(result.mistake, isTrue);
      expect(
        result.board.at(0, 1),
        const Cell(CellMark.crossed, MarkSource.mistake),
      );
    });

    test('erase removes a manual X but nothing else', () {
      final crossed = Board.start(puzzle).apply(0, 1, MoveAction.cross).board;
      expect(crossed.apply(0, 1, MoveAction.erase).board.at(0, 1), Cell.empty);
      final filled = Board.start(puzzle).apply(0, 0, MoveAction.fill).board;
      expect(filled.apply(0, 0, MoveAction.erase).changed, isFalse);
      expect(
        Board.start(puzzle).apply(0, 0, MoveAction.erase).changed,
        isFalse,
      );
    });

    test('crossing a crossed cell does nothing', () {
      final crossed = Board.start(puzzle).apply(0, 1, MoveAction.cross).board;
      expect(crossed.apply(0, 1, MoveAction.cross).changed, isFalse);
    });

    test('completing a line turns wrong user X into automatic X', () {
      var board = Board.start(puzzle).apply(0, 0, MoveAction.cross).board;
      board = board.apply(0, 2, MoveAction.fill).board;
      final result = board.apply(0, 0, MoveAction.fill);
      expect(result.completedRows, [0]);
      expect(
        result.board.at(0, 1),
        const Cell(CellMark.crossed, MarkSource.auto),
      );

      // A user X inside a line that completes becomes automatic.
      var b2 = Board.start(puzzle).apply(0, 1, MoveAction.cross).board;
      b2 = b2.apply(0, 0, MoveAction.fill).board;
      final done = b2.apply(0, 2, MoveAction.fill);
      expect(
        done.board.at(0, 1),
        const Cell(CellMark.crossed, MarkSource.auto),
      );
    });

    test('touching an open cell is ignored', () {
      final board = Board.start(puzzle).apply(0, 0, MoveAction.fill).board;
      final again = board.apply(0, 0, MoveAction.cross);
      expect(again.changed, isFalse);
      expect(again.mistake, isFalse);
      expect(board.apply(0, 0, MoveAction.fill).changed, isFalse);
    });

    test('completing a row auto-crosses its empty cells', () {
      var board = Board.start(puzzle).apply(0, 0, MoveAction.fill).board;
      final result = board.apply(0, 2, MoveAction.fill);
      board = result.board;
      expect(result.completedRows, [0]);
      expect(board.at(0, 1), const Cell(CellMark.crossed, MarkSource.auto));
    });

    test('solving the last cell reports solved', () {
      var board = Board.start(puzzle);
      MoveResult? last;
      for (final (r, c) in [(0, 0), (0, 2), (1, 0), (1, 1), (1, 2)]) {
        last = board.apply(r, c, MoveAction.fill);
        board = last.board;
      }
      expect(last!.solved, isTrue);
      expect(board.isSolved, isTrue);
      expect(board.cells.where((c) => !c.isOpen), isEmpty);
    });

    test('encode/decode round-trips', () {
      final board = Board.start(
        puzzle,
      ).apply(0, 0, MoveAction.fill).board.apply(0, 1, MoveAction.fill).board;
      final restored = Board.decode(puzzle, board.encode());
      expect(restored.cells, board.cells);
      expect(restored.solvedRows, board.solvedRows);
    });

    test('hintCell returns an unfound filled cell', () {
      final board = Board.start(puzzle).apply(0, 0, MoveAction.fill).board;
      for (var seed = 0; seed < 10; seed++) {
        final (r, c) = board.hintCell(seed)!;
        expect(puzzle.isFilled(r, c), isTrue);
        expect(board.at(r, c).isOpen, isFalse);
      }
    });
  });
}
