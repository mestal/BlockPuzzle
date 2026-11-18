import 'dart:convert';
import 'dart:io';

import 'package:block_puzzle/core/localized_text.dart';
import 'package:block_puzzle/features/game/domain/board.dart';
import 'package:block_puzzle/features/game/domain/hint.dart';
import 'package:block_puzzle/features/game/domain/line_solver.dart';
import 'package:block_puzzle/features/game/domain/puzzle.dart';
import 'package:block_puzzle/features/game/presentation/hint_card.dart';
import 'package:block_puzzle/l10n/gen/app_localizations.dart';
import 'package:flutter/widgets.dart';
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

/// A line from a picture: `#` filled, `x` empty, `?` unknown.
List<Known> _line(String text) => [
  for (final ch in text.split(''))
    switch (ch) {
      '#' => Known.filled,
      'x' => Known.empty,
      _ => Known.unknown,
    },
];

/// The hint [lineHints] gives for cell [i] of a row.
Hint _at(List<int> clue, String line, int i) => lineHints(
  clue: clue,
  line: _line(line),
  isRow: true,
  index: 0,
).firstWhere((h) => h.col == i);

/// Removes the left-to-right isolates so the text is easy to match.
String _plain(String text) => text.replaceAll(RegExp('[\u2066\u2069]'), '');

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
    final puzzle = _puzzle(['####.', '.#..#', '.#..#', '.#...', '#....']);
    final board = Board.start(puzzle);
    for (var seed = 0; seed < 20; seed++) {
      final hint = findHint(board, seed: seed)!;
      expect(hint.reason, HintReason.overlap);
      expect(hint.blankLine, isTrue);
      expect(hint.fill, isTrue);
      expect(puzzle.isFilled(hint.row, hint.col), isTrue);
    }
    final row = _at([4], '?????', 2);
    expect(
      row.groups.single,
      const GroupReach(size: 4, earliest: 0, latest: 1),
    );
    expect(row.span, (1, 3));
  });

  test('uses the cells already known (here: automatic X marks)', () {
    final puzzle = _puzzle(['#..', '...', '...']);
    final hint = findHint(Board.start(puzzle))!;
    expect(hint.reason, HintReason.overlap);
    expect(hint.blankLine, isFalse);
    expect((hint.row, hint.col), (0, 0));
  });

  group('rules', () {
    test('group reach follows the X marks and blocks', () {
      expect(groupReach([3], _line('?#????')), [
        const GroupReach(size: 3, earliest: 0, latest: 1),
      ]);
      expect(groupReach([2, 1], _line('??x???')), [
        // The 2 cannot sit at 4–5: the 1 has to come after it.
        const GroupReach(size: 2, earliest: 0, latest: 0),
        const GroupReach(size: 1, earliest: 3, latest: 5),
      ]);
      expect(groupReach([3], _line('??x?')), isNull);
    });

    test('full line', () {
      final hint = _at([2, 2], '?????', 0);
      expect(hint.reason, HintReason.fullLine);
      expect(hint.fill, isTrue);
      expect(hint.difficulty, 0);
    });

    test('overlap with known squares slides the group against them', () {
      final hint = _at([3], '?#????', 2);
      expect(hint.reason, HintReason.overlap);
      expect(hint.fill, isTrue);
      expect(hint.span, (1, 2));
      expect(hint.blankLine, isFalse);
    });

    test('out of reach names the groups on both sides', () {
      final hint = _at([2, 1], '?#?????#??', 4);
      expect(hint.reason, HintReason.outOfReach);
      expect(hint.fill, isFalse);
      expect(hint.groups, [
        const GroupReach(size: 2, earliest: 0, latest: 1),
        const GroupReach(size: 1, earliest: 7, latest: 7),
      ]);
    });

    test('a block as long as its biggest group is closed off', () {
      final hint = _at([1, 1, 1, 1], '?????#????', 4);
      expect(hint.reason, HintReason.blockDone);
      expect(hint.fill, isFalse);
      expect(hint.span, (5, 5));
    });

    test('a gap too small for any group that reaches it stays empty', () {
      final hint = _at([2, 2], '??x?x??x??', 3);
      expect(hint.reason, HintReason.tooSmall);
      expect(hint.fill, isFalse);
      expect(hint.span, (3, 3));
      expect(hint.groups.map((g) => g.size), everyElement(2));
    });

    test('the easiest rule wins across the board', () {
      // Row 0 is full (difficulty 0); everything else needs more work.
      final puzzle = _puzzle(['#####', '.#...', '.##..', '.....', '....#']);
      for (var seed = 0; seed < 10; seed++) {
        expect(
          findHint(Board.start(puzzle), seed: seed)!.reason,
          HintReason.fullLine,
        );
      }
    });
  });

  test('explanations carry the numbers of the line', () {
    final l10n = lookupAppLocalizations(const Locale('en'));
    String explain(Hint hint) => _plain(HintCard.explain(l10n, hint));

    expect(
      explain(
        const Hint(
          row: 0,
          col: 2,
          fill: true,
          reason: HintReason.overlap,
          length: 10,
          clue: [6, 1],
          groups: [GroupReach(size: 6, earliest: 0, latest: 2)],
          span: (2, 5),
        ),
      ),
      allOf(
        startsWith('Row 1 (6 1)'),
        contains('block of 6 covers squares 1–6'),
        contains('squares 3–8'),
        contains('Squares 3–6 are filled'),
      ),
    );
    expect(
      explain(
        const Hint(
          row: 4,
          col: 1,
          fill: false,
          reason: HintReason.outOfReach,
          isRow: false,
          line: 1,
          length: 10,
          clue: [2, 1],
          groups: [
            GroupReach(size: 2, earliest: 0, latest: 1),
            GroupReach(size: 1, earliest: 7, latest: 7),
          ],
        ),
      ),
      allOf(
        startsWith('Column 2 (2 1)'),
        contains('2 → 1–3, 1 → 8'),
        contains('Square 5 is outside'),
      ),
    );
    expect(
      explain(
        const Hint(
          row: 0,
          col: 0,
          fill: true,
          reason: HintReason.fullLine,
          length: 5,
          clue: [2, 2],
          fixesCross: true,
        ),
      ),
      allOf(contains('2 + 1 + 2 = 5'), endsWith('so we removed it.')),
    );
  });

  test('a wrong player X is ignored and can be corrected by a hint', () {
    final puzzle = _puzzle(['###', '...', '...']);
    final board = Board.start(puzzle).apply(0, 1, MoveAction.cross).board;
    final hint = findHint(board)!;
    expect(hint.fill, isTrue);
    expect(hint.row, 0);
    // The full row wins and the wrong X is fixed first.
    expect((hint.col, hint.fixesCross), (1, true));
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
      containsAll([
        HintReason.fullLine,
        HintReason.overlap,
        HintReason.outOfReach,
        HintReason.blockDone,
        HintReason.tooSmall,
      ]),
    );
  });
}
