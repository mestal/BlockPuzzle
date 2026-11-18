// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Panjabi Punjabi (`pa`).
class AppLocalizationsPa extends AppLocalizations {
  AppLocalizationsPa([String locale = 'pa']) : super(locale);

  @override
  String get appTitle => 'Pixel Bloom';

  @override
  String get whoIsPlaying => 'ਕੌਣ ਖੇਡ ਰਿਹਾ ਹੈ?';

  @override
  String get newGame => 'ਨਵੀਂ ਖੇਡ';

  @override
  String get emptySlot => 'ਖਾਲੀ ਸਲਾਟ';

  @override
  String get yourName => 'ਤੁਹਾਡਾ ਨਾਂ';

  @override
  String get namePlaceholder => 'ਜਿਵੇਂ ਸਿਮਰਨ';

  @override
  String get nameRequired => 'ਨਾਂ ਲਿਖੋ';

  @override
  String get start => 'ਸ਼ੁਰੂ ਕਰੋ';

  @override
  String get cancel => 'ਰੱਦ ਕਰੋ';

  @override
  String deleteSlotTitle(String name) {
    return 'ਕੀ $name ਨੂੰ ਮਿਟਾਉਣਾ ਹੈ?';
  }

  @override
  String get deleteSlotBody =>
      'ਇਸ ਖਿਡਾਰੀ ਦੀ ਸਾਰੀ ਤਰੱਕੀ ਮਿਟ ਜਾਵੇਗੀ। ਇਸ ਨੂੰ ਵਾਪਸ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਦਾ।';

  @override
  String get delete => 'ਮਿਟਾਓ';

  @override
  String levelLabel(int n) {
    return 'ਪੱਧਰ $n';
  }

  @override
  String hintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਸੰਕੇਤ',
      one: '1 ਸੰਕੇਤ',
    );
    return '$_temp0';
  }

  @override
  String get tutorialTap => 'ਟੈਪ: ਭਰੋ';

  @override
  String get tutorialDoubleTap => 'ਡਬਲ ਟੈਪ: X ਲਾਓ (X ਉੱਤੇ ਫਿਰ ਡਬਲ ਟੈਪ: ਹਟਾਓ)';

  @override
  String get tutorialDrag =>
      'ਦਬਾ ਕੇ ਰੱਖੋ ਅਤੇ ਖਿਸਕਾਓ ਤਾਂ ਜੋ ਇੱਕੋ ਵਾਰ ਕਈ ਖਾਨੇ ਨਿਸ਼ਾਨਬੱਧ ਹੋਣ। X ਮਿਟਾਉਣ ਲਈ ਡਬਲ ਟੈਪ ਕਰਕੇ ਕਿਸੇ X ਤੋਂ ਖਿਸਕਾਓ।';

  @override
  String get hint => 'ਸੰਕੇਤ';

  @override
  String get noHintsTitle => 'ਸੰਕੇਤ ਮੁੱਕ ਗਏ';

  @override
  String get noHintsBody => '1 ਸੰਕੇਤ ਲੈਣ ਲਈ ਇੱਕ ਛੋਟਾ ਇਸ਼ਤਿਹਾਰ ਦੇਖੋ।';

  @override
  String get noHintsBodyNoAds => 'ਤੁਸੀਂ ਸਾਰੇ ਸੰਕੇਤ ਵਰਤ ਚੁੱਕੇ ਹੋ।';

  @override
  String get watchAdForHint => 'ਇਸ਼ਤਿਹਾਰ ਦੇਖੋ: +1 ਸੰਕੇਤ';

  @override
  String get outOfLivesTitle => 'ਜਾਨਾਂ ਮੁੱਕ ਗਈਆਂ';

  @override
  String get outOfLivesBody =>
      'ਇੱਕ ਹੋਰ ਜਾਨ ਲੈਣ ਲਈ ਇਸ਼ਤਿਹਾਰ ਦੇਖੋ, ਜਾਂ ਪੱਧਰ ਫਿਰ ਤੋਂ ਸ਼ੁਰੂ ਕਰੋ।';

  @override
  String get outOfLivesBodyNoAds =>
      'ਪੱਧਰ ਫਿਰ ਤੋਂ ਸ਼ੁਰੂ ਕਰੋ, ਜਾਂ ਪੱਧਰਾਂ ਵੱਲ ਵਾਪਸ ਜਾਓ।';

  @override
  String get watchAdForLife => 'ਇਸ਼ਤਿਹਾਰ ਦੇਖੋ: +1 ਜਾਨ';

  @override
  String get restart => 'ਫਿਰ ਤੋਂ ਸ਼ੁਰੂ ਕਰੋ';

  @override
  String get backToLevels => 'ਪੱਧਰਾਂ ਵੱਲ ਵਾਪਸ';

  @override
  String get levelComplete => 'ਸ਼ਾਬਾਸ਼!';

  @override
  String nextLevel(int n) {
    return 'ਅਗਲਾ: ਪੱਧਰ $n';
  }

  @override
  String get ok => 'ਠੀਕ ਹੈ';

  @override
  String get allDoneSoon => 'ਨਵੇਂ ਪੱਧਰ ਜਲਦੀ ਆ ਰਹੇ ਹਨ';

  @override
  String get adLabel => 'ਇਸ਼ਤਿਹਾਰ';

  @override
  String get adPlaceholder => 'ਇੱਥੇ ਇੱਕ ਇਸ਼ਤਿਹਾਰ ਦਿਖਾਇਆ ਜਾਵੇਗਾ';

  @override
  String get adClose => 'ਬੰਦ ਕਰੋ';

  @override
  String adCountdown(int seconds) {
    return '$seconds ਸਕਿੰ';
  }

  @override
  String get rulesTitle => 'ਕਿਵੇਂ ਖੇਡੀਏ?';

  @override
  String get rulesClues =>
      'ਖੱਬੇ ਅਤੇ ਉੱਪਰ ਵਾਲੇ ਅੰਕ ਦੱਸਦੇ ਹਨ ਕਿ ਉਸ ਕਤਾਰ ਅਤੇ ਕਾਲਮ ਵਿੱਚ ਕਿੰਨੇ ਖਾਨੇ ਭਰੇ ਹੋਏ ਹਨ। ਜੇ ਕਈ ਅੰਕ ਹੋਣ, ਤਾਂ ਸਮੂਹਾਂ ਵਿਚਕਾਰ ਘੱਟੋ-ਘੱਟ ਇੱਕ ਖਾਲੀ ਖਾਨਾ ਹੁੰਦਾ ਹੈ।';

  @override
  String get rulesMistakes =>
      'ਜੋ ਖਾਨਾ ਖਾਲੀ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ ਉਸ ਨੂੰ ਭਰਨ ਨਾਲ 1 ਜਾਨ ਜਾਂਦੀ ਹੈ। X ਨਿਸ਼ਾਨ ਮੁਫ਼ਤ ਹਨ: ਜਿਵੇਂ ਚਾਹੋ ਨੋਟ ਕਰੋ। X ਵਾਲਾ ਖਾਨਾ ਭਰਨ ਲਈ ਪਹਿਲਾਂ ਡਬਲ ਟੈਪ ਨਾਲ X ਹਟਾਓ।';

  @override
  String get rulesScoring =>
      'ਹਰ ਸਹੀ ਭਰਾਈ ਨਾਲ ਅੰਕ ਮਿਲਦੇ ਹਨ। ਲਗਾਤਾਰ ਸਹੀ ਭਰਨ ਨਾਲ ਗੁਣਕ ਵਧਦਾ ਹੈ (x5 ਤੱਕ)। ਕਤਾਰਾਂ ਅਤੇ ਕਾਲਮ ਪੂਰੇ ਕਰਨ ਨਾਲ ਬੋਨਸ ਅੰਕ ਮਿਲਦੇ ਹਨ।';

  @override
  String levelScore(int score) {
    return '$score ਅੰਕ';
  }

  @override
  String totalScore(int total) {
    return 'ਕੁੱਲ: $total';
  }

  @override
  String get rulesGoal =>
      'ਸਾਰੇ ਭਰੇ ਖਾਨੇ ਲੱਭੋ ਅਤੇ ਬਲਾਕ ਇੱਕ ਲੁਕੀ ਹੋਈ ਤਸਵੀਰ ਬਣ ਜਾਣਗੇ।';

  @override
  String worldLabel(int n) {
    return 'ਨਕਸ਼ਾ $n';
  }

  @override
  String get worldsTitle => 'ਨਕਸ਼ੇ';

  @override
  String get worldUnlocked => 'ਨਵਾਂ ਨਕਸ਼ਾ ਖੁੱਲ੍ਹ ਗਿਆ!';

  @override
  String get worldComplete => 'ਨਕਸ਼ਾ ਪੂਰਾ!';

  @override
  String nextWorld(String name) {
    return 'ਅਗਲਾ ਨਕਸ਼ਾ: $name';
  }

  @override
  String nextWorldLocked(String name) {
    return '$name ਖੋਲ੍ਹਣ ਲਈ ਇਹ ਨਕਸ਼ਾ ਪੂਰਾ ਕਰੋ';
  }

  @override
  String nextWorldSoon(String name) {
    return '$name ਜਲਦੀ ਆ ਰਿਹਾ ਹੈ';
  }

  @override
  String get worldLocked => 'ਪਿਛਲਾ ਨਕਸ਼ਾ ਪੂਰਾ ਕਰੋ';

  @override
  String get worldSoon => 'ਜਲਦੀ ਆ ਰਿਹਾ ਹੈ';

  @override
  String get youAreHere => 'ਤੁਸੀਂ ਇੱਥੇ ਹੋ';

  @override
  String get mapStart => 'ਸ਼ੁਰੂਆਤ';

  @override
  String playLevel(int n) {
    return 'ਖੇਡੋ · ਪੱਧਰ $n';
  }

  @override
  String get tapToContinue => 'ਜਾਰੀ ਰੱਖਣ ਲਈ ਟੈਪ ਕਰੋ';

  @override
  String starCount(int have, int max) {
    return '$have/$max';
  }

  @override
  String get settings => 'ਸੈਟਿੰਗਾਂ';

  @override
  String get settingsSound => 'ਧੁਨੀ ਪ੍ਰਭਾਵ';

  @override
  String get settingsLanguage => 'ਭਾਸ਼ਾ';

  @override
  String get settingsLanguageDevice => 'ਡਿਵਾਈਸ ਦੀ ਭਾਸ਼ਾ';

  @override
  String hintRow(int n) {
    return 'ਕਤਾਰ $n';
  }

  @override
  String hintColumn(int n) {
    return 'ਕਾਲਮ $n';
  }

  @override
  String hintFullLine(String line, String clue) {
    return '$line ($clue): ਸਮੂਹ ਅਤੇ ਹਰ ਇੱਕ ਵਿਚਕਾਰ ਇੱਕ ਖਾਲੀ ਥਾਂ ਮਿਲ ਕੇ ਪੂਰੀ ਲਾਈਨ ਭਰ ਦਿੰਦੇ ਹਨ, ਇਸ ਲਈ ਹਰ ਖਾਨਾ ਪੱਕਾ ਹੈ। ਇਹ ਖਾਨਾ ਭਰਿਆ ਹੋਇਆ ਹੈ!';
  }

  @override
  String hintOverlap(String line, String clue) {
    return '$line ($clue): ਸਮੂਹਾਂ ਨੂੰ ਸ਼ੁਰੂ ਜਾਂ ਅੰਤ ਵੱਲ ਧੱਕੋ: ਇਹ ਖਾਨਾ ਹਮੇਸ਼ਾ ਕਿਸੇ ਸਮੂਹ ਦੇ ਅੰਦਰ ਰਹਿੰਦਾ ਹੈ। ਇਸ ਲਈ ਇਹ ਭਰਿਆ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ!';
  }

  @override
  String hintForcedFill(String line, String clue) {
    return '$line ($clue): ਤੁਹਾਡੇ ਕੋਲ ਪਹਿਲਾਂ ਤੋਂ ਮੌਜੂਦ ਖਾਨੇ ਅਤੇ X ਦੱਸਦੇ ਹਨ ਕਿ ਸਮੂਹ ਕਿੱਥੇ ਆ ਸਕਦੇ ਹਨ। ਹਰ ਸੰਭਵ ਤਰਤੀਬ ਵਿੱਚ ਇਹ ਖਾਨਾ ਭਰਿਆ ਹੋਇਆ ਹੈ!';
  }

  @override
  String hintForcedEmpty(String line, String clue) {
    return '$line ($clue): ਕੋਈ ਵੀ ਸਮੂਹ ਇਸ ਖਾਨੇ ਤੱਕ ਨਹੀਂ ਪਹੁੰਚ ਸਕਦਾ, ਇਸ ਲਈ ਇਹ ਖਾਲੀ ਹੈ। ਅਸੀਂ ਇੱਥੇ X ਲਾ ਦਿੱਤਾ ਹੈ।';
  }

  @override
  String get hintFallback => 'ਇਹ ਖਾਨਾ ਤਸਵੀਰ ਦਾ ਹਿੱਸਾ ਹੈ।';

  @override
  String get tutorialSkip => 'ਛੱਡੋ';

  @override
  String get tutorialGotIt => 'ਸਮਝ ਗਿਆ';

  @override
  String tutorialLesson(int lesson, int count) {
    return 'ਪਾਠ $lesson/$count';
  }

  @override
  String get tutorialStart => 'ਚੱਲੋ ਸ਼ੁਰੂ ਕਰੀਏ!';

  @override
  String get tutorialSkipTitle => 'ਟਿਊਟੋਰੀਅਲ ਛੱਡਣਾ ਹੈ?';

  @override
  String get tutorialSkipBody =>
      'ਸਿਰਫ਼ ਇਸ ਪੱਧਰ ਦਾ ਪਾਠ ਛੱਡਣਾ ਹੈ ਜਾਂ ਪੂਰਾ ਟਿਊਟੋਰੀਅਲ?';

  @override
  String get tutorialSkipLevel => 'ਸਿਰਫ਼ ਇਹ ਪੱਧਰ';

  @override
  String get tutorialSkipAll => 'ਸਭ ਛੱਡੋ';

  @override
  String get tutorialWelcome =>
      'ਸਤ ਸ੍ਰੀ ਅਕਾਲ! ਹਰ ਬੁਝਾਰਤ ਵਿੱਚ ਇੱਕ ਤਸਵੀਰ ਲੁਕੀ ਹੈ। ਅੰਕ ਪੜ੍ਹੋ, ਸਹੀ ਖਾਨੇ ਭਰੋ ਅਤੇ ਉਸ ਨੂੰ ਸਾਹਮਣੇ ਲਿਆਓ!';

  @override
  String get tutorialL1Fill =>
      '[5]: ਇਸ ਕਤਾਰ ਵਿੱਚ 5 ਭਰੇ ਖਾਨੇ ਹਨ। ਕਤਾਰ ਵੀ 5 ਖਾਨਿਆਂ ਦੀ ਹੈ, ਯਾਨੀ ਸਾਰੇ ਭਰੇ ਹਨ! ਕਿਸੇ ਇੱਕ ਉੱਤੇ ਟੈਪ ਕਰੋ।';

  @override
  String get tutorialL1Drag =>
      'ਵਧੀਆ! ਹੁਣ ਉਂਗਲ ਚੁੱਕੇ ਬਿਨਾਂ ਖਿਸਕਾਓ ਅਤੇ ਬਾਕੀ ਕਤਾਰ ਭਰੋ।';

  @override
  String get tutorialL1Row =>
      'ਇਹ ਕਤਾਰ ਵੀ [5] ਹੈ। ਇਸ ਵਾਰ ਇੱਕੋ ਵਾਰ ਵਿੱਚ ਇੱਕ ਸਿਰੇ ਤੋਂ ਦੂਜੇ ਸਿਰੇ ਤੱਕ ਖਿਸਕਾਓ।';

  @override
  String get tutorialL1AutoCross =>
      'ਇਸ ਕਾਲਮ ਦੇ [2] ਖਾਨੇ ਮਿਲ ਗਏ, ਇਸ ਲਈ ਬਾਕੀਆਂ ਉੱਤੇ ਆਪਣੇ-ਆਪ X ਲੱਗ ਗਿਆ। X ਦਾ ਮਤਲਬ: ਖਾਲੀ।';

  @override
  String get tutorialL1Column =>
      'ਉੱਪਰਲੇ ਅੰਕ ਕਾਲਮਾਂ ਲਈ ਹਨ। ਇਹ ਕਾਲਮ [5] ਹੈ: ਉੱਪਰ ਤੋਂ ਹੇਠਾਂ ਖਿਸਕਾਓ।';

  @override
  String get tutorialL1Count =>
      'ਇਸ ਕਤਾਰ ਨੂੰ [3] ਖਾਨੇ ਚਾਹੀਦੇ ਹਨ। X ਵਾਲੇ ਖਾਨੇ ਖਾਲੀ ਹਨ, ਤਾਂ ਠੀਕ 3 ਖਾਨੇ ਬਚੇ ਹਨ। ਸਾਰੇ ਭਰ ਦਿਓ!';

  @override
  String get tutorialL1Finish => 'ਆਖਰੀ ਕਤਾਰ ਆਪ ਪੂਰੀ ਕਰੋ ਅਤੇ ਤਸਵੀਰ ਸਾਹਮਣੇ ਲਿਆਓ!';

  @override
  String get tutorialL2Groups =>
      '[2 2]: ਦੋ ਵੱਖਰੇ ਸਮੂਹ। 2 ਭਰੇ, ਘੱਟੋ-ਘੱਟ 1 ਖਾਲੀ, ਫਿਰ 2 ਭਰੇ। 2 + 1 + 2 = 5: ਬਿਲਕੁਲ ਫਿੱਟ!';

  @override
  String get tutorialL2Cross =>
      'ਯਾਨੀ ਵਿਚਕਾਰਲਾ ਖਾਨਾ ਖਾਲੀ ਹੈ। ਉਸ ਉੱਤੇ ਡਬਲ ਟੈਪ ਕਰਕੇ X ਲਗਾਓ।';

  @override
  String get tutorialL2Drag =>
      'X ਸਿਰਫ਼ ਇੱਕ ਨੋਟ ਹੈ, ਇਸ ਦੀ ਕੋਈ ਕੀਮਤ ਨਹੀਂ। ਹੁਣ ਕਤਾਰ ਉੱਤੇ ਖਿਸਕਾਓ: X ਵਾਲਾ ਖਾਨਾ ਛੱਡ ਦਿੱਤਾ ਜਾਂਦਾ ਹੈ।';

  @override
  String get tutorialL2CrossSelf =>
      'ਹੇਠਲੀ ਕਤਾਰ ਵੀ [2 2] ਹੈ। ਤੁਹਾਡੀ ਵਾਰੀ: ਪਹਿਲਾਂ ਖਾਲੀ ਖਾਨੇ ਉੱਤੇ ਡਬਲ ਟੈਪ ਕਰਕੇ X ਲਗਾਓ।';

  @override
  String get tutorialL2DragSelf => 'ਹੁਣ ਖਿਸਕਾ ਕੇ ਕਤਾਰ ਭਰੋ।';

  @override
  String get tutorialL2Mistakes =>
      'ਧਿਆਨ ਦਿਓ: ਗਲਤ ਖਾਨਾ ਭਰਨ ਨਾਲ ਉਹ ਲਾਲ X ਬਣ ਜਾਂਦਾ ਹੈ ਅਤੇ ਇੱਕ ਦਿਲ ਜਾਂਦਾ ਹੈ। ਪੱਕਾ ਨਹੀਂ? ਪਹਿਲਾਂ X ਲਗਾਓ!';

  @override
  String get tutorialL2Finish =>
      'ਬਾਕੀ ਤੁਹਾਡਾ! ਅਟਕ ਗਏ? ਗਿਣੋ ਕਿ ਕਿਸੇ ਲਕੀਰ ਵਿੱਚ ਅਜੇ ਕਿੰਨੇ ਖਾਨੇ ਬਾਕੀ ਹਨ।';

  @override
  String get tutorialL3Overlap =>
      'ਇਹ ਕਾਲਮ [4] ਹੈ ਅਤੇ ਥਾਂ 5 ਖਾਨਿਆਂ ਦੀ। 4 ਦਾ ਬਲਾਕ ਜਾਂ ਤਾਂ ਸਭ ਤੋਂ ਉੱਪਰ ਹੈ ਜਾਂ ਸਭ ਤੋਂ ਹੇਠਾਂ। ਦੋਹਾਂ ਵਿੱਚ ਵਿਚਕਾਰਲੇ 3 ਭਰੇ ਹਨ!';

  @override
  String get tutorialL3OverlapFill =>
      'ਇਹ ਪੱਕੇ ਖਾਨੇ ਭਰੋ। ਇਸ ਜੁਗਤ ਦਾ ਨਾਂ ਓਵਰਲੈਪ ਹੈ: ਵੱਡੀਆਂ ਬੁਝਾਰਤਾਂ ਦਾ ਰਾਜ਼!';

  @override
  String get tutorialL3OverlapSelf => 'ਇਹ ਕਾਲਮ ਵੀ [4] ਹੈ। ਪੱਕੇ ਖਾਨੇ ਆਪ ਲੱਭੋ!';

  @override
  String get tutorialL3OverlapRow =>
      'ਅਤੇ [3]? ਖੱਬੇ ਹੋਵੇ ਜਾਂ ਸੱਜੇ, ਵਿਚਕਾਰਲਾ ਖਾਨਾ ਹਮੇਸ਼ਾ ਭਰਿਆ ਹੁੰਦਾ ਹੈ। ਉਸ ਨੂੰ ਭਰੋ!';

  @override
  String get tutorialL3Finish =>
      'ਸ਼ਾਨਦਾਰ! ਇਹ ਜੁਗਤ ਵੱਡੀਆਂ ਬੁਝਾਰਤਾਂ ਵਿੱਚ ਬਹੁਤ ਕੰਮ ਆਵੇਗੀ। ਹੁਣ ਤਸਵੀਰ ਪੂਰੀ ਕਰੋ!';

  @override
  String get tutorialL4Ones =>
      'ਉੱਪਰਲੀਆਂ ਤਿੰਨ ਕਤਾਰਾਂ [1 1 1] ਹਨ: ਤਿੰਨ ਇਕੱਲੇ ਖਾਨੇ, ਵਿਚਕਾਰ ਖਾਲੀ ਥਾਂ। 1 + 1 + 1 + 1 + 1 = 5: ਬਿਲਕੁਲ ਫਿੱਟ!';

  @override
  String get tutorialL4CrossDrag =>
      'ਯਾਨੀ ਇਸ ਕਾਲਮ ਦੇ ਉੱਪਰਲੇ ਤਿੰਨ ਖਾਨੇ ਖਾਲੀ ਹਨ। ਡਬਲ ਟੈਪ ਕਰੋ, ਦੂਜੇ ਟੈਪ ਉੱਤੇ ਉਂਗਲ ਦਬਾਈ ਰੱਖੋ ਅਤੇ ਹੇਠਾਂ ਖਿਸਕਾਓ: ਇੱਕੋ ਵਾਰ ਤਿੰਨ X!';

  @override
  String get tutorialL4CrossDragSelf =>
      'ਤੁਹਾਡੀ ਵਾਰੀ: ਇੱਕੋ ਵਾਰ ਖਿਸਕਾ ਕੇ ਇਸ ਕਾਲਮ ਦੇ ਤਿੰਨ ਖਾਲੀ ਖਾਨਿਆਂ ਉੱਤੇ X ਬਣਾਓ।';

  @override
  String get tutorialL4Erase =>
      'ਗਲਤ X ਲੱਗ ਗਿਆ? ਉਸ ਉੱਤੇ ਫਿਰ ਡਬਲ ਟੈਪ ਕਰੋ, ਹਟ ਜਾਵੇਗਾ। X ਤੋਂ ਡਬਲ ਟੈਪ ਕਰਕੇ ਖਿਸਕਾਓ ਤਾਂ ਰਾਹ ਦੇ X ਮਿਟ ਜਾਂਦੇ ਹਨ।';

  @override
  String get tutorialL4Finish => 'ਬਹੁਤ ਵਧੀਆ! ਹੁਣ ਤਸਵੀਰ ਪੂਰੀ ਕਰੋ।';

  @override
  String get tutorialL5Sum =>
      'ਆਖਰੀ ਪਾਠ! ਇਹ ਕਾਲਮ [3 1] ਹੈ: 3 + 1 + 1 = 5, ਯਾਨੀ ਪੱਕਾ ਹੈ। ਆਪ ਹੱਲ ਕਰੋ!';

  @override
  String get tutorialL5Hint =>
      'ਅਟਕ ਗਏ? ਸੰਕੇਤ ਦਬਾਓ: ਇਹ ਅਗਲਾ ਕਦਮ ਅਤੇ ਉਸ ਦਾ ਕਾਰਨ ਦਿਖਾਉਂਦਾ ਹੈ।';

  @override
  String get tutorialL5Finish =>
      'ਤੁਸੀਂ ਤਿਆਰ ਹੋ! ਵੱਡੇ ਗਰਿੱਡ ਵਿੱਚ ਮੋਟੀਆਂ ਲਕੀਰਾਂ ਹਰ 5 ਖਾਨਿਆਂ ਨੂੰ ਵੱਖ ਕਰਦੀਆਂ ਹਨ ਤਾਂ ਜੋ ਗਿਣਨਾ ਆਸਾਨ ਹੋਵੇ। ਤਸਵੀਰ ਪੂਰੀ ਕਰੋ!';
}
