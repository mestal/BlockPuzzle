// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appTitle => 'Pixel Bloom';

  @override
  String get whoIsPlaying => 'யார் விளையாடுகிறார்கள்?';

  @override
  String get newGame => 'புதிய விளையாட்டு';

  @override
  String get emptySlot => 'காலி இடம்';

  @override
  String get yourName => 'உங்கள் பெயர்';

  @override
  String get namePlaceholder => 'எ.கா. மீனா';

  @override
  String get nameRequired => 'ஒரு பெயரை உள்ளிடுங்கள்';

  @override
  String get pickColor => 'உங்கள் நிறத்தைத் தேர்ந்தெடுங்கள்';

  @override
  String get start => 'தொடங்கு';

  @override
  String get cancel => 'ரத்துசெய்';

  @override
  String deleteSlotTitle(String name) {
    return '$name ஐ நீக்கவா?';
  }

  @override
  String get deleteSlotBody =>
      'இந்த வீரரின் முழு முன்னேற்றமும் நீக்கப்படும். இதைத் திரும்பப் பெற முடியாது.';

  @override
  String get delete => 'நீக்கு';

  @override
  String levelLabel(int n) {
    return 'நிலை $n';
  }

  @override
  String hintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count குறிப்புகள்',
      one: '1 குறிப்பு',
    );
    return '$_temp0';
  }

  @override
  String get tutorialTap => 'தட்டு: நிரப்பு';

  @override
  String get tutorialDoubleTap =>
      'இருமுறை தட்டு: X இடு (X ஐ மீண்டும் இருமுறை தட்டு: நீக்கு)';

  @override
  String get tutorialDrag =>
      'அழுத்திப் பிடித்து இழுத்தால் பல கட்டங்களை ஒரே நேரத்தில் குறிக்கலாம். X குறிகளை அழிக்க இருமுறை தட்டி ஒரு X இலிருந்து இழுக்கவும்.';

  @override
  String get hint => 'குறிப்பு';

  @override
  String get noHintsTitle => 'குறிப்புகள் தீர்ந்தன';

  @override
  String get noHintsBody => '1 குறிப்பு பெற ஒரு சிறிய விளம்பரத்தைப் பாருங்கள்.';

  @override
  String get watchAdForHint => 'விளம்பரம் பார்: +1 குறிப்பு';

  @override
  String get outOfLivesTitle => 'உயிர்கள் தீர்ந்தன';

  @override
  String get outOfLivesBody =>
      'இன்னும் 1 உயிர் பெற விளம்பரத்தைப் பாருங்கள், அல்லது நிலையை மீண்டும் தொடங்குங்கள்.';

  @override
  String get watchAdForLife => 'விளம்பரம் பார்: +1 உயிர்';

  @override
  String get restart => 'மீண்டும் தொடங்கு';

  @override
  String get backToLevels => 'நிலைகளுக்குத் திரும்பு';

  @override
  String get levelComplete => 'அருமை!';

  @override
  String nextLevel(int n) {
    return 'அடுத்து: நிலை $n';
  }

  @override
  String get ok => 'சரி';

  @override
  String get allDoneSoon => 'புதிய நிலைகள் விரைவில்';

  @override
  String get adLabel => 'விளம்பரம்';

  @override
  String get adPlaceholder => 'இங்கே ஒரு விளம்பரம் காட்டப்படும்';

  @override
  String get adClose => 'மூடு';

  @override
  String adCountdown(int seconds) {
    return '$seconds வி';
  }

  @override
  String get rulesTitle => 'எப்படி விளையாடுவது?';

  @override
  String get rulesClues =>
      'இடது மற்றும் மேலே உள்ள எண்கள் அந்த வரிசையிலும் நெடுவரிசையிலும் எத்தனை நிரப்பப்பட்ட கட்டங்கள் உள்ளன என்பதைக் காட்டுகின்றன. பல எண்கள் இருந்தால், குழுக்களுக்கு இடையே குறைந்தது ஒரு காலிக் கட்டம் இருக்கும்.';

  @override
  String get rulesMistakes =>
      'காலியாக இருக்க வேண்டிய கட்டத்தை நிரப்பினால் 1 உயிர் போகும். X குறிகள் இலவசம்: விரும்பியபடி குறித்துக்கொள்ளுங்கள். X உள்ள கட்டத்தை நிரப்ப, முதலில் இருமுறை தட்டி X ஐ நீக்குங்கள்.';

  @override
  String get rulesScoring =>
      'ஒவ்வொரு சரியான நிரப்பலுக்கும் புள்ளிகள் கிடைக்கும். தொடர்ந்து சரியாக நிரப்பினால் பெருக்கி கூடும் (x5 வரை). வரிசைகளையும் நெடுவரிசைகளையும் முடித்தால் கூடுதல் புள்ளிகள் கிடைக்கும்.';

  @override
  String levelScore(int score) {
    return '$score புள்ளிகள்';
  }

  @override
  String totalScore(int total) {
    return 'மொத்தம்: $total';
  }

  @override
  String get rulesGoal =>
      'நிரப்பப்பட்ட எல்லாக் கட்டங்களையும் கண்டுபிடியுங்கள், கட்டைகள் ஒரு மறைந்த படமாக மாறும்.';

  @override
  String worldLabel(int n) {
    return 'வரைபடம் $n';
  }

  @override
  String get worldsTitle => 'வரைபடங்கள்';

  @override
  String get worldUnlocked => 'புதிய வரைபடம் திறந்தது!';

  @override
  String get worldComplete => 'வரைபடம் முடிந்தது!';

  @override
  String nextWorld(String name) {
    return 'அடுத்த வரைபடம்: $name';
  }

  @override
  String nextWorldLocked(String name) {
    return '$name ஐத் திறக்க இந்த வரைபடத்தை முடியுங்கள்';
  }

  @override
  String nextWorldSoon(String name) {
    return '$name விரைவில்';
  }

  @override
  String get worldLocked => 'முந்தைய வரைபடத்தை முடியுங்கள்';

  @override
  String get worldSoon => 'விரைவில்';

  @override
  String get youAreHere => 'நீங்கள் இங்கே';

  @override
  String get mapStart => 'தொடக்கம்';

  @override
  String playLevel(int n) {
    return 'விளையாடு · நிலை $n';
  }

  @override
  String get tapToContinue => 'தொடர தட்டவும்';

  @override
  String starCount(int have, int max) {
    return '$have/$max';
  }

  @override
  String get settings => 'அமைப்புகள்';

  @override
  String get settingsSound => 'ஒலி விளைவுகள்';

  @override
  String get settingsLanguage => 'மொழி';

  @override
  String get settingsLanguageDevice => 'சாதன மொழி';

  @override
  String hintRow(int n) {
    return 'வரிசை $n';
  }

  @override
  String hintColumn(int n) {
    return 'நெடுவரிசை $n';
  }

  @override
  String hintFullLine(String line, String clue) {
    return '$line ($clue): குழுக்களும் அவற்றுக்கு இடையே ஒவ்வொரு இடைவெளியும் சேர்ந்து முழு வரியையும் நிரப்புகின்றன, எனவே ஒவ்வொரு கட்டமும் உறுதி. இந்தக் கட்டம் நிரப்பப்பட்டது!';
  }

  @override
  String hintOverlap(String line, String clue) {
    return '$line ($clue): குழுக்களைத் தொடக்கத்துக்கோ முடிவுக்கோ தள்ளுங்கள்: இந்தக் கட்டம் எப்போதும் ஒரு குழுவுக்குள் இருக்கும். எனவே இது நிரப்பப்பட வேண்டும்!';
  }

  @override
  String hintForcedFill(String line, String clue) {
    return '$line ($clue): உங்களிடம் ஏற்கெனவே உள்ள கட்டங்களும் X களும் குழுக்கள் எங்கே பொருந்தும் என்பதைக் குறைக்கின்றன. சாத்தியமான ஒவ்வொரு அமைப்பிலும் இந்தக் கட்டம் நிரப்பப்பட்டுள்ளது!';
  }

  @override
  String hintForcedEmpty(String line, String clue) {
    return '$line ($clue): எந்தக் குழுவும் இந்தக் கட்டத்தை அடைய முடியாது, எனவே இது காலி. இங்கே ஒரு X இட்டோம்.';
  }

  @override
  String get hintFallback => 'இந்தக் கட்டம் படத்தின் ஒரு பகுதி.';

  @override
  String get tutorialSkip => 'தவிர்';

  @override
  String get tutorialGotIt => 'புரிந்தது';

  @override
  String get tutorialL1Fill =>
      'அந்த வரிசையில் எத்தனை கட்டங்கள் நிரப்பப்பட்டுள்ளன என்பதை எண்கள் சொல்கின்றன. இந்த வரிசை 5 என்கிறது, எனவே 5 கட்டங்களும் நிரப்பப்பட்டவை! கட்டத்தை நிரப்ப அதைத் தட்டுங்கள்.';

  @override
  String get tutorialL1Drag =>
      'அருமை! இப்போது விரலை அழுத்திப் பிடித்து இழுத்து வரிசையின் மீதியை நிரப்புங்கள்.';

  @override
  String get tutorialL1Column =>
      'இந்த நெடுவரிசையும் 5 என்கிறது: மேலிருந்து கீழே இழுங்கள்.';

  @override
  String get tutorialL1Finish =>
      'ஒரு வரிசையோ நெடுவரிசையோ முடிந்ததும், அதன் மற்ற கட்டங்களுக்குத் தானாகவே X விழும். படத்தின் மீதியை நீங்களே முடியுங்கள்!';

  @override
  String get tutorialL2Cross =>
      '2 2 என்றால் 2 நிரப்பப்பட்ட கட்டங்கள், குறைந்தது ஒரு இடைவெளி, பிறகு இன்னும் 2 நிரப்பப்பட்ட கட்டங்கள். 2 + இடைவெளி + 2 = 5, எனவே வரிசை உறுதி! X இட காலிக் கட்டத்தை இருமுறை தட்டுங்கள்.';

  @override
  String get tutorialL2Drag =>
      'இழுக்கும்போது உங்கள் X உள்ள கட்டங்கள் தவிர்க்கப்படும். வரிசை முழுவதும் இழுத்து அதை நிரப்புங்கள்.';

  @override
  String get tutorialL2Rules =>
      'தவறான கட்டத்தை நிரப்பினால் 1 உயிர் போகும்; X குறிகள் இலவசம். சிக்கிக்கொண்டால், குறிப்பு பொத்தான் காரணத்தையும் விளக்கும். மீதி உங்கள் கையில்!';
}
