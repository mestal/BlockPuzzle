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
  String get pickColor => 'Pick your colour';

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
  String hintFullLine(String line, String clue) {
    return '$line ($clue): the groups plus one gap between each fill the whole line, so every square is fixed. This square is filled!';
  }

  @override
  String hintOverlap(String line, String clue) {
    return '$line ($clue): push the groups to the start or to the end, this square is always inside a group. So it must be filled!';
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
  String get hintFallback => 'This square is part of the picture.';

  @override
  String get tutorialSkip => 'Skip';

  @override
  String get tutorialGotIt => 'Got it';

  @override
  String get tutorialL1Fill =>
      'The numbers tell how many squares in that row are filled. This row says 5, so all 5 squares are filled! Tap a square to fill it.';

  @override
  String get tutorialL1Drag =>
      'Great! Now hold your finger down and slide to fill the rest of the row.';

  @override
  String get tutorialL1Column =>
      'This column says 5 too: slide from top to bottom.';

  @override
  String get tutorialL1Finish =>
      'When a row or column is done, its other squares get an X by themselves. Finish the rest of the picture yourself!';

  @override
  String get tutorialL2Cross =>
      '2 2 means 2 filled squares, at least one gap, then 2 more filled squares. 2 + gap + 2 = 5, so the row is certain! Double tap the empty square to place an X.';

  @override
  String get tutorialL2Drag =>
      'Squares with your X are skipped when you slide. Slide along the whole row to fill it.';

  @override
  String get tutorialL2Rules =>
      'Filling a wrong square costs 1 life; X marks are free. If you get stuck, the Hint button also explains why. The rest is up to you!';
}
