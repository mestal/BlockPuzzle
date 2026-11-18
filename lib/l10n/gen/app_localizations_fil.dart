// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Filipino Pilipino (`fil`).
class AppLocalizationsFil extends AppLocalizations {
  AppLocalizationsFil([String locale = 'fil']) : super(locale);

  @override
  String get appTitle => 'BlockPuzzle';

  @override
  String get whoIsPlaying => 'Sino ang maglalaro?';

  @override
  String get newGame => 'Bagong laro';

  @override
  String get emptySlot => 'Bakanteng slot';

  @override
  String get yourName => 'Pangalan mo';

  @override
  String get namePlaceholder => 'Halimbawa: Maria';

  @override
  String get nameRequired => 'Maglagay ng pangalan';

  @override
  String get pickColor => 'Pumili ng kulay mo';

  @override
  String get start => 'Simulan';

  @override
  String get cancel => 'Kanselahin';

  @override
  String deleteSlotTitle(String name) {
    return 'Burahin si $name?';
  }

  @override
  String get deleteSlotBody =>
      'Mabubura ang lahat ng progreso ng manlalarong ito. Hindi na ito maibabalik.';

  @override
  String get delete => 'Burahin';

  @override
  String levelLabel(int n) {
    return 'Level $n';
  }

  @override
  String hintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pahiwatig',
      one: '$count pahiwatig',
    );
    return '$_temp0';
  }

  @override
  String get tutorialTap => 'I-tap: punan';

  @override
  String get tutorialDoubleTap =>
      'I-double tap: maglagay ng X (i-double tap muli ang X: alisin ito)';

  @override
  String get tutorialDrag =>
      'Pindutin nang matagal at i-slide para markahan ang maraming kahon nang sabay. I-double tap at i-slide mula sa isang X para burahin ang mga X.';

  @override
  String get hint => 'Pahiwatig';

  @override
  String get noHintsTitle => 'Wala nang pahiwatig';

  @override
  String get noHintsBody =>
      'Manood ng maikling ad para makakuha ng 1 pahiwatig.';

  @override
  String get watchAdForHint => 'Manood ng ad: +1 pahiwatig';

  @override
  String get outOfLivesTitle => 'Ubos na ang buhay';

  @override
  String get outOfLivesBody =>
      'Manood ng ad para sa 1 pang buhay, o simulan muli ang level.';

  @override
  String get watchAdForLife => 'Manood ng ad: +1 buhay';

  @override
  String get restart => 'Magsimula muli';

  @override
  String get backToLevels => 'Bumalik sa mga level';

  @override
  String get levelComplete => 'Galing!';

  @override
  String nextLevel(int n) {
    return 'Susunod: Level $n';
  }

  @override
  String get ok => 'OK';

  @override
  String get allDoneSoon => 'May mga bagong level na paparating';

  @override
  String get adLabel => 'Ad';

  @override
  String get adPlaceholder => 'Dito ipapakita ang isang ad';

  @override
  String get adClose => 'Isara';

  @override
  String adCountdown(int seconds) {
    return '$seconds s';
  }

  @override
  String get rulesTitle => 'Paano maglaro?';

  @override
  String get rulesClues =>
      'Ipinapakita ng mga numero sa kaliwa at itaas kung ilang punong kahon ang nasa hilera at kolum na iyon. Kung marami ang numero, may kahit isang bakanteng kahon sa pagitan ng mga grupo.';

  @override
  String get rulesMistakes =>
      'Kapag pinunan mo ang kahon na dapat ay bakante, mababawasan ka ng 1 buhay. Libre ang mga X: magtala ayon sa gusto mo. Para punan ang kahon na may X, alisin muna ang X sa pamamagitan ng double tap.';

  @override
  String get rulesScoring =>
      'Bawat tamang pagpuno ay may puntos. Ang sunod-sunod na tamang pagpuno ay nagpapalaki ng multiplier (hanggang x5). Ang mga natapos na hilera at kolum ay may bonus na puntos.';

  @override
  String levelScore(int score) {
    return '$score puntos';
  }

  @override
  String totalScore(int total) {
    return 'Kabuuan: $total';
  }

  @override
  String get rulesGoal =>
      'Hanapin ang lahat ng punong kahon at magiging nakatagong larawan ang mga bloke.';

  @override
  String worldLabel(int n) {
    return 'Mapa $n';
  }

  @override
  String get worldsTitle => 'Mga Mapa';

  @override
  String get worldUnlocked => 'May bagong mapa na bukas!';

  @override
  String get worldComplete => 'Tapos na ang mapa!';

  @override
  String nextWorld(String name) {
    return 'Susunod na mapa: $name';
  }

  @override
  String nextWorldLocked(String name) {
    return 'Tapusin ang mapang ito para mabuksan ang $name';
  }

  @override
  String nextWorldSoon(String name) {
    return 'Paparating na ang $name';
  }

  @override
  String get worldLocked => 'Tapusin ang naunang mapa';

  @override
  String get worldSoon => 'Paparating na';

  @override
  String get youAreHere => 'Narito ka';

  @override
  String get mapStart => 'Simula';

  @override
  String playLevel(int n) {
    return 'Maglaro · Level $n';
  }

  @override
  String get tapToContinue => 'I-tap para magpatuloy';

  @override
  String starCount(int have, int max) {
    return '$have/$max';
  }

  @override
  String get settings => 'Mga Setting';

  @override
  String get settingsSound => 'Mga sound effect';

  @override
  String get settingsLanguage => 'Wika';

  @override
  String get settingsLanguageDevice => 'Wika ng device';

  @override
  String hintRow(int n) {
    return 'Hilera $n';
  }

  @override
  String hintColumn(int n) {
    return 'Kolum $n';
  }

  @override
  String hintFullLine(String line, String clue) {
    return '$line ($clue): pinupuno ng mga grupo at ng isang puwang sa pagitan ng bawat isa ang buong linya, kaya tiyak ang bawat kahon. Puno ang kahong ito!';
  }

  @override
  String hintOverlap(String line, String clue) {
    return '$line ($clue): itulak ang mga grupo sa simula o sa dulo: laging nasa loob ng isang grupo ang kahong ito. Kaya dapat itong punan!';
  }

  @override
  String hintForcedFill(String line, String clue) {
    return '$line ($clue): pinapaliit ng mga kahon at X na mayroon ka na kung saan kakasya ang mga grupo. Sa bawat posibleng ayos, puno ang kahong ito!';
  }

  @override
  String hintForcedEmpty(String line, String clue) {
    return '$line ($clue): walang grupong aabot sa kahong ito, kaya bakante ito. Naglagay kami ng X dito.';
  }

  @override
  String get hintFallback => 'Bahagi ng larawan ang kahong ito.';

  @override
  String get tutorialSkip => 'Laktawan';

  @override
  String get tutorialGotIt => 'Gets ko';

  @override
  String get tutorialL1Fill =>
      'Ipinapakita ng mga numero kung ilang kahon sa hilerang iyon ang puno. 5 ang sinasabi ng hilerang ito, kaya puno ang lahat ng 5 kahon! I-tap ang isang kahon para punan ito.';

  @override
  String get tutorialL1Drag =>
      'Magaling! Ngayon, idiin ang daliri mo at i-slide para punan ang natitirang bahagi ng hilera.';

  @override
  String get tutorialL1Column =>
      '5 din ang sinasabi ng kolum na ito: i-slide mula itaas pababa.';

  @override
  String get tutorialL1Finish =>
      'Kapag tapos na ang isang hilera o kolum, kusang nagkakaroon ng X ang iba pang kahon nito. Ikaw na ang tumapos sa natitirang larawan!';

  @override
  String get tutorialL2Cross =>
      'Ang 2 2 ay 2 punong kahon, kahit isang puwang, at 2 pang punong kahon. 2 + puwang + 2 = 5, kaya tiyak ang hilera! I-double tap ang bakanteng kahon para maglagay ng X.';

  @override
  String get tutorialL2Drag =>
      'Nilalaktawan ang mga kahon na may X mo kapag nag-slide ka. I-slide sa buong hilera para punan ito.';

  @override
  String get tutorialL2Rules =>
      'Ang pagpuno sa maling kahon ay may bawas na 1 buhay; libre ang mga X. Kapag naipit ka, ipinapaliwanag din ng button na Pahiwatig kung bakit. Ikaw na ang bahala sa iba!';
}
