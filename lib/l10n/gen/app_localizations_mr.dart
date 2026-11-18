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
  String tutorialLesson(int lesson, int count) {
    return 'धडा $lesson/$count';
  }

  @override
  String get tutorialStart => 'चला सुरू करूया!';

  @override
  String get tutorialSkipTitle => 'मार्गदर्शक वगळायचा?';

  @override
  String get tutorialSkipBody =>
      'फक्त या स्तराचा धडा वगळायचा की संपूर्ण मार्गदर्शक?';

  @override
  String get tutorialSkipLevel => 'फक्त हा स्तर';

  @override
  String get tutorialSkipAll => 'सर्व वगळा';

  @override
  String get tutorialWelcome =>
      'नमस्कार! प्रत्येक कोड्यात एक चित्र लपलेले आहे. आकडे वाचा, योग्य चौकोन भरा आणि ते उघड करा!';

  @override
  String get tutorialL1Fill =>
      '[5]: या ओळीत 5 भरलेले चौकोन आहेत. ओळही 5 चौकोनांची आहे, म्हणजे सर्व भरलेले! एकावर टॅप करा.';

  @override
  String get tutorialL1Drag => 'छान! आता बोट न उचलता सरकवा आणि उरलेली ओळ भरा.';

  @override
  String get tutorialL1Row =>
      'ही ओळही [5] आहे. या वेळी एकाच हालचालीत एका टोकापासून दुसऱ्या टोकापर्यंत सरकवा.';

  @override
  String get tutorialL1AutoCross =>
      'या स्तंभाचे [2] चौकोन सापडले, म्हणून उरलेल्यांवर आपोआप X लागला. X म्हणजे: रिकामे.';

  @override
  String get tutorialL1Column =>
      'वरचे आकडे स्तंभांसाठी आहेत. हा स्तंभ [5] आहे: वरून खाली सरकवा.';

  @override
  String get tutorialL1Count =>
      'या ओळीला [3] चौकोन हवेत. X असलेले चौकोन रिकामे आहेत, म्हणून नेमके 3 उरले. ते सर्व भरा!';

  @override
  String get tutorialL1Finish => 'शेवटची ओळ स्वतः पूर्ण करा आणि चित्र उघड करा!';

  @override
  String get tutorialL2Groups =>
      '[2 2]: दोन वेगळे गट. 2 भरलेले, किमान 1 रिकामा, मग 2 भरलेले. 2 + 1 + 2 = 5: अगदी बरोबर बसते!';

  @override
  String get tutorialL2Cross =>
      'म्हणजे मधला चौकोन रिकामा आहे. त्यावर डबल टॅप करून X लावा.';

  @override
  String get tutorialL2Drag =>
      'X ही फक्त नोंद आहे, तिची काही किंमत नाही. आता ओळीवरून सरकवा: X असलेला चौकोन वगळला जातो.';

  @override
  String get tutorialL2CrossSelf =>
      'खालची ओळही [2 2] आहे. तुमची पाळी: आधी रिकाम्या चौकोनावर डबल टॅप करून X लावा.';

  @override
  String get tutorialL2DragSelf => 'आता सरकवून ओळ भरा.';

  @override
  String get tutorialL2Mistakes =>
      'लक्ष द्या: चुकीचा चौकोन भरल्यास तो लाल X होतो आणि एक हृदय जाते. खात्री नाही? आधी X लावा!';

  @override
  String get tutorialL2Finish =>
      'बाकी तुमचे! अडकलात? एखाद्या रेषेत अजून किती चौकोन हवेत ते मोजा.';

  @override
  String get tutorialL3Overlap =>
      'हा स्तंभ [4] आहे आणि जागा 5 चौकोनांची. 4 चा ब्लॉक एकतर अगदी वर किंवा अगदी खाली असतो. दोन्हीत मधले 3 भरलेले!';

  @override
  String get tutorialL3OverlapFill =>
      'हे नक्की चौकोन भरा. या युक्तीचे नाव ओव्हरलॅप: मोठ्या कोड्यांचे रहस्य!';

  @override
  String get tutorialL3OverlapSelf =>
      'हा स्तंभही [4] आहे. नक्की चौकोन स्वतः शोधा!';

  @override
  String get tutorialL3OverlapRow =>
      'आणि [3]? डावीकडे सरको की उजवीकडे, मधला चौकोन नेहमी भरलेला. तो भरा!';

  @override
  String get tutorialL3Finish =>
      'मस्त! ही युक्ती मोठ्या कोड्यांत खूप उपयोगी पडेल. आता चित्र पूर्ण करा!';

  @override
  String get tutorialL4Ones =>
      'वरच्या दोन ओळी [1 1 1] आहेत: तीन एकटे चौकोन, मध्ये रिकामी जागा. 1 + 1 + 1 + 1 + 1 = 5: अगदी बरोबर बसतात!';

  @override
  String get tutorialL4CrossDrag =>
      'हे दोन चौकोन रिकामे आहेत. डबल टॅप करा, दुसऱ्या टॅपला बोट दाबून ठेवा आणि खाली सरकवा: X ची रेषा!';

  @override
  String get tutorialL4CrossDragSelf =>
      'तुमची पाळी: या स्तंभातील दोन रिकाम्या चौकोनांवर X काढा.';

  @override
  String get tutorialL4Erase =>
      'चुकीचा X लावला? त्यावर पुन्हा डबल टॅप करा, तो जाईल. X पासून डबल टॅप करून सरकवल्यास वाटेतले X पुसले जातात.';

  @override
  String get tutorialL4Finish => 'खूप छान! आता चित्र पूर्ण करा.';

  @override
  String get tutorialL5Sum =>
      'शेवटचा धडा! हा स्तंभ [3 1] आहे: 3 + 1 + 1 = 5, म्हणजे नक्की. स्वतः सोडवा!';

  @override
  String get tutorialL5Hint =>
      'अडकलात? सूचना दाबा: ती पुढची पायरी आणि त्याचे कारण दाखवते.';

  @override
  String get tutorialL5Finish =>
      'तुम्ही तयार आहात! मोठ्या जाळ्यांत जाड रेषा दर 5 चौकोनांनी विभागतात, त्यामुळे मोजणे सोपे होते. चित्र पूर्ण करा!';
}
