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
  String tutorialLesson(int lesson, int count) {
    return 'पाठ $lesson/$count';
  }

  @override
  String get tutorialStart => 'चलिए शुरू करें!';

  @override
  String get tutorialSkipTitle => 'ट्यूटोरियल छोड़ें?';

  @override
  String get tutorialSkipBody =>
      'सिर्फ़ इस लेवल का पाठ छोड़ें या पूरा ट्यूटोरियल?';

  @override
  String get tutorialSkipLevel => 'सिर्फ़ यह लेवल';

  @override
  String get tutorialSkipAll => 'सब छोड़ें';

  @override
  String get tutorialWelcome =>
      'नमस्ते! हर पहेली में एक तस्वीर छिपी है। संख्याएँ पढ़ें, सही खाने भरें और उसे सामने लाएँ!';

  @override
  String get tutorialL1Fill =>
      '[5]: इस पंक्ति में 5 भरे खाने हैं। पंक्ति भी 5 खानों की है, यानी सभी भरे हैं! किसी एक पर टैप करें।';

  @override
  String get tutorialL1Drag =>
      'बढ़िया! अब उँगली उठाए बिना खिसकाएँ और बाकी पंक्ति भरें।';

  @override
  String get tutorialL1Row =>
      'यह पंक्ति भी [5] है। इस बार एक ही बार में एक सिरे से दूसरे सिरे तक खिसकाएँ।';

  @override
  String get tutorialL1AutoCross =>
      'इस स्तंभ के [2] खाने मिल गए, इसलिए बाकी पर अपने आप X लग गया। X का मतलब है: खाली।';

  @override
  String get tutorialL1Column =>
      'ऊपर की संख्याएँ स्तंभों के लिए हैं। यह स्तंभ [5] है: ऊपर से नीचे खिसकाएँ।';

  @override
  String get tutorialL1Count =>
      'इस पंक्ति को [3] खाने चाहिए। X वाले खाने खाली हैं, तो ठीक 3 खाने बचे हैं। सब भर दें!';

  @override
  String get tutorialL1Finish =>
      'आखिरी पंक्ति खुद पूरी करें और तस्वीर सामने लाएँ!';

  @override
  String get tutorialL2Groups =>
      '[2 2]: दो अलग समूह। 2 भरे, कम से कम 1 खाली, फिर 2 भरे। 2 + 1 + 2 = 5: बिल्कुल फ़िट!';

  @override
  String get tutorialL2Cross =>
      'यानी बीच वाला खाना खाली है। उस पर डबल टैप करके X लगाएँ।';

  @override
  String get tutorialL2Drag =>
      'X बस एक नोट है, इसकी कोई कीमत नहीं। अब पंक्ति पर खिसकाएँ: X वाला खाना छूट जाता है।';

  @override
  String get tutorialL2CrossSelf =>
      'नीचे वाली पंक्ति भी [2 2] है। आपकी बारी: पहले खाली खाने पर डबल टैप करके X लगाएँ।';

  @override
  String get tutorialL2DragSelf => 'अब खिसकाकर पंक्ति भरें।';

  @override
  String get tutorialL2Mistakes =>
      'ध्यान दें: गलत खाना भरने पर वह लाल X बन जाता है और एक दिल चला जाता है। पक्का नहीं? पहले X लगाएँ!';

  @override
  String get tutorialL2Finish =>
      'बाकी आपका! अटक गए? गिनें कि किसी रेखा में अभी कितने खाने बाकी हैं।';

  @override
  String get tutorialL3Overlap =>
      'यह स्तंभ [4] है और जगह 5 खानों की। 4 का ब्लॉक या तो सबसे ऊपर है या सबसे नीचे। दोनों में बीच के 3 खाने भरे हैं!';

  @override
  String get tutorialL3OverlapFill =>
      'ये पक्के खाने भरें। इस तरकीब का नाम ओवरलैप है: बड़ी पहेलियों का राज़!';

  @override
  String get tutorialL3OverlapSelf =>
      'यह स्तंभ भी [4] है। पक्के खाने खुद ढूँढें!';

  @override
  String get tutorialL3OverlapRow =>
      'और [3]? बाएँ खिसके या दाएँ, बीच का खाना हमेशा भरा होता है। उसे भरें!';

  @override
  String get tutorialL3Finish =>
      'शानदार! यह तरकीब बड़ी पहेलियों में बहुत काम आएगी। अब तस्वीर पूरी करें!';

  @override
  String get tutorialL4Ones =>
      'ऊपर की दो पंक्तियाँ [1 1 1] हैं: तीन अकेले खाने, बीच में खाली जगह। 1 + 1 + 1 + 1 + 1 = 5: बिल्कुल फ़िट!';

  @override
  String get tutorialL4CrossDrag =>
      'ये दो खाने खाली हैं। डबल टैप करें, दूसरे टैप पर उँगली दबाए रखें और नीचे खिसकाएँ: X की रेखा!';

  @override
  String get tutorialL4CrossDragSelf =>
      'आपकी बारी: इस स्तंभ के दो खाली खानों पर X बनाएँ।';

  @override
  String get tutorialL4Erase =>
      'गलत X लग गया? उस पर फिर से डबल टैप करें, हट जाएगा। X से डबल टैप करके खिसकाएँ तो रास्ते के X मिट जाते हैं।';

  @override
  String get tutorialL4Finish => 'बहुत बढ़िया! अब तस्वीर पूरी करें।';

  @override
  String get tutorialL5Sum =>
      'आखिरी पाठ! यह स्तंभ [3 1] है: 3 + 1 + 1 = 5, यानी पक्का है। खुद हल करें!';

  @override
  String get tutorialL5Hint =>
      'अटक गए? संकेत दबाएँ: यह अगला कदम और उसकी वजह दिखाता है।';

  @override
  String get tutorialL5Finish =>
      'आप तैयार हैं! बड़े ग्रिड में मोटी रेखाएँ हर 5 खानों को अलग करती हैं ताकि गिनना आसान हो। तस्वीर पूरी करें!';
}
