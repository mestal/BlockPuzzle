// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Panjabi Punjabi (`pa`).
class AppLocalizationsPa extends AppLocalizations {
  AppLocalizationsPa([String locale = 'pa']) : super(locale);

  @override
  String get appTitle => 'BlockPuzzle';

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
  String get pickColor => 'ਆਪਣਾ ਰੰਗ ਚੁਣੋ';

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
  String get watchAdForHint => 'ਇਸ਼ਤਿਹਾਰ ਦੇਖੋ: +1 ਸੰਕੇਤ';

  @override
  String get outOfLivesTitle => 'ਜਾਨਾਂ ਮੁੱਕ ਗਈਆਂ';

  @override
  String get outOfLivesBody =>
      'ਇੱਕ ਹੋਰ ਜਾਨ ਲੈਣ ਲਈ ਇਸ਼ਤਿਹਾਰ ਦੇਖੋ, ਜਾਂ ਪੱਧਰ ਫਿਰ ਤੋਂ ਸ਼ੁਰੂ ਕਰੋ।';

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
  String get tutorialL1Fill =>
      'ਅੰਕ ਦੱਸਦੇ ਹਨ ਕਿ ਉਸ ਕਤਾਰ ਵਿੱਚ ਕਿੰਨੇ ਖਾਨੇ ਭਰੇ ਹਨ। ਇਹ ਕਤਾਰ 5 ਕਹਿੰਦੀ ਹੈ, ਇਸ ਲਈ ਸਾਰੇ 5 ਖਾਨੇ ਭਰੇ ਹਨ! ਖਾਨਾ ਭਰਨ ਲਈ ਉਸ ਉੱਤੇ ਟੈਪ ਕਰੋ।';

  @override
  String get tutorialL1Drag =>
      'ਸ਼ਾਬਾਸ਼! ਹੁਣ ਉਂਗਲ ਦਬਾ ਕੇ ਰੱਖੋ ਅਤੇ ਖਿਸਕਾ ਕੇ ਕਤਾਰ ਦਾ ਬਾਕੀ ਹਿੱਸਾ ਭਰੋ।';

  @override
  String get tutorialL1Column =>
      'ਇਹ ਕਾਲਮ ਵੀ 5 ਕਹਿੰਦਾ ਹੈ: ਉੱਪਰ ਤੋਂ ਹੇਠਾਂ ਖਿਸਕਾਓ।';

  @override
  String get tutorialL1Finish =>
      'ਜਦੋਂ ਕੋਈ ਕਤਾਰ ਜਾਂ ਕਾਲਮ ਪੂਰਾ ਹੋ ਜਾਂਦਾ ਹੈ, ਉਸ ਦੇ ਬਾਕੀ ਖਾਨਿਆਂ ਉੱਤੇ ਆਪਣੇ-ਆਪ X ਲੱਗ ਜਾਂਦਾ ਹੈ। ਬਾਕੀ ਤਸਵੀਰ ਆਪ ਪੂਰੀ ਕਰੋ!';

  @override
  String get tutorialL2Cross =>
      '2 2 ਦਾ ਮਤਲਬ ਹੈ 2 ਭਰੇ ਖਾਨੇ, ਘੱਟੋ-ਘੱਟ ਇੱਕ ਖਾਲੀ ਥਾਂ, ਫਿਰ 2 ਹੋਰ ਭਰੇ ਖਾਨੇ। 2 + ਥਾਂ + 2 = 5, ਇਸ ਲਈ ਕਤਾਰ ਪੱਕੀ ਹੈ! X ਲਾਉਣ ਲਈ ਖਾਲੀ ਖਾਨੇ ਉੱਤੇ ਡਬਲ ਟੈਪ ਕਰੋ।';

  @override
  String get tutorialL2Drag =>
      'ਖਿਸਕਾਉਣ ਵੇਲੇ ਤੁਹਾਡੇ X ਵਾਲੇ ਖਾਨੇ ਛੱਡ ਦਿੱਤੇ ਜਾਂਦੇ ਹਨ। ਪੂਰੀ ਕਤਾਰ ਉੱਤੇ ਖਿਸਕਾ ਕੇ ਇਸ ਨੂੰ ਭਰੋ।';

  @override
  String get tutorialL2Rules =>
      'ਗ਼ਲਤ ਖਾਨਾ ਭਰਨ ਨਾਲ 1 ਜਾਨ ਜਾਂਦੀ ਹੈ; X ਨਿਸ਼ਾਨ ਮੁਫ਼ਤ ਹਨ। ਜੇ ਅਟਕ ਜਾਓ, ਤਾਂ ਸੰਕੇਤ ਬਟਨ ਕਾਰਨ ਵੀ ਸਮਝਾਉਂਦਾ ਹੈ। ਬਾਕੀ ਤੁਹਾਡੇ ਹੱਥ!';
}
