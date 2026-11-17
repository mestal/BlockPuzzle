import 'package:block_puzzle/features/game/domain/board.dart';
import 'package:meta/meta.dart';

/// The gesture a tutorial step demonstrates with the animated hand.
enum TutorialGesture { tap, doubleTap, drag }

/// Which explanation a step shows (mapped to an ARB text by the UI).
enum TutorialText {
  l1Fill,
  l1Drag,
  l1Column,
  l1Finish,
  l2Cross,
  l2Drag,
  l2Rules,
}

typedef CellPos = (int, int);

/// A row or column the step is about; its clue is highlighted.
typedef TutorialLine = ({bool isRow, int index});

/// One step of a guided level. A step with [done] finishes by itself once
/// the board satisfies it; a step without it waits for the player to
/// acknowledge the text.
@immutable
final class TutorialStep {
  const TutorialStep({
    required this.text,
    this.focus,
    this.gesture,
    this.from,
    this.to,
    this.done,
  });

  final TutorialText text;
  final TutorialLine? focus;

  /// What the hand shows, starting at [from] (and moving to [to] for a
  /// drag). Null for a text-only step.
  final TutorialGesture? gesture;
  final CellPos? from;
  final CellPos? to;
  final bool Function(Board board)? done;

  /// Whether the player has to press "Got it" to move on.
  bool get needsAck => done == null;
}

/// The guided first levels: each teaches one or two gestures on a board
/// whose answer is easy to see.
@immutable
final class Tutorial {
  const Tutorial(this.steps);

  final List<TutorialStep> steps;

  /// Levels that have a tutorial.
  static const levels = {1, 2};

  static Tutorial? forLevel(int id) => switch (id) {
    1 => _level1,
    2 => _level2,
    _ => null,
  };

  /// Index of the step to show: the first one that is not done yet. Steps
  /// are derived from the board, so a player who runs ahead (say, fills the
  /// whole row at once) skips the steps already covered. [acknowledged]
  /// holds the text-only steps the player has closed. Null when finished.
  int? currentStep(Board board, Set<int> acknowledged) {
    for (final (i, step) in steps.indexed) {
      final finished = step.done?.call(board) ?? acknowledged.contains(i);
      if (!finished) return i;
    }
    return null;
  }
}

bool _rowHasFill(Board board, int r) => [
  for (var c = 0; c < board.puzzle.cols; c++) board.at(r, c),
].any((cell) => cell.mark == CellMark.filled);

/// Level 1, the mushroom:
/// ```text
/// .###.
/// #####
/// #####
/// ..#..
/// .###.
/// ```
/// Row 2 (5) and column 3 (5) are full lines: tap, drag, drag, then the
/// player finishes the picture alone.
final _level1 = Tutorial([
  TutorialStep(
    text: TutorialText.l1Fill,
    focus: (isRow: true, index: 1),
    gesture: TutorialGesture.tap,
    from: (1, 0),
    done: (b) => _rowHasFill(b, 1),
  ),
  TutorialStep(
    text: TutorialText.l1Drag,
    focus: (isRow: true, index: 1),
    gesture: TutorialGesture.drag,
    from: (1, 0),
    to: (1, 4),
    done: (b) => b.solvedRows.contains(1),
  ),
  TutorialStep(
    text: TutorialText.l1Column,
    focus: (isRow: false, index: 2),
    gesture: TutorialGesture.drag,
    from: (0, 2),
    to: (4, 2),
    done: (b) => b.solvedCols.contains(2),
  ),
  TutorialStep(
    text: TutorialText.l1Finish,
    done: (b) => b.isSolved,
  ),
]);

/// Level 2, the house:
/// ```text
/// ..#..
/// .###.
/// #####
/// ##.##
/// ##.##
/// ```
/// Row 4 (2 2) teaches split clues and the X: cross the gap, then
/// drag over the row (the X is skipped).
final _level2 = Tutorial([
  TutorialStep(
    text: TutorialText.l2Cross,
    focus: (isRow: true, index: 3),
    gesture: TutorialGesture.doubleTap,
    from: (3, 2),
    done: (b) => b.at(3, 2).mark == CellMark.crossed,
  ),
  TutorialStep(
    text: TutorialText.l2Drag,
    focus: (isRow: true, index: 3),
    gesture: TutorialGesture.drag,
    from: (3, 0),
    to: (3, 4),
    done: (b) => b.solvedRows.contains(3),
  ),
  const TutorialStep(text: TutorialText.l2Rules),
]);
