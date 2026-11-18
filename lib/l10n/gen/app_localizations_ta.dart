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
  String get noHintsBodyNoAds =>
      'எல்லாக் குறிப்புகளையும் பயன்படுத்திவிட்டீர்கள்.';

  @override
  String get watchAdForHint => 'விளம்பரம் பார்: +1 குறிப்பு';

  @override
  String get outOfLivesTitle => 'உயிர்கள் தீர்ந்தன';

  @override
  String get outOfLivesBody =>
      'இன்னும் 1 உயிர் பெற விளம்பரத்தைப் பாருங்கள், அல்லது நிலையை மீண்டும் தொடங்குங்கள்.';

  @override
  String get outOfLivesBodyNoAds =>
      'நிலையை மீண்டும் தொடங்குங்கள், அல்லது நிலைகளுக்குத் திரும்புங்கள்.';

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
  String tutorialLesson(int lesson, int count) {
    return 'பாடம் $lesson/$count';
  }

  @override
  String get tutorialStart => 'தொடங்குவோம்!';

  @override
  String get tutorialSkipTitle => 'பயிற்சியைத் தவிர்க்கவா?';

  @override
  String get tutorialSkipBody =>
      'இந்த நிலையின் பாடத்தை மட்டுமா, முழுப் பயிற்சியையுமா தவிர்க்க வேண்டும்?';

  @override
  String get tutorialSkipLevel => 'இந்த நிலை மட்டும்';

  @override
  String get tutorialSkipAll => 'அனைத்தையும் தவிர்';

  @override
  String get tutorialWelcome =>
      'வணக்கம்! ஒவ்வொரு புதிரிலும் ஒரு படம் ஒளிந்திருக்கிறது. எண்களைப் படித்து, சரியான கட்டங்களை நிரப்பி, அதை வெளிக்கொணருங்கள்!';

  @override
  String get tutorialL1Fill =>
      '[5]: இந்த வரிசையில் 5 நிரப்பிய கட்டங்கள். வரிசையும் 5 கட்டங்கள்தான், எனவே எல்லாமே நிரம்பும்! ஒன்றைத் தட்டுங்கள்.';

  @override
  String get tutorialL1Drag =>
      'அருமை! இப்போது விரலை எடுக்காமல் இழுத்து, வரிசையின் மீதியை நிரப்புங்கள்.';

  @override
  String get tutorialL1Row =>
      'இந்த வரிசையும் [5]. இந்த முறை ஒரே இழுப்பில் ஒரு முனையிலிருந்து மறுமுனை வரை இழுங்கள்.';

  @override
  String get tutorialL1AutoCross =>
      'இந்த நெடுவரிசையின் [2] கட்டங்கள் கிடைத்தன, அதனால் மீதிக்குத் தானாக X விழுந்தது. X என்றால்: காலி.';

  @override
  String get tutorialL1Column =>
      'மேலே உள்ள எண்கள் நெடுவரிசைகளுக்கானவை. இந்த நெடுவரிசை [5]: மேலிருந்து கீழே இழுங்கள்.';

  @override
  String get tutorialL1Count =>
      'இந்த வரிசைக்கு [3] கட்டங்கள் தேவை. X உள்ளவை காலி, எனவே சரியாக 3 கட்டங்கள் மீதம். அனைத்தையும் நிரப்புங்கள்!';

  @override
  String get tutorialL1Finish =>
      'கடைசி வரிசையை நீங்களே முடித்து படத்தை வெளிக்கொணருங்கள்!';

  @override
  String get tutorialL2Groups =>
      '[2 2]: இரண்டு தனிக் குழுக்கள். 2 நிரப்பியவை, குறைந்தது 1 காலி, பிறகு 2 நிரப்பியவை. 2 + 1 + 2 = 5: கச்சிதமாகப் பொருந்துகிறது!';

  @override
  String get tutorialL2Cross =>
      'அப்படியானால் நடுக் கட்டம் காலி. அதை இருமுறை தட்டி X இடுங்கள்.';

  @override
  String get tutorialL2Drag =>
      'X என்பது ஒரு குறிப்பு மட்டுமே, அதற்குச் செலவில்லை. இப்போது வரிசை முழுவதும் இழுங்கள்: X உள்ள கட்டம் தவிர்க்கப்படும்.';

  @override
  String get tutorialL2CrossSelf =>
      'கீழ் வரிசையும் [2 2]. உங்கள் முறை: முதலில் காலிக் கட்டத்தை இருமுறை தட்டி X இடுங்கள்.';

  @override
  String get tutorialL2DragSelf => 'இப்போது இழுத்து வரிசையை நிரப்புங்கள்.';

  @override
  String get tutorialL2Mistakes =>
      'கவனம்: தவறான கட்டத்தை நிரப்பினால் அது சிவப்பு X ஆகி ஒரு இதயம் போகும். உறுதியில்லையா? முதலில் X இடுங்கள்!';

  @override
  String get tutorialL2Finish =>
      'மீதி உங்களுடையது! சிக்கிக்கொண்டால், ஒரு கோட்டுக்கு இன்னும் எத்தனை கட்டங்கள் தேவை என்று எண்ணுங்கள்.';

  @override
  String get tutorialL3Overlap =>
      'இந்த நெடுவரிசை [4], இடம் 5 கட்டங்கள். 4 கட்டத் தொகுதி முழு மேலே அல்லது முழு கீழே இருக்கும். எப்படியிருந்தாலும் நடுவில் உள்ள 3 நிரம்பியவை!';

  @override
  String get tutorialL3OverlapFill =>
      'இந்த உறுதியான கட்டங்களை நிரப்புங்கள். இந்த உத்தியின் பெயர் மேலொன்றல்: பெரிய புதிர்களின் ரகசியம்!';

  @override
  String get tutorialL3OverlapSelf =>
      'இந்த நெடுவரிசையும் [4]. உறுதியான கட்டங்களை நீங்களே கண்டுபிடியுங்கள்!';

  @override
  String get tutorialL3OverlapRow =>
      '[3] என்றால்? இடப்பக்கம் தள்ளினாலும் வலப்பக்கம் தள்ளினாலும் நடுக் கட்டம் எப்போதும் நிரம்பும். அதை நிரப்புங்கள்!';

  @override
  String get tutorialL3Finish =>
      'அருமை! பெரிய புதிர்களில் இந்த உத்தி அடிக்கடி உதவும். இப்போது படத்தை முடியுங்கள்!';

  @override
  String get tutorialL4Ones =>
      'மேல் மூன்று வரிசைகள் [1 1 1]: இடைவெளியுடன் மூன்று தனிக் கட்டங்கள். 1 + 1 + 1 + 1 + 1 = 5: கச்சிதமாகப் பொருந்துகின்றன!';

  @override
  String get tutorialL4CrossDrag =>
      'எனவே இந்த நெடுவரிசையின் மேல் மூன்று கட்டங்களும் காலி. இருமுறை தட்டி, இரண்டாவது தட்டலில் விரலை அழுத்தியபடி கீழே இழுங்கள்: ஒரே நேரத்தில் மூன்று X!';

  @override
  String get tutorialL4CrossDragSelf =>
      'உங்கள் முறை: ஒரே இழுப்பில் இந்த நெடுவரிசையின் மூன்று காலிக் கட்டங்களில் X வரையுங்கள்.';

  @override
  String get tutorialL4Erase =>
      'தவறான X? அதை மீண்டும் இருமுறை தட்டினால் அழியும். ஒரு X இலிருந்து இருமுறை தட்டி இழுத்தால், வழியில் உள்ள X கள் அழியும்.';

  @override
  String get tutorialL4Finish => 'சூப்பர்! இப்போது படத்தை முடியுங்கள்.';

  @override
  String get tutorialL5Gaps =>
      'கடைசிப் பாடம்: X கொண்டு தீர்ப்பது! ஓரத்தில் உள்ள நான்கு நெடுவரிசைகளும் [2 2]: 2 + 1 + 2 = 5. அவற்றின் இடைவெளிகள் எல்லாம் நடு வரிசையில் விழுகின்றன.';

  @override
  String get tutorialL5CrossDrag =>
      'இந்தக் காலிக் கட்டங்களில் X இடுங்கள்: இருமுறை தட்டி, இரண்டாவது தட்டலில் விரலை அழுத்தியபடி பக்கவாட்டில் இழுங்கள்: ஒரே நேரத்தில் இரண்டு X!';

  @override
  String get tutorialL5CrossDragSelf =>
      'உங்கள் முறை: ஒரே இழுப்பில் வலப்பக்கம் உள்ள இரண்டு காலிக் கட்டங்களில் X வரையுங்கள்.';

  @override
  String get tutorialL5Count =>
      'இந்த வரிசை [1], X இட்ட பிறகு ஒரே ஒரு கட்டம் மட்டுமே மீதம். X இருந்தால் எண்ணுவது எளிது: அதை நிரப்புங்கள்!';

  @override
  String get tutorialL5Hint =>
      'சிக்கிக்கொண்டீர்களா? குறிப்பு அழுத்துங்கள்: அடுத்த படியையும் காரணத்தையும் காட்டும்.';

  @override
  String get tutorialL5Finish =>
      'நீங்கள் தயார்! பெரிய கட்டங்களில் தடித்த கோடுகள் ஒவ்வொரு 5 கட்டங்களையும் பிரிக்கின்றன, எண்ணுவது எளிது. படத்தை முடியுங்கள்!';
}
