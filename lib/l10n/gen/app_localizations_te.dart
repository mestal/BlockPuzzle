// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get appTitle => 'Pixel Bloom';

  @override
  String get whoIsPlaying => 'ఎవరు ఆడుతున్నారు?';

  @override
  String get newGame => 'కొత్త ఆట';

  @override
  String get emptySlot => 'ఖాళీ స్లాట్';

  @override
  String get yourName => 'మీ పేరు';

  @override
  String get namePlaceholder => 'ఉదా. సాయి';

  @override
  String get nameRequired => 'పేరు రాయండి';

  @override
  String get start => 'ప్రారంభించండి';

  @override
  String get cancel => 'రద్దు చేయండి';

  @override
  String deleteSlotTitle(String name) {
    return '$nameను తొలగించాలా?';
  }

  @override
  String get deleteSlotBody =>
      'ఈ ఆటగాడి ప్రగతి మొత్తం తొలగించబడుతుంది. దీన్ని రద్దు చేయలేరు.';

  @override
  String get delete => 'తొలగించండి';

  @override
  String levelLabel(int n) {
    return 'స్థాయి $n';
  }

  @override
  String hintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count సూచనలు',
      one: '1 సూచన',
    );
    return '$_temp0';
  }

  @override
  String get tutorialTap => 'ట్యాప్: నింపండి';

  @override
  String get tutorialDoubleTap =>
      'డబుల్ ట్యాప్: X పెట్టండి (X మీద మళ్లీ డబుల్ ట్యాప్: తీసివేయండి)';

  @override
  String get tutorialDrag =>
      'నొక్కి పట్టి జరిపితే ఒకేసారి చాలా గడులు గుర్తించవచ్చు. X గుర్తులు చెరపడానికి డబుల్ ట్యాప్ చేసి ఒక X నుంచి జరపండి.';

  @override
  String get hint => 'సూచన';

  @override
  String get noHintsTitle => 'సూచనలు అయిపోయాయి';

  @override
  String get noHintsBody => '1 సూచన పొందడానికి ఒక చిన్న ప్రకటన చూడండి.';

  @override
  String get noHintsBodyNoAds => 'మీరు అన్ని సూచనలూ వాడేశారు.';

  @override
  String get watchAdForHint => 'ప్రకటన చూడండి: +1 సూచన';

  @override
  String get outOfLivesTitle => 'ప్రాణాలు అయిపోయాయి';

  @override
  String get outOfLivesBody =>
      'మరో 1 ప్రాణం పొందడానికి ప్రకటన చూడండి, లేదా స్థాయిని మళ్లీ మొదలుపెట్టండి.';

  @override
  String get outOfLivesBodyNoAds =>
      'స్థాయిని మళ్లీ మొదలుపెట్టండి, లేదా స్థాయిలకు తిరిగి వెళ్లండి.';

  @override
  String get watchAdForLife => 'ప్రకటన చూడండి: +1 ప్రాణం';

  @override
  String get restart => 'మళ్లీ మొదలుపెట్టండి';

  @override
  String get backToLevels => 'స్థాయిలకు తిరిగి';

  @override
  String get levelComplete => 'అద్భుతం!';

  @override
  String nextLevel(int n) {
    return 'తర్వాత: స్థాయి $n';
  }

  @override
  String get ok => 'సరే';

  @override
  String get allDoneSoon => 'కొత్త స్థాయిలు త్వరలో';

  @override
  String get adLabel => 'ప్రకటన';

  @override
  String get adPlaceholder => 'ఇక్కడ ఒక ప్రకటన చూపబడుతుంది';

  @override
  String get adClose => 'మూసివేయండి';

  @override
  String adCountdown(int seconds) {
    return '$seconds సె';
  }

  @override
  String get rulesTitle => 'ఎలా ఆడాలి?';

  @override
  String get rulesClues =>
      'ఎడమవైపు మరియు పైన ఉన్న సంఖ్యలు ఆ వరుసలో మరియు నిలువు వరుసలో ఎన్ని గడులు నిండి ఉన్నాయో చెబుతాయి. ఎక్కువ సంఖ్యలు ఉంటే, గుంపుల మధ్య కనీసం ఒక ఖాళీ గడి ఉంటుంది.';

  @override
  String get rulesMistakes =>
      'ఖాళీగా ఉండాల్సిన గడిని నింపితే 1 ప్రాణం పోతుంది. X గుర్తులు ఉచితం: మీకు నచ్చినట్లు గుర్తులు పెట్టుకోండి. X ఉన్న గడిని నింపాలంటే ముందు డబుల్ ట్యాప్‌తో X తీసివేయండి.';

  @override
  String get rulesScoring =>
      'ప్రతి సరైన నింపుకు పాయింట్లు వస్తాయి. వరుసగా సరిగ్గా నింపితే గుణకం పెరుగుతుంది (x5 వరకు). వరుసలు, నిలువు వరుసలు పూర్తి చేస్తే బోనస్ పాయింట్లు వస్తాయి.';

  @override
  String levelScore(int score) {
    return '$score పాయింట్లు';
  }

  @override
  String totalScore(int total) {
    return 'మొత్తం: $total';
  }

  @override
  String get rulesGoal =>
      'నిండిన గడులన్నీ కనిపెట్టండి, బ్లాకులు దాగిన చిత్రంగా మారతాయి.';

  @override
  String worldLabel(int n) {
    return 'మ్యాప్ $n';
  }

  @override
  String get worldsTitle => 'మ్యాప్‌లు';

  @override
  String get worldUnlocked => 'కొత్త మ్యాప్ తెరుచుకుంది!';

  @override
  String get worldComplete => 'మ్యాప్ పూర్తయింది!';

  @override
  String nextWorld(String name) {
    return 'తదుపరి మ్యాప్: $name';
  }

  @override
  String nextWorldLocked(String name) {
    return '$name తెరవడానికి ఈ మ్యాప్ పూర్తి చేయండి';
  }

  @override
  String nextWorldSoon(String name) {
    return '$name త్వరలో';
  }

  @override
  String get worldLocked => 'మునుపటి మ్యాప్ పూర్తి చేయండి';

  @override
  String get worldSoon => 'త్వరలో';

  @override
  String get youAreHere => 'మీరు ఇక్కడ ఉన్నారు';

  @override
  String get mapStart => 'ప్రారంభం';

  @override
  String playLevel(int n) {
    return 'ఆడండి · స్థాయి $n';
  }

  @override
  String get tapToContinue => 'కొనసాగడానికి ట్యాప్ చేయండి';

  @override
  String starCount(int have, int max) {
    return '$have/$max';
  }

  @override
  String get settings => 'సెట్టింగ్‌లు';

  @override
  String get settingsSound => 'ధ్వని ప్రభావాలు';

  @override
  String get settingsLanguage => 'భాష';

  @override
  String get settingsLanguageDevice => 'పరికరం భాష';

  @override
  String hintRow(int n) {
    return 'వరుస $n';
  }

  @override
  String hintColumn(int n) {
    return 'నిలువు వరుస $n';
  }

  @override
  String hintFullLine(String line, String clue) {
    return '$line ($clue): గుంపులు, వాటి మధ్య ఒక్కో ఖాళీ కలిసి మొత్తం గీతను నింపుతాయి, కాబట్టి ప్రతి గడి ఖచ్చితం. ఈ గడి నిండి ఉంది!';
  }

  @override
  String hintOverlap(String line, String clue) {
    return '$line ($clue): గుంపులను మొదటికి లేదా చివరికి నెట్టండి: ఈ గడి ఎప్పుడూ ఏదో ఒక గుంపులోనే ఉంటుంది. కాబట్టి ఇది నిండి ఉండాలి!';
  }

  @override
  String hintForcedFill(String line, String clue) {
    return '$line ($clue): మీ దగ్గర ఇప్పటికే ఉన్న గడులు, X లు గుంపులు ఎక్కడ పట్టగలవో పరిమితం చేస్తాయి. సాధ్యమైన ప్రతి అమరికలోనూ ఈ గడి నిండి ఉంది!';
  }

  @override
  String hintForcedEmpty(String line, String clue) {
    return '$line ($clue): ఏ గుంపూ ఈ గడిని చేరలేదు, కాబట్టి ఇది ఖాళీ. ఇక్కడ X పెట్టాం.';
  }

  @override
  String get hintFallback => 'ఈ గడి చిత్రంలో భాగం.';

  @override
  String get tutorialSkip => 'దాటవేయండి';

  @override
  String get tutorialGotIt => 'అర్థమైంది';

  @override
  String tutorialLesson(int lesson, int count) {
    return 'పాఠం $lesson/$count';
  }

  @override
  String get tutorialStart => 'మొదలుపెడదాం!';

  @override
  String get tutorialSkipTitle => 'ట్యుటోరియల్ దాటవేయాలా?';

  @override
  String get tutorialSkipBody =>
      'ఈ స్థాయి పాఠం మాత్రమే దాటవేయాలా, లేక మొత్తం ట్యుటోరియలా?';

  @override
  String get tutorialSkipLevel => 'ఈ స్థాయి మాత్రమే';

  @override
  String get tutorialSkipAll => 'అన్నీ దాటవేయండి';

  @override
  String get tutorialWelcome =>
      'నమస్తే! ప్రతి పజిల్‌లో ఒక చిత్రం దాగి ఉంది. సంఖ్యలు చదివి, సరైన గడులు నింపి, దాన్ని బయటపెట్టండి!';

  @override
  String get tutorialL1Fill =>
      '[5]: ఈ వరుసలో 5 నిండిన గడులు ఉన్నాయి. వరుస కూడా 5 గడులే, కాబట్టి అన్నీ నిండినవే! ఒకదాన్ని ట్యాప్ చేయండి.';

  @override
  String get tutorialL1Drag =>
      'భలే! ఇప్పుడు వేలు ఎత్తకుండా జరిపి వరుసలో మిగతాది నింపండి.';

  @override
  String get tutorialL1Row =>
      'ఈ వరుస కూడా [5]. ఈసారి ఒకే కదలికలో ఒక చివర నుంచి మరో చివరకు జరపండి.';

  @override
  String get tutorialL1AutoCross =>
      'ఈ నిలువు వరుసలోని [2] గడులు దొరికాయి, అందుకే మిగతావాటికి వాటంతట అవే X పడ్డాయి. X అంటే: ఖాళీ.';

  @override
  String get tutorialL1Column =>
      'పైన ఉన్న సంఖ్యలు నిలువు వరుసలకు. ఈ నిలువు వరుస [5]: పై నుంచి కిందికి జరపండి.';

  @override
  String get tutorialL1Count =>
      'ఈ వరుసకు [3] గడులు కావాలి. X ఉన్నవి ఖాళీ, కాబట్టి సరిగ్గా 3 గడులు మిగిలాయి. అన్నీ నింపండి!';

  @override
  String get tutorialL1Finish =>
      'చివరి వరుసను మీరే పూర్తి చేసి చిత్రాన్ని బయటపెట్టండి!';

  @override
  String get tutorialL2Groups =>
      '[2 2]: రెండు వేర్వేరు గుంపులు. 2 నిండినవి, కనీసం 1 ఖాళీ, తర్వాత 2 నిండినవి. 2 + 1 + 2 = 5: సరిగ్గా సరిపోతుంది!';

  @override
  String get tutorialL2Cross =>
      'అంటే మధ్య గడి ఖాళీ. దానిపై డబుల్ ట్యాప్ చేసి X పెట్టండి.';

  @override
  String get tutorialL2Drag =>
      'X కేవలం ఒక గుర్తు, దానికి ఖర్చు లేదు. ఇప్పుడు వరుస మొత్తం జరపండి: X ఉన్న గడి దాటవేయబడుతుంది.';

  @override
  String get tutorialL2CrossSelf =>
      'కింది వరుస కూడా [2 2]. మీ వంతు: ముందు ఖాళీ గడిపై డబుల్ ట్యాప్ చేసి X పెట్టండి.';

  @override
  String get tutorialL2DragSelf => 'ఇప్పుడు జరిపి వరుసను నింపండి.';

  @override
  String get tutorialL2Mistakes =>
      'జాగ్రత్త: తప్పు గడిని నింపితే అది ఎర్ర X అవుతుంది, ఒక గుండె పోతుంది. ఖచ్చితంగా తెలియదా? ముందు X పెట్టండి!';

  @override
  String get tutorialL2Finish =>
      'మిగతాది మీదే! ఇరుక్కుపోతే, ఒక గీతకు ఇంకా ఎన్ని గడులు కావాలో లెక్కించండి.';

  @override
  String get tutorialL3Overlap =>
      'ఈ నిలువు వరుస [4], చోటు 5 గడులు. 4 గడుల బ్లాక్ పూర్తిగా పైన లేదా పూర్తిగా కింద ఉంటుంది. ఏ విధంగా చూసినా మధ్య 3 నిండినవే!';

  @override
  String get tutorialL3OverlapFill =>
      'ఈ ఖచ్చితమైన గడులను నింపండి. ఈ ఉపాయం పేరు ఓవర్‌ల్యాప్: పెద్ద పజిల్స్ రహస్యం!';

  @override
  String get tutorialL3OverlapSelf =>
      'ఈ నిలువు వరుస కూడా [4]. ఖచ్చితమైన గడులను మీరే కనుగొనండి!';

  @override
  String get tutorialL3OverlapRow =>
      'మరి [3]? ఎడమకు జరిపినా కుడికి జరిపినా మధ్య గడి ఎప్పుడూ నిండినదే. దాన్ని నింపండి!';

  @override
  String get tutorialL3Finish =>
      'అద్భుతం! పెద్ద పజిల్స్‌లో ఈ ఉపాయం తరచూ ఉపయోగపడుతుంది. ఇప్పుడు చిత్రాన్ని పూర్తి చేయండి!';

  @override
  String get tutorialL4Ones =>
      'పై మూడు వరుసలు [1 1 1]: మధ్యలో ఖాళీలతో మూడు ఒంటరి గడులు. 1 + 1 + 1 + 1 + 1 = 5: సరిగ్గా సరిపోతాయి!';

  @override
  String get tutorialL4CrossDrag =>
      'కాబట్టి ఈ నిలువు వరుసలోని పై మూడు గడులు ఖాళీ. డబుల్ ట్యాప్ చేసి, రెండో ట్యాప్‌లో వేలు నొక్కిపట్టి కిందికి జరపండి: ఒకేసారి మూడు X లు!';

  @override
  String get tutorialL4CrossDragSelf =>
      'మీ వంతు: ఒక్కసారి జరిపి ఈ నిలువు వరుసలోని మూడు ఖాళీ గడులపై X గీయండి.';

  @override
  String get tutorialL4Erase =>
      'తప్పు X పెట్టారా? దానిపై మళ్లీ డబుల్ ట్యాప్ చేస్తే పోతుంది. X నుంచి డబుల్ ట్యాప్ చేసి జరిపితే దారిలోని X లు చెరిగిపోతాయి.';

  @override
  String get tutorialL4Finish => 'సూపర్! ఇప్పుడు చిత్రాన్ని పూర్తి చేయండి.';

  @override
  String get tutorialL5Gaps =>
      'చివరి పాఠం: X తో పరిష్కరించడం! అంచున ఉన్న నాలుగు నిలువు వరుసలు [2 2]: 2 + 1 + 2 = 5. వాటి ఖాళీలన్నీ మధ్య అడ్డు వరుసలో పడతాయి.';

  @override
  String get tutorialL5CrossDrag =>
      'ఈ ఖాళీ గడులపై X పెట్టండి: డబుల్ ట్యాప్ చేసి, రెండో ట్యాప్‌లో వేలు నొక్కిపట్టి పక్కకు జరపండి: ఒకేసారి రెండు X లు!';

  @override
  String get tutorialL5CrossDragSelf =>
      'మీ వంతు: ఒక్కసారి జరిపి కుడివైపు ఉన్న రెండు ఖాళీ గడులపై X గీయండి.';

  @override
  String get tutorialL5Count =>
      'ఈ అడ్డు వరుస [1], X ల తర్వాత ఒక్క గడి మాత్రమే మిగిలింది. X లతో లెక్కించడం సులువు: దాన్ని నింపండి!';

  @override
  String get tutorialL5Hint =>
      'ఇరుక్కుపోయారా? సూచన నొక్కండి: తర్వాతి అడుగును, దాని కారణాన్ని చూపిస్తుంది.';

  @override
  String get tutorialL5Finish =>
      'మీరు సిద్ధం! పెద్ద గ్రిడ్‌లలో మందపాటి గీతలు ప్రతి 5 గడులను వేరు చేస్తాయి, లెక్కించడం సులువు. చిత్రాన్ని పూర్తి చేయండి!';
}
