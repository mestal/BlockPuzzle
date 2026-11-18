// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Filipino Pilipino (`fil`).
class AppLocalizationsFil extends AppLocalizations {
  AppLocalizationsFil([String locale = 'fil']) : super(locale);

  @override
  String get appTitle => 'Pixel Bloom';

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
  String get noHintsBodyNoAds => 'Nagamit mo na ang lahat ng pahiwatig mo.';

  @override
  String get watchAdForHint => 'Manood ng ad: +1 pahiwatig';

  @override
  String get outOfLivesTitle => 'Ubos na ang buhay';

  @override
  String get outOfLivesBody =>
      'Manood ng ad para sa 1 pang buhay, o simulan muli ang level.';

  @override
  String get outOfLivesBodyNoAds =>
      'Simulan muli ang level, o bumalik sa mga level.';

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
  String tutorialLesson(int lesson, int count) {
    return 'Aralin $lesson/$count';
  }

  @override
  String get tutorialStart => 'Tara na!';

  @override
  String get tutorialSkipTitle => 'Laktawan ang tutorial?';

  @override
  String get tutorialSkipBody =>
      'Laktawan lang ang aralin ng level na ito, o ang buong tutorial?';

  @override
  String get tutorialSkipLevel => 'Itong level lang';

  @override
  String get tutorialSkipAll => 'Laktawan lahat';

  @override
  String get tutorialWelcome =>
      'Hi! May nakatagong larawan sa bawat puzzle. Basahin ang mga numero, punan ang tamang kahon at ilabas ito!';

  @override
  String get tutorialL1Fill =>
      '[5]: may 5 punong kahon ang hilerang ito. 5 kahon din ang haba ng hilera, kaya puno lahat! I-tap ang isa.';

  @override
  String get tutorialL1Drag =>
      'Galing! Ngayon i-slide nang hindi inaangat ang daliri para punan ang natitirang hilera.';

  @override
  String get tutorialL1Row =>
      '[5] din ang hilerang ito. Ngayon, i-slide mula dulo hanggang dulo nang isang tuluy-tuloy.';

  @override
  String get tutorialL1AutoCross =>
      'Nahanap na ang [2] kahon ng kolum na ito, kaya kusang nagka-X ang iba. Ang X ay nangangahulugang: bakante.';

  @override
  String get tutorialL1Column =>
      'Para sa mga kolum ang mga numero sa itaas. [5] ang kolum na ito: i-slide mula itaas pababa.';

  @override
  String get tutorialL1Count =>
      'Kailangan ng hilerang ito ng [3] kahon. Bakante ang mga may X, kaya eksaktong 3 kahon ang natira. Punan lahat!';

  @override
  String get tutorialL1Finish =>
      'Ikaw na ang tumapos sa huling hilera at ilabas ang larawan!';

  @override
  String get tutorialL2Groups =>
      '[2 2]: dalawang magkahiwalay na grupo. 2 puno, kahit 1 bakante, saka 2 puno. 2 + 1 + 2 = 5: saktong-sakto!';

  @override
  String get tutorialL2Cross =>
      'Kaya bakante ang kahon sa gitna. I-double tap ito para lagyan ng X.';

  @override
  String get tutorialL2Drag =>
      'Tala lang ang X; walang bayad ito. Ngayon i-slide sa buong hilera: nilalaktawan ang may X.';

  @override
  String get tutorialL2CrossSelf =>
      '[2 2] din ang hilera sa ibaba. Ikaw naman: lagyan muna ng X ang bakanteng kahon.';

  @override
  String get tutorialL2DragSelf => 'Ngayon i-slide para punan ang hilera.';

  @override
  String get tutorialL2Mistakes =>
      'Ingat: kapag maling kahon ang pinunan mo, nagiging pulang X ito at mababawasan ka ng isang puso. Di sigurado? Mag-X muna!';

  @override
  String get tutorialL2Finish =>
      'Sa iyo na ang natitira! Naipit? Bilangin kung ilang kahon pa ang kailangan ng isang linya.';

  @override
  String get tutorialL3Overlap =>
      '[4] ang kolum na ito, at 5 ang espasyo. Ang bloke ng 4 ay nasa pinakaitaas o nasa pinakaibaba. Alinman doon, puno ang 3 sa gitna!';

  @override
  String get tutorialL3OverlapFill =>
      'Punan ang mga siguradong kahon. Overlap ang tawag sa teknik na ito: ang sikreto ng malalaking puzzle!';

  @override
  String get tutorialL3OverlapSelf =>
      '[4] din ang kolum na ito. Ikaw na ang humanap ng mga siguradong kahon!';

  @override
  String get tutorialL3OverlapRow =>
      'E ang [3]? Itulak man pakaliwa o pakanan, laging puno ang kahon sa gitna. Punan ito!';

  @override
  String get tutorialL3Finish =>
      'Ang galing! Madalas mong gagamitin ang teknik na ito sa malalaking puzzle. Ngayon tapusin ang larawan!';

  @override
  String get tutorialL4Ones =>
      'Ang dalawang hilera sa itaas ay [1 1 1]: tatlong solong kahon na may puwang sa pagitan. 1 + 1 + 1 + 1 + 1 = 5: saktong-sakto!';

  @override
  String get tutorialL4CrossDrag =>
      'Bakante ang dalawang kahong ito. Mag-double tap, idiin ang daliri sa ikalawang tap at i-slide pababa: isang linya ng X!';

  @override
  String get tutorialL4CrossDragSelf =>
      'Ikaw naman: gumuhit ng X sa dalawang bakanteng kahon ng kolum na ito.';

  @override
  String get tutorialL4Erase =>
      'Maling X? I-double tap ulit para mawala. Ang double-tap na slide na nagsisimula sa X ay nagbubura ng mga X na madaanan.';

  @override
  String get tutorialL4Finish => 'Ayos! Ngayon kumpletuhin ang larawan.';

  @override
  String get tutorialL5Sum =>
      'Huling aralin! [3 1] ang kolum na ito: 3 + 1 + 1 = 5, kaya sigurado na. Ikaw ang lumutas!';

  @override
  String get tutorialL5Hint =>
      'Naipit? Pindutin ang Pahiwatig: ipinapakita nito ang susunod na hakbang at kung bakit.';

  @override
  String get tutorialL5Finish =>
      'Handa ka na! Sa malalaking grid, hinahati ng makakapal na linya ang bawat 5 kahon para madaling magbilang. Tapusin ang larawan!';
}
