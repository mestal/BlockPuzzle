// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get appTitle => 'Pixel Bloom';

  @override
  String get whoIsPlaying => 'कोण खेळत आहे?';

  @override
  String get newGame => 'नवीन खेळ';

  @override
  String get emptySlot => 'रिकामा स्लॉट';

  @override
  String get yourName => 'तुमचे नाव';

  @override
  String get namePlaceholder => 'उदा. सई';

  @override
  String get nameRequired => 'नाव लिहा';

  @override
  String get pickColor => 'तुमचा रंग निवडा';

  @override
  String get start => 'सुरू करा';

  @override
  String get cancel => 'रद्द करा';

  @override
  String deleteSlotTitle(String name) {
    return '$name हटवायचे?';
  }

  @override
  String get deleteSlotBody =>
      'या खेळाडूची सर्व प्रगती हटवली जाईल. हे पूर्ववत करता येणार नाही.';

  @override
  String get delete => 'हटवा';

  @override
  String levelLabel(int n) {
    return 'स्तर $n';
  }

  @override
  String hintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count सूचना',
      one: '1 सूचना',
    );
    return '$_temp0';
  }

  @override
  String get tutorialTap => 'टॅप: भरा';

  @override
  String get tutorialDoubleTap => 'डबल टॅप: X लावा (X वर पुन्हा डबल टॅप: काढा)';

  @override
  String get tutorialDrag =>
      'दाबून धरा आणि सरकवा, म्हणजे अनेक चौकोन एकाच वेळी खुणावले जातील. X पुसण्यासाठी डबल टॅप करून एखाद्या X पासून सरकवा.';

  @override
  String get hint => 'सूचना';

  @override
  String get noHintsTitle => 'सूचना संपल्या';

  @override
  String get noHintsBody => '1 सूचना मिळवण्यासाठी एक छोटी जाहिरात पाहा.';

  @override
  String get noHintsBodyNoAds => 'तुम्ही सर्व सूचना वापरल्या आहेत.';

  @override
  String get watchAdForHint => 'जाहिरात पाहा: +1 सूचना';

  @override
  String get outOfLivesTitle => 'जीव संपले';

  @override
  String get outOfLivesBody =>
      'आणखी 1 जीव मिळवण्यासाठी जाहिरात पाहा, किंवा स्तर पुन्हा सुरू करा.';

  @override
  String get outOfLivesBodyNoAds =>
      'स्तर पुन्हा सुरू करा, किंवा स्तरांकडे परत जा.';

  @override
  String get watchAdForLife => 'जाहिरात पाहा: +1 जीव';

  @override
  String get restart => 'पुन्हा सुरू करा';

  @override
  String get backToLevels => 'स्तरांकडे परत';

  @override
  String get levelComplete => 'छान!';

  @override
  String nextLevel(int n) {
    return 'पुढे: स्तर $n';
  }

  @override
  String get ok => 'ठीक आहे';

  @override
  String get allDoneSoon => 'नवीन स्तर लवकरच येत आहेत';

  @override
  String get adLabel => 'जाहिरात';

  @override
  String get adPlaceholder => 'इथे एक जाहिरात दाखवली जाईल';

  @override
  String get adClose => 'बंद करा';

  @override
  String adCountdown(int seconds) {
    return '$seconds से.';
  }

  @override
  String get rulesTitle => 'कसे खेळायचे?';

  @override
  String get rulesClues =>
      'डावीकडील आणि वरचे आकडे सांगतात की त्या ओळीत आणि स्तंभात किती चौकोन भरलेले आहेत. अनेक आकडे असतील तर गटांमध्ये किमान एक रिकामा चौकोन असतो.';

  @override
  String get rulesMistakes =>
      'जो चौकोन रिकामा असायला हवा तो भरल्यास 1 जीव जातो. X खुणा मोफत आहेत: हवे तसे नोंदी करा. X असलेला चौकोन भरण्यासाठी आधी डबल टॅप करून X काढा.';

  @override
  String get rulesScoring =>
      'प्रत्येक योग्य भरण्याला गुण मिळतात. सलग योग्य भरल्याने गुणक वाढतो (x5 पर्यंत). ओळी आणि स्तंभ पूर्ण केल्यावर बोनस गुण मिळतात.';

  @override
  String levelScore(int score) {
    return '$score गुण';
  }

  @override
  String totalScore(int total) {
    return 'एकूण: $total';
  }

  @override
  String get rulesGoal =>
      'सर्व भरलेले चौकोन शोधा आणि ब्लॉक एका लपलेल्या चित्रात बदलतील.';

  @override
  String worldLabel(int n) {
    return 'नकाशा $n';
  }

  @override
  String get worldsTitle => 'नकाशे';

  @override
  String get worldUnlocked => 'नवीन नकाशा उघडला!';

  @override
  String get worldComplete => 'नकाशा पूर्ण!';

  @override
  String nextWorld(String name) {
    return 'पुढील नकाशा: $name';
  }

  @override
  String nextWorldLocked(String name) {
    return '$name उघडण्यासाठी हा नकाशा पूर्ण करा';
  }

  @override
  String nextWorldSoon(String name) {
    return '$name लवकरच';
  }

  @override
  String get worldLocked => 'मागील नकाशा पूर्ण करा';

  @override
  String get worldSoon => 'लवकरच';

  @override
  String get youAreHere => 'तुम्ही इथे आहात';

  @override
  String get mapStart => 'सुरुवात';

  @override
  String playLevel(int n) {
    return 'खेळा · स्तर $n';
  }

  @override
  String get tapToContinue => 'पुढे जाण्यासाठी टॅप करा';

  @override
  String starCount(int have, int max) {
    return '$have/$max';
  }

  @override
  String get settings => 'सेटिंग्ज';

  @override
  String get settingsSound => 'ध्वनी प्रभाव';

  @override
  String get settingsLanguage => 'भाषा';

  @override
  String get settingsLanguageDevice => 'डिव्हाइसची भाषा';

  @override
  String hintRow(int n) {
    return 'ओळ $n';
  }

  @override
  String hintColumn(int n) {
    return 'स्तंभ $n';
  }

  @override
  String hintFullLine(String line, String clue) {
    return '$line ($clue): गट आणि प्रत्येकामधील एक जागा मिळून संपूर्ण रेषा भरते, म्हणून प्रत्येक चौकोन निश्चित आहे. हा चौकोन भरलेला आहे!';
  }

  @override
  String hintOverlap(String line, String clue) {
    return '$line ($clue): गट सुरुवातीला किंवा शेवटी ढकला: हा चौकोन नेहमी एखाद्या गटात असतो. म्हणून तो भरलेलाच असला पाहिजे!';
  }

  @override
  String hintForcedFill(String line, String clue) {
    return '$line ($clue): तुमच्याकडे आधीच असलेले चौकोन आणि X गट कुठे बसू शकतात ते मर्यादित करतात. प्रत्येक शक्य मांडणीत हा चौकोन भरलेला आहे!';
  }

  @override
  String hintForcedEmpty(String line, String clue) {
    return '$line ($clue): कोणताही गट या चौकोनापर्यंत पोहोचू शकत नाही, म्हणून तो रिकामा आहे. आम्ही इथे X लावला.';
  }

  @override
  String get hintFallback => 'हा चौकोन चित्राचा भाग आहे.';

  @override
  String get tutorialSkip => 'वगळा';

  @override
  String get tutorialGotIt => 'समजले';

  @override
  String get tutorialL1Fill =>
      'आकडे सांगतात की त्या ओळीत किती चौकोन भरलेले आहेत. ही ओळ 5 सांगते, म्हणजे सर्व 5 चौकोन भरलेले आहेत! चौकोन भरण्यासाठी त्यावर टॅप करा.';

  @override
  String get tutorialL1Drag =>
      'छान! आता बोट दाबून धरा आणि ओळीचा उरलेला भाग भरण्यासाठी सरकवा.';

  @override
  String get tutorialL1Column => 'हा स्तंभही 5 सांगतो: वरून खाली सरकवा.';

  @override
  String get tutorialL1Finish =>
      'ओळ किंवा स्तंभ पूर्ण झाल्यावर त्यातील इतर चौकोनांवर आपोआप X लागतो. उरलेले चित्र तुम्हीच पूर्ण करा!';

  @override
  String get tutorialL2Cross =>
      '2 2 म्हणजे 2 भरलेले चौकोन, किमान एक जागा, मग आणखी 2 भरलेले चौकोन. 2 + जागा + 2 = 5, म्हणून ओळ निश्चित आहे! X लावण्यासाठी रिकाम्या चौकोनावर डबल टॅप करा.';

  @override
  String get tutorialL2Drag =>
      'सरकवताना तुमचा X असलेले चौकोन वगळले जातात. संपूर्ण ओळ भरण्यासाठी तिच्यावरून सरकवा.';

  @override
  String get tutorialL2Rules =>
      'चुकीचा चौकोन भरल्यास 1 जीव जातो; X खुणा मोफत आहेत. अडकलात तर सूचना बटण कारणही सांगते. बाकी तुमच्यावर!';
}
