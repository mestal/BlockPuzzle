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
  String get pickColor => 'మీ రంగు ఎంచుకోండి';

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
  String get watchAdForHint => 'ప్రకటన చూడండి: +1 సూచన';

  @override
  String get outOfLivesTitle => 'ప్రాణాలు అయిపోయాయి';

  @override
  String get outOfLivesBody =>
      'మరో 1 ప్రాణం పొందడానికి ప్రకటన చూడండి, లేదా స్థాయిని మళ్లీ మొదలుపెట్టండి.';

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
  String get tutorialL1Fill =>
      'ఆ వరుసలో ఎన్ని గడులు నిండి ఉన్నాయో సంఖ్యలు చెబుతాయి. ఈ వరుస 5 అంటోంది, కాబట్టి 5 గడులూ నిండి ఉన్నాయి! గడిని నింపడానికి దాన్ని ట్యాప్ చేయండి.';

  @override
  String get tutorialL1Drag =>
      'బాగుంది! ఇప్పుడు వేలిని నొక్కి పట్టి జరిపి వరుసలో మిగతాది నింపండి.';

  @override
  String get tutorialL1Column =>
      'ఈ నిలువు వరుస కూడా 5 అంటోంది: పై నుంచి కిందికి జరపండి.';

  @override
  String get tutorialL1Finish =>
      'ఒక వరుస లేదా నిలువు వరుస పూర్తయితే, మిగతా గడులకు వాటంతట అవే X పడతాయి. మిగతా చిత్రాన్ని మీరే పూర్తి చేయండి!';

  @override
  String get tutorialL2Cross =>
      '2 2 అంటే 2 నిండిన గడులు, కనీసం ఒక ఖాళీ, తర్వాత మరో 2 నిండిన గడులు. 2 + ఖాళీ + 2 = 5, కాబట్టి వరుస ఖచ్చితం! X పెట్టడానికి ఖాళీ గడిపై డబుల్ ట్యాప్ చేయండి.';

  @override
  String get tutorialL2Drag =>
      'జరిపేటప్పుడు మీ X ఉన్న గడులు దాటవేయబడతాయి. వరుస మొత్తం జరిపి దాన్ని నింపండి.';

  @override
  String get tutorialL2Rules =>
      'తప్పు గడిని నింపితే 1 ప్రాణం పోతుంది; X గుర్తులు ఉచితం. ఇరుక్కుపోతే సూచన బటన్ కారణం కూడా వివరిస్తుంది. మిగతాది మీ చేతుల్లో!';
}
