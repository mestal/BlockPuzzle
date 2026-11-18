import 'package:block_puzzle/features/game/domain/board.dart';
import 'package:meta/meta.dart';

/// The gesture a tutorial step acts out with the animated hand.
enum TutorialGesture {
  /// Single tap: fill.
  tap,

  /// Double tap: X (or, on the player's own X, remove it).
  doubleTap,

  /// Press and drag: fill along a line.
  drag,

  /// Double tap and drag with the second press: X along a line.
  crossDrag,
}

/// A part of the screen outside the board that a step points at.
enum TutorialAnchor { lives, hint }

/// Which explanation a step shows (mapped to an ARB text by the UI). In the
/// texts, `[2 2]` is drawn as a clue chip.
enum TutorialText {
  welcome,
  l1Fill,
  l1Drag,
  l1Row,
  l1AutoCross,
  l1Column,
  l1Count,
  l1Finish,
  l2Groups,
  l2Cross,
  l2Drag,
  l2CrossSelf,
  l2DragSelf,
  l2Mistakes,
  l2Finish,
  l3Overlap,
  l3OverlapFill,
  l3OverlapSelf,
  l3OverlapRow,
  l3Finish,
  l4Ones,
  l4CrossDrag,
  l4CrossDragSelf,
  l4Erase,
  l4Finish,
  l5Gaps,
  l5CrossDrag,
  l5CrossDragSelf,
  l5Count,
  l5Hint,
  l5Finish,
}

typedef CellPos = (int, int);

/// A row or column the step is about; its clue is highlighted and the rest
/// of the board is dimmed.
typedef TutorialLine = ({bool isRow, int index});

/// One step of a guided level.
///
/// A step with [done] finishes by itself once the board satisfies it; a
/// step without it waits for the player to acknowledge the text (and is
/// skipped once [obsolete] holds, when the player already did what it
/// prepares).
@immutable
final class TutorialStep {
  const TutorialStep({
    required this.text,
    this.focus = const [],
    this.gesture,
    this.from,
    this.to,
    this.selfTry = false,
    this.slide,
    this.ghostFills = const [],
    this.ghostCrosses = const [],
    this.anchor,
    this.done,
    this.obsolete,
  });

  final TutorialText text;
  final List<TutorialLine> focus;

  /// What the hand shows, starting at [from] (and moving to [to] for a
  /// drag). Null when the hand stays hidden.
  final TutorialGesture? gesture;
  final CellPos? from;
  final CellPos? to;

  /// The player is asked to do it alone: the hand only shows up after a
  /// pause, as a nudge.
  final bool selfTry;

  /// Acts out the overlap rule on the first [focus] line: a block of this
  /// many cells slides from one end of the line to the other, and the cells
  /// it always covers glow.
  final int? slide;

  /// Cells drawn as see-through blocks / X marks: how a clue lays out.
  final List<CellPos> ghostFills;
  final List<CellPos> ghostCrosses;

  final TutorialAnchor? anchor;
  final bool Function(Board board)? done;
  final bool Function(Board board)? obsolete;

  /// Whether the player has to press "Got it" to move on.
  bool get needsAck => done == null;

  bool isFinished(Board board, {required bool acknowledged}) =>
      done?.call(board) ?? (acknowledged || (obsolete?.call(board) ?? false));
}

/// The guided first levels. Each teaches one or two ideas on a board whose
/// answer is easy to see, then lets the player finish the picture:
///
/// 1. clues, tap, drag, automatic X, counting what is left
/// 2. several groups in one clue, double tap for X, X is skipped by a drag,
///    mistakes cost hearts
/// 3. the overlap rule
/// 4. `1 1 1`, a line of three X marks, removing an X
/// 5. X marks as a solving tool: a sideways X slide, then counting what is
///    left; the hint button
@immutable
final class Tutorial {
  const Tutorial(this.lesson, this.steps);

  /// 1-based number of the lesson (the level id).
  final int lesson;
  final List<TutorialStep> steps;

  /// Levels that have a tutorial. Their pictures are pinned in
  /// `tool/art/w01_sunset.dart`, since the steps point at their cells.
  static const levels = {1, 2, 3, 4, 5};

  static Tutorial? forLevel(int id) => switch (id) {
    1 => _level1,
    2 => _level2,
    3 => _level3,
    4 => _level4,
    5 => _level5,
    _ => null,
  };

  /// Index of the step to show: the first one that is not finished yet.
  /// Steps are derived from the board, so a player who runs ahead (say,
  /// fills the whole row at once) skips the steps already covered.
  /// [acknowledged] holds the text-only steps the player has closed. Null
  /// when the tutorial is over.
  int? currentStep(Board board, Set<int> acknowledged) {
    for (final (i, step) in steps.indexed) {
      if (!step.isFinished(board, acknowledged: acknowledged.contains(i))) {
        return i;
      }
    }
    return null;
  }
}

TutorialLine _row(int index) => (isRow: true, index: index);
TutorialLine _col(int index) => (isRow: false, index: index);

bool _filled(Board b, List<CellPos> cells) =>
    cells.every((p) => b.at(p.$1, p.$2).mark == CellMark.filled);

bool _crossed(Board b, List<CellPos> cells) =>
    cells.every((p) => b.at(p.$1, p.$2).mark == CellMark.crossed);

bool _anyFilledInRow(Board b, int r) => [
  for (var c = 0; c < b.puzzle.cols; c++) b.at(r, c),
].any((cell) => cell.mark == CellMark.filled);

bool _solved(Board b) => b.isSolved;

bool _started(Board b) => b.cells.any((cell) => cell.mark == CellMark.filled);

/// Level 1, the mushroom: tap, drag, the automatic X, then counting.
/// ```text
///       2 3 5 3 2
///             1   1
///   3   . # # # .
///   5   # # # # #
///   5   # # # # #
///   1   . . # . .
///   3   . # # # .
/// ```
/// Rows 2-3 finish columns 1 and 5, whose X marks leave row 1 with exactly
/// three open cells.
final _level1 = Tutorial(1, [
  // Not shown again once the player has started (say, on coming back).
  const TutorialStep(text: TutorialText.welcome, obsolete: _started),
  TutorialStep(
    text: TutorialText.l1Fill,
    focus: [_row(1)],
    gesture: TutorialGesture.tap,
    from: (1, 0),
    done: (b) => _anyFilledInRow(b, 1),
  ),
  TutorialStep(
    text: TutorialText.l1Drag,
    focus: [_row(1)],
    gesture: TutorialGesture.drag,
    from: (1, 0),
    to: (1, 4),
    done: (b) => b.solvedRows.contains(1),
  ),
  TutorialStep(
    text: TutorialText.l1Row,
    focus: [_row(2)],
    gesture: TutorialGesture.drag,
    from: (2, 0),
    to: (2, 4),
    done: (b) => b.solvedRows.contains(2),
  ),
  TutorialStep(
    text: TutorialText.l1AutoCross,
    focus: [_col(0)],
    obsolete: (b) => b.solvedCols.contains(2),
  ),
  TutorialStep(
    text: TutorialText.l1Column,
    focus: [_col(2)],
    gesture: TutorialGesture.drag,
    from: (0, 2),
    to: (4, 2),
    done: (b) => b.solvedCols.contains(2),
  ),
  TutorialStep(
    text: TutorialText.l1Count,
    focus: [_row(0)],
    gesture: TutorialGesture.drag,
    from: (0, 1),
    to: (0, 3),
    done: (b) => b.solvedRows.contains(0),
  ),
  TutorialStep(
    text: TutorialText.l1Finish,
    focus: [_row(4)],
    gesture: TutorialGesture.drag,
    from: (4, 1),
    to: (4, 3),
    selfTry: true,
    done: _solved,
  ),
]);

/// Level 2, the house: a split clue, the X, and what a mistake costs.
/// Every line can be read on its own (full rows, `2 2` = 2 + 1 + 2), so the
/// level stays about the new ideas.
/// ```text
///       5 5 3 5 5
///   5   # # # # #
///   5   # # # # #
///   5   # # # # #
///  2 2  # # . # #
///  2 2  # # . # #
/// ```
final _level2 = Tutorial(2, [
  TutorialStep(
    text: TutorialText.l2Groups,
    focus: [_row(3)],
    ghostFills: const [(3, 0), (3, 1), (3, 3), (3, 4)],
    ghostCrosses: const [(3, 2)],
    obsolete: (b) => b.at(3, 2).isOpen || b.solvedRows.contains(3),
  ),
  TutorialStep(
    text: TutorialText.l2Cross,
    focus: [_row(3)],
    gesture: TutorialGesture.doubleTap,
    from: (3, 2),
    done: (b) => _crossed(b, const [(3, 2)]) || b.solvedRows.contains(3),
  ),
  TutorialStep(
    text: TutorialText.l2Drag,
    focus: [_row(3)],
    gesture: TutorialGesture.drag,
    from: (3, 0),
    to: (3, 4),
    done: (b) => b.solvedRows.contains(3),
  ),
  TutorialStep(
    text: TutorialText.l2CrossSelf,
    focus: [_row(4)],
    gesture: TutorialGesture.doubleTap,
    from: (4, 2),
    selfTry: true,
    done: (b) => _crossed(b, const [(4, 2)]) || b.solvedRows.contains(4),
  ),
  TutorialStep(
    text: TutorialText.l2DragSelf,
    focus: [_row(4)],
    gesture: TutorialGesture.drag,
    from: (4, 0),
    to: (4, 4),
    selfTry: true,
    done: (b) => b.solvedRows.contains(4),
  ),
  const TutorialStep(
    text: TutorialText.l2Mistakes,
    anchor: TutorialAnchor.lives,
  ),
  const TutorialStep(text: TutorialText.l2Finish, done: _solved),
]);

/// Level 3, the bear: the overlap rule. A block of 4 in a line of 5 always
/// covers the middle 3; a block of 3 always covers the centre.
/// ```text
///       4 5 4 5 4
///  2 2  # # . # #
///   5   # # # # #
///   5   # # # # #
///   5   # # # # #
///   3   . # # # .
/// ```
final _level3 = Tutorial(3, [
  TutorialStep(
    text: TutorialText.l3Overlap,
    focus: [_col(0)],
    slide: 4,
    obsolete: (b) => _filled(b, const [(1, 0), (2, 0), (3, 0)]),
  ),
  TutorialStep(
    text: TutorialText.l3OverlapFill,
    focus: [_col(0)],
    gesture: TutorialGesture.drag,
    from: (1, 0),
    to: (3, 0),
    done: (b) => _filled(b, const [(1, 0), (2, 0), (3, 0)]),
  ),
  TutorialStep(
    text: TutorialText.l3OverlapSelf,
    focus: [_col(2)],
    slide: 4,
    gesture: TutorialGesture.drag,
    from: (1, 2),
    to: (3, 2),
    selfTry: true,
    done: (b) => _filled(b, const [(1, 2), (2, 2), (3, 2)]),
  ),
  TutorialStep(
    text: TutorialText.l3OverlapRow,
    focus: [_row(4)],
    slide: 3,
    gesture: TutorialGesture.tap,
    from: (4, 2),
    selfTry: true,
    done: (b) => _filled(b, const [(4, 2)]),
  ),
  const TutorialStep(text: TutorialText.l3Finish, done: _solved),
]);

/// Level 4, the crown: `1 1 1`, a line of X marks, and taking an X back.
/// ```text
///       2 5 2 5 2
///       1   1   1
/// 1 1 1 # . # . #
/// 1 1 1 # . # . #
/// 1 1 1 # . # . #
///   5   # # # # #
///   5   # # # # #
/// ```
/// The three `1 1 1` rows leave the top three squares of columns 2 and 4
/// empty: each is crossed with one double-tap slide.
final _level4 = Tutorial(4, [
  TutorialStep(
    text: TutorialText.l4Ones,
    focus: [_row(0), _row(1), _row(2)],
    ghostFills: const [
      (0, 0), (0, 2), (0, 4), //
      (1, 0), (1, 2), (1, 4), //
      (2, 0), (2, 2), (2, 4),
    ],
    ghostCrosses: const [
      (0, 1), (0, 3), //
      (1, 1), (1, 3), //
      (2, 1), (2, 3),
    ],
    obsolete: (b) => _xLineReady(b, 1),
  ),
  TutorialStep(
    text: TutorialText.l4CrossDrag,
    focus: [_col(1)],
    gesture: TutorialGesture.crossDrag,
    from: (0, 1),
    to: (2, 1),
    done: (b) => _xLineReady(b, 1),
  ),
  TutorialStep(
    text: TutorialText.l4CrossDragSelf,
    focus: [_col(3)],
    gesture: TutorialGesture.crossDrag,
    from: (0, 3),
    to: (2, 3),
    selfTry: true,
    done: (b) => _xLineReady(b, 3),
  ),
  TutorialStep(
    text: TutorialText.l4Erase,
    gesture: TutorialGesture.doubleTap,
    from: (0, 3),
    // The hand double-taps the player's own X; once that X is gone (or
    // turned into an automatic one) there is nothing left to show.
    obsolete: (b) => !b.at(0, 3).isUserCross,
  ),
  const TutorialStep(text: TutorialText.l4Finish, done: _solved),
]);

/// Whether the top three squares of column [c] need no X slide any more.
bool _xLineReady(Board b, int c) =>
    _slideReady(b, [for (var r = 0; r < 3; r++) (r, c)]);

/// Whether an X slide over [cells] (in slide order) needs showing no more:
/// all crossed, or the slide can no longer be shown cleanly - one of them
/// was already crossed by the game (the player finished a line through it
/// first), or the slide's first square is taken (from a player's X it would
/// erase).
bool _slideReady(Board b, List<CellPos> cells) {
  final marks = [for (final (r, c) in cells) b.at(r, c)];
  return marks.every((cell) => cell.mark == CellMark.crossed) ||
      marks.any((cell) => cell.isLocked) ||
      marks.first.isOpen;
}

const _leftGaps = [(2, 0), (2, 1)];
const _rightGaps = [(2, 3), (2, 4)];

/// Level 5, the firefly: X marks as a solving tool. The four outer
/// columns are `2 2`, so all their gaps fall on the middle row; two
/// sideways X slides leave that row's `1` a single open square.
/// ```text
///       2 2 3 2 2
///       2 2   2 2
///  2 2  # # . # #
///   5   # # # # #
///   1   . . # . .
///   5   # # # # #
///  2 2  # # . # #
/// ```
final _level5 = Tutorial(5, [
  TutorialStep(
    text: TutorialText.l5Gaps,
    focus: [_col(0), _col(1), _col(3), _col(4)],
    ghostFills: const [
      (0, 0), (0, 1), (0, 3), (0, 4), //
      (1, 0), (1, 1), (1, 3), (1, 4), //
      (3, 0), (3, 1), (3, 3), (3, 4), //
      (4, 0), (4, 1), (4, 3), (4, 4),
    ],
    ghostCrosses: const [..._leftGaps, ..._rightGaps],
    obsolete: (b) => _slideReady(b, _leftGaps),
  ),
  TutorialStep(
    text: TutorialText.l5CrossDrag,
    focus: [_col(0), _col(1)],
    gesture: TutorialGesture.crossDrag,
    from: _leftGaps.first,
    to: _leftGaps.last,
    done: (b) => _slideReady(b, _leftGaps),
  ),
  TutorialStep(
    text: TutorialText.l5CrossDragSelf,
    focus: [_col(3), _col(4)],
    gesture: TutorialGesture.crossDrag,
    from: _rightGaps.first,
    to: _rightGaps.last,
    selfTry: true,
    done: (b) => _slideReady(b, _rightGaps),
  ),
  TutorialStep(
    text: TutorialText.l5Count,
    focus: [_row(2)],
    gesture: TutorialGesture.tap,
    from: (2, 2),
    selfTry: true,
    done: (b) => _filled(b, const [(2, 2)]),
  ),
  const TutorialStep(text: TutorialText.l5Hint, anchor: TutorialAnchor.hint),
  const TutorialStep(text: TutorialText.l5Finish, done: _solved),
]);
