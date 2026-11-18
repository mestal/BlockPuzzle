// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Pixel Bloom';

  @override
  String get whoIsPlaying => 'Who\'s playing?';

  @override
  String get newGame => 'New game';

  @override
  String get emptySlot => 'Empty slot';

  @override
  String get yourName => 'Your name';

  @override
  String get namePlaceholder => 'For example Alex';

  @override
  String get nameRequired => 'Enter a name';

  @override
  String get start => 'Start';

  @override
  String get cancel => 'Cancel';

  @override
  String deleteSlotTitle(String name) {
    return 'Delete $name?';
  }

  @override
  String get deleteSlotBody =>
      'All of this player\'s progress will be deleted. This cannot be undone.';

  @override
  String get delete => 'Delete';

  @override
  String levelLabel(int n) {
    return 'Level $n';
  }

  @override
  String hintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hints',
      one: '1 hint',
    );
    return '$_temp0';
  }

  @override
  String get tutorialTap => 'Tap: fill';

  @override
  String get tutorialDoubleTap =>
      'Double tap: place X (double tap an X again: remove it)';

  @override
  String get tutorialDrag =>
      'Hold and slide to mark many squares at once. Double tap and slide from an X to erase X marks.';

  @override
  String get hint => 'Hint';

  @override
  String get noHintsTitle => 'No hints left';

  @override
  String get noHintsBody => 'Watch a short ad to get 1 hint.';

  @override
  String get noHintsBodyNoAds => 'You have used all your hints.';

  @override
  String get watchAdForHint => 'Watch ad: +1 hint';

  @override
  String get outOfLivesTitle => 'Out of lives';

  @override
  String get outOfLivesBody =>
      'Watch an ad to get 1 more life, or start the level over.';

  @override
  String get outOfLivesBodyNoAds =>
      'Start the level over, or go back to the levels.';

  @override
  String get watchAdForLife => 'Watch ad: +1 life';

  @override
  String get restart => 'Start over';

  @override
  String get backToLevels => 'Back to levels';

  @override
  String get levelComplete => 'Great!';

  @override
  String nextLevel(int n) {
    return 'Next: Level $n';
  }

  @override
  String get ok => 'OK';

  @override
  String get allDoneSoon => 'New levels coming soon';

  @override
  String get adLabel => 'Ad';

  @override
  String get adPlaceholder => 'An ad will be shown here';

  @override
  String get adClose => 'Close';

  @override
  String adCountdown(int seconds) {
    return '$seconds s';
  }

  @override
  String get rulesTitle => 'How to play?';

  @override
  String get rulesClues =>
      'The numbers on the left and top tell how many filled squares are in that row and column. If there are several numbers, the groups have at least one gap between them.';

  @override
  String get rulesMistakes =>
      'Filling a square that should be empty costs 1 life. X marks are free: take notes however you like. To fill a square with an X, remove the X first with a double tap.';

  @override
  String get rulesScoring =>
      'Every correct fill earns points. Filling correctly in a row grows the multiplier (up to x5). Finishing rows and columns gives bonus points.';

  @override
  String levelScore(int score) {
    return '$score points';
  }

  @override
  String totalScore(int total) {
    return 'Total: $total';
  }

  @override
  String get rulesGoal =>
      'Find all the filled squares and the blocks turn into a hidden picture.';

  @override
  String worldLabel(int n) {
    return 'Map $n';
  }

  @override
  String get worldsTitle => 'Maps';

  @override
  String get worldUnlocked => 'New map unlocked!';

  @override
  String get worldComplete => 'Map complete!';

  @override
  String nextWorld(String name) {
    return 'Next map: $name';
  }

  @override
  String nextWorldLocked(String name) {
    return 'Finish this map to unlock $name';
  }

  @override
  String nextWorldSoon(String name) {
    return '$name coming soon';
  }

  @override
  String get worldLocked => 'Finish the previous map';

  @override
  String get worldSoon => 'Coming soon';

  @override
  String get youAreHere => 'You are here';

  @override
  String get mapStart => 'Start';

  @override
  String playLevel(int n) {
    return 'Play · Level $n';
  }

  @override
  String get tapToContinue => 'Tap to continue';

  @override
  String starCount(int have, int max) {
    return '$have/$max';
  }

  @override
  String get settings => 'Settings';

  @override
  String get settingsSound => 'Sound effects';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsLanguageDevice => 'Device language';

  @override
  String hintRow(int n) {
    return 'Row $n';
  }

  @override
  String hintColumn(int n) {
    return 'Column $n';
  }

  @override
  String hintFullLine(String line, String clue, String sum, int length) {
    return '$line ($clue): $sum = $length, the full length of the line. The groups plus one gap between each fill it exactly, so every square is fixed. This square is filled!';
  }

  @override
  String hintOverlap(
    String line,
    String clue,
    int size,
    String early,
    String late,
    String common,
  ) {
    return '$line ($clue): pushed to the start, the block of $size covers squares $early; pushed to the end, squares $late. Squares $common are filled either way, so they\'re sure!';
  }

  @override
  String hintForcedFill(String line, String clue) {
    return '$line ($clue): the squares and X marks you already have narrow down where the groups can fit. In every possible placement this square is filled!';
  }

  @override
  String hintForcedEmpty(String line, String clue) {
    return '$line ($clue): no group can reach this square, so it is empty. We put an X here.';
  }

  @override
  String hintOutOfReach(String line, String clue, String reach, int cell) {
    return '$line ($clue): the groups can only reach these squares: $reach. Square $cell is outside all of them, so it\'s empty!';
  }

  @override
  String hintBlockDone(String line, String clue, String cells, int size) {
    return '$line ($clue): the block next to it ($cells) is already $size long, as long as the biggest group that fits there. The block is complete, so this square is empty!';
  }

  @override
  String hintTooSmall(String line, String clue, int gap, int size) {
    return '$line ($clue): this square is in a gap of just $gap between X\'s or the edge. Even the smallest group that reaches it is $size long and doesn\'t fit, so it\'s empty!';
  }

  @override
  String get hintFixedCross => 'Your X here was wrong, so we removed it.';

  @override
  String get hintFallback => 'This square is part of the picture.';

  @override
  String get tutorialSkip => 'Skip';

  @override
  String get tutorialGotIt => 'Got it';

  @override
  String tutorialLesson(int lesson, int count) {
    return 'Lesson $lesson/$count';
  }

  @override
  String get tutorialStart => 'Let\'s go!';

  @override
  String get tutorialSkipTitle => 'Skip the tutorial?';

  @override
  String get tutorialSkipBody =>
      'Skip just this level\'s lesson, or the whole tutorial?';

  @override
  String get tutorialSkipLevel => 'Just this level';

  @override
  String get tutorialSkipAll => 'Skip it all';

  @override
  String get tutorialWelcome =>
      'Hi! Every puzzle hides a picture. Read the numbers, fill the right squares and reveal it!';

  @override
  String get tutorialL1Fill =>
      '[5]: this row has 5 filled squares. The row is 5 squares long, so all of them are filled! Tap one.';

  @override
  String get tutorialL1Drag =>
      'Great! Now slide your finger without lifting it to fill the rest of the row.';

  @override
  String get tutorialL1Row =>
      'This row is [5] too. This time, slide from end to end in one go.';

  @override
  String get tutorialL1AutoCross =>
      'This column\'s [2] squares are found, so the rest got an X by themselves. An X means: empty.';

  @override
  String get tutorialL1Column =>
      'The numbers on top are for columns. This column is [5]: slide from top to bottom.';

  @override
  String get tutorialL1Count =>
      'This row needs [3] squares. The X\'s are empty, so exactly 3 squares are left. Fill them all!';

  @override
  String get tutorialL1Finish =>
      'Finish the last row yourself and reveal the picture!';

  @override
  String get tutorialL2Groups =>
      '[2 2]: two separate groups. 2 filled, at least 1 empty, then 2 filled. 2 + 1 + 2 = 5: a perfect fit!';

  @override
  String get tutorialL2Cross =>
      'So the middle square is empty. Double tap it to put an X there.';

  @override
  String get tutorialL2Drag =>
      'An X is just a note; it costs nothing. Now slide across the row: the X is skipped.';

  @override
  String get tutorialL2CrossSelf =>
      'The row below is [2 2] too. Your turn: double tap the empty square first to put an X there.';

  @override
  String get tutorialL2DragSelf => 'Now slide to fill the row.';

  @override
  String get tutorialL2Mistakes =>
      'Careful: filling a wrong square turns it into a red X and costs a heart. Not sure? Put an X first!';

  @override
  String get tutorialL2Finish =>
      'The rest is yours! Stuck? Count how many squares a line still needs.';

  @override
  String get tutorialL3Overlap =>
      'This column is [4] with room for 5. The block of 4 sits either at the top or at the bottom. Either way, the middle 3 are filled!';

  @override
  String get tutorialL3OverlapFill =>
      'Fill those sure squares. This trick is called overlap: the secret of big puzzles!';

  @override
  String get tutorialL3OverlapSelf =>
      'This column is [4] too. Find the sure squares yourself!';

  @override
  String get tutorialL3OverlapRow =>
      'And [3]? Pushed left or right, the middle square is always filled. Fill it!';

  @override
  String get tutorialL3Finish =>
      'Great! You\'ll use this trick a lot in big puzzles. Now finish the picture!';

  @override
  String get tutorialL4Ones =>
      'The top three rows are [1 1 1]: three single squares with gaps between. 1 + 1 + 1 + 1 + 1 = 5: they fit exactly!';

  @override
  String get tutorialL4CrossDrag =>
      'So the top three squares of this column are empty. Double tap, keep your finger down on the second tap and slide down: three X\'s in one go!';

  @override
  String get tutorialL4CrossDragSelf =>
      'Your turn: draw X\'s on the three empty squares of this column in one slide.';

  @override
  String get tutorialL4Erase =>
      'Wrong X? Double tap it again to remove it. A double-tap slide that starts on an X erases the X\'s it passes.';

  @override
  String get tutorialL4Finish => 'Super! Now complete the picture.';

  @override
  String get tutorialL5Gaps =>
      'Last lesson: solving with X! The four outer columns are [2 2]: 2 + 1 + 2 = 5. All their gaps fall on the middle row.';

  @override
  String get tutorialL5CrossDrag =>
      'Mark those empty squares: double tap, keep your finger down on the second tap and slide sideways. Two X\'s in one go!';

  @override
  String get tutorialL5CrossDragSelf =>
      'Your turn: draw X\'s on the two empty squares on the right in one slide.';

  @override
  String get tutorialL5Count =>
      'This row is [1], and the X\'s leave only one square open. X\'s make counting easy: fill it!';

  @override
  String get tutorialL5Hint =>
      'Stuck? Press Hint: it shows the next step and explains why.';

  @override
  String get tutorialL5Finish =>
      'You\'re ready! On big grids, thick lines mark every 5 squares to help you count. Finish the picture!';
}
