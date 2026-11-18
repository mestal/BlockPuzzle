// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'Pixel Bloom';

  @override
  String get whoIsPlaying => 'कौन खेल रहा है?';

  @override
  String get newGame => 'नया खेल';

  @override
  String get emptySlot => 'खाली स्लॉट';

  @override
  String get yourName => 'आपका नाम';

  @override
  String get namePlaceholder => 'उदाहरण: आरव';

  @override
  String get nameRequired => 'नाम लिखें';

  @override
  String get start => 'शुरू करें';

  @override
  String get cancel => 'रद्द करें';

  @override
  String deleteSlotTitle(String name) {
    return '$name को हटाएँ?';
  }

  @override
  String get deleteSlotBody =>
      'इस खिलाड़ी की सारी प्रगति हट जाएगी। इसे वापस नहीं लाया जा सकता।';

  @override
  String get delete => 'हटाएँ';

  @override
  String levelLabel(int n) {
    return 'लेवल $n';
  }

  @override
  String hintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count संकेत',
      one: '1 संकेत',
    );
    return '$_temp0';
  }

  @override
  String get tutorialTap => 'टैप: भरें';

  @override
  String get tutorialDoubleTap => 'डबल टैप: X लगाएँ (X पर फिर डबल टैप: हटाएँ)';

  @override
  String get tutorialDrag =>
      'एक साथ कई खाने चिह्नित करने के लिए दबाकर रखें और खिसकाएँ। X से डबल टैप करके खिसकाने पर X मिट जाते हैं।';

  @override
  String get hint => 'संकेत';

  @override
  String get noHintsTitle => 'कोई संकेत नहीं बचा';

  @override
  String get noHintsBody => '1 संकेत पाने के लिए एक छोटा विज्ञापन देखें।';

  @override
  String get noHintsBodyNoAds => 'तुमने अपने सारे संकेत इस्तेमाल कर लिए हैं।';

  @override
  String get watchAdForHint => 'विज्ञापन देखें: +1 संकेत';

  @override
  String get outOfLivesTitle => 'जानें ख़त्म हो गईं';

  @override
  String get outOfLivesBody =>
      '1 और जान पाने के लिए विज्ञापन देखें, या लेवल फिर से शुरू करें।';

  @override
  String get outOfLivesBodyNoAds =>
      'स्तर फिर से शुरू करो या स्तरों पर वापस जाओ।';

  @override
  String get watchAdForLife => 'विज्ञापन देखें: +1 जान';

  @override
  String get restart => 'फिर से शुरू करें';

  @override
  String get backToLevels => 'लेवल पर वापस';

  @override
  String get levelComplete => 'शाबाश!';

  @override
  String nextLevel(int n) {
    return 'अगला: लेवल $n';
  }

  @override
  String get ok => 'ठीक है';

  @override
  String get allDoneSoon => 'नए लेवल जल्द आ रहे हैं';

  @override
  String get adLabel => 'विज्ञापन';

  @override
  String get adPlaceholder => 'यहाँ एक विज्ञापन दिखाया जाएगा';

  @override
  String get adClose => 'बंद करें';

  @override
  String adCountdown(int seconds) {
    return '$seconds से.';
  }

  @override
  String get rulesTitle => 'कैसे खेलें?';

  @override
  String get rulesClues =>
      'बाईं और ऊपर की संख्याएँ बताती हैं कि उस पंक्ति और स्तंभ में कितने भरे हुए खाने हैं। अगर कई संख्याएँ हैं, तो समूहों के बीच कम से कम एक खाली खाना होता है।';

  @override
  String get rulesMistakes =>
      'जो खाना खाली होना चाहिए उसे भरने पर 1 जान जाती है। X मुफ़्त हैं: जैसे चाहें नोट्स बनाएँ। X वाले खाने को भरने के लिए पहले डबल टैप से X हटाएँ।';

  @override
  String get rulesScoring =>
      'हर सही भराई पर अंक मिलते हैं। लगातार सही भरने से गुणक बढ़ता है (x5 तक)। पंक्तियाँ और स्तंभ पूरे करने पर बोनस अंक मिलते हैं।';

  @override
  String levelScore(int score) {
    return '$score अंक';
  }

  @override
  String totalScore(int total) {
    return 'कुल: $total';
  }

  @override
  String get rulesGoal =>
      'सभी भरे हुए खाने ढूँढ़ें और ब्लॉक एक छिपी हुई तस्वीर में बदल जाएँगे।';

  @override
  String worldLabel(int n) {
    return 'नक्शा $n';
  }

  @override
  String get worldsTitle => 'नक्शे';

  @override
  String get worldUnlocked => 'नया नक्शा खुल गया!';

  @override
  String get worldComplete => 'नक्शा पूरा हुआ!';

  @override
  String nextWorld(String name) {
    return 'अगला नक्शा: $name';
  }

  @override
  String nextWorldLocked(String name) {
    return '$name खोलने के लिए यह नक्शा पूरा करें';
  }

  @override
  String nextWorldSoon(String name) {
    return '$name जल्द आ रहा है';
  }

  @override
  String get worldLocked => 'पिछला नक्शा पूरा करें';

  @override
  String get worldSoon => 'जल्द आ रहा है';

  @override
  String get youAreHere => 'आप यहाँ हैं';

  @override
  String get mapStart => 'शुरुआत';

  @override
  String playLevel(int n) {
    return 'खेलें · लेवल $n';
  }

  @override
  String get tapToContinue => 'जारी रखने के लिए टैप करें';

  @override
  String starCount(int have, int max) {
    return '$have/$max';
  }

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get settingsSound => 'ध्वनि प्रभाव';

  @override
  String get settingsLanguage => 'भाषा';

  @override
  String get settingsLanguageDevice => 'डिवाइस की भाषा';

  @override
  String hintRow(int n) {
    return 'पंक्ति $n';
  }

  @override
  String hintColumn(int n) {
    return 'स्तंभ $n';
  }

  @override
  String hintFullLine(String line, String clue) {
    return '$line ($clue): समूह और उनके बीच एक-एक खाली खाना मिलकर पूरी रेखा भर देते हैं, इसलिए हर खाना तय है। यह खाना भरा हुआ है!';
  }

  @override
  String hintOverlap(String line, String clue) {
    return '$line ($clue): समूहों को शुरुआत या अंत की ओर खिसकाएँ, यह खाना हमेशा किसी समूह के अंदर रहता है। इसलिए इसे भरा होना ही चाहिए!';
  }

  @override
  String hintForcedFill(String line, String clue) {
    return '$line ($clue): आपके पहले से भरे खाने और X तय करते हैं कि समूह कहाँ आ सकते हैं। हर संभव व्यवस्था में यह खाना भरा हुआ है!';
  }

  @override
  String hintForcedEmpty(String line, String clue) {
    return '$line ($clue): कोई भी समूह इस खाने तक नहीं पहुँचता, इसलिए यह खाली है। हम यहाँ X लगाते हैं।';
  }

  @override
  String get hintFallback => 'यह खाना तस्वीर का हिस्सा है।';

  @override
  String get tutorialSkip => 'छोड़ें';

  @override
  String get tutorialGotIt => 'समझ आ गया';

  @override
  String get tutorialL1Fill =>
      'संख्याएँ बताती हैं कि उस पंक्ति में कितने खाने भरे हैं। इस पंक्ति में 5 लिखा है, इसलिए सभी 5 खाने भरे हैं! किसी खाने को भरने के लिए उस पर टैप करें।';

  @override
  String get tutorialL1Drag =>
      'बढ़िया! अब उँगली दबाकर रखें और बाकी पंक्ति भरने के लिए खिसकाएँ।';

  @override
  String get tutorialL1Column => 'इस स्तंभ में भी 5 है: ऊपर से नीचे खिसकाएँ।';

  @override
  String get tutorialL1Finish =>
      'जब कोई पंक्ति या स्तंभ पूरा हो जाता है, तो उसके बाकी खानों पर अपने आप X लग जाता है। बाकी तस्वीर खुद पूरी करें!';

  @override
  String get tutorialL2Cross =>
      '2 2 का मतलब है 2 भरे खाने, कम से कम एक खाली खाना, फिर 2 और भरे खाने। 2 + खाली + 2 = 5, इसलिए पंक्ति तय है! X लगाने के लिए खाली खाने पर डबल टैप करें।';

  @override
  String get tutorialL2Drag =>
      'खिसकाते समय आपके X वाले खाने छूट जाते हैं। पूरी पंक्ति भरने के लिए उसके साथ-साथ खिसकाएँ।';

  @override
  String get tutorialL2Rules =>
      'गलत खाना भरने पर 1 जान जाती है; X मुफ़्त हैं। अगर अटक जाएँ, तो संकेत बटन यह भी समझाता है कि क्यों। बाकी आप पर है!';
}
