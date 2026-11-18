// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swahili (`sw`).
class AppLocalizationsSw extends AppLocalizations {
  AppLocalizationsSw([String locale = 'sw']) : super(locale);

  @override
  String get appTitle => 'BlockPuzzle';

  @override
  String get whoIsPlaying => 'Nani anacheza?';

  @override
  String get newGame => 'Mchezo mpya';

  @override
  String get emptySlot => 'Nafasi tupu';

  @override
  String get yourName => 'Jina lako';

  @override
  String get namePlaceholder => 'Kwa mfano Amani';

  @override
  String get nameRequired => 'Andika jina';

  @override
  String get pickColor => 'Chagua rangi yako';

  @override
  String get start => 'Anza';

  @override
  String get cancel => 'Ghairi';

  @override
  String deleteSlotTitle(String name) {
    return 'Futa $name?';
  }

  @override
  String get deleteSlotBody =>
      'Maendeleo yote ya mchezaji huyu yatafutwa. Hili haliwezi kutenduliwa.';

  @override
  String get delete => 'Futa';

  @override
  String levelLabel(int n) {
    return 'Kiwango $n';
  }

  @override
  String hintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Vidokezo $count',
      one: 'Kidokezo 1',
    );
    return '$_temp0';
  }

  @override
  String get tutorialTap => 'Gusa: jaza';

  @override
  String get tutorialDoubleTap =>
      'Gusa mara mbili: weka X (gusa X mara mbili tena: iondoe)';

  @override
  String get tutorialDrag =>
      'Shikilia na telezesha ili kuweka alama kwenye visanduku vingi kwa mara moja. Gusa mara mbili na telezesha kutoka kwenye X ili kufuta alama za X.';

  @override
  String get hint => 'Kidokezo';

  @override
  String get noHintsTitle => 'Vidokezo vimeisha';

  @override
  String get noHintsBody => 'Tazama tangazo fupi upate kidokezo 1.';

  @override
  String get watchAdForHint => 'Tazama tangazo: +1 kidokezo';

  @override
  String get outOfLivesTitle => 'Maisha yameisha';

  @override
  String get outOfLivesBody =>
      'Tazama tangazo upate maisha 1 zaidi, au anza kiwango upya.';

  @override
  String get watchAdForLife => 'Tazama tangazo: +1 maisha';

  @override
  String get restart => 'Anza upya';

  @override
  String get backToLevels => 'Rudi kwenye viwango';

  @override
  String get levelComplete => 'Safi sana!';

  @override
  String nextLevel(int n) {
    return 'Kinachofuata: Kiwango $n';
  }

  @override
  String get ok => 'Sawa';

  @override
  String get allDoneSoon => 'Viwango vipya vinakuja hivi karibuni';

  @override
  String get adLabel => 'Tangazo';

  @override
  String get adPlaceholder => 'Tangazo litaonyeshwa hapa';

  @override
  String get adClose => 'Funga';

  @override
  String adCountdown(int seconds) {
    return 'Sek $seconds';
  }

  @override
  String get rulesTitle => 'Jinsi ya kucheza?';

  @override
  String get rulesClues =>
      'Namba za kushoto na juu zinaonyesha visanduku vingapi vimejazwa katika safu mlalo na safu wima hiyo. Kukiwa na namba kadhaa, makundi yametenganishwa na angalau kisanduku kimoja kitupu.';

  @override
  String get rulesMistakes =>
      'Kujaza kisanduku kinachopaswa kuwa kitupu kunakugharimu maisha 1. Alama za X ni bure: andika maelezo upendavyo. Ili kujaza kisanduku chenye X, kwanza ondoa X kwa kugusa mara mbili.';

  @override
  String get rulesScoring =>
      'Kila ujazaji sahihi unaleta pointi. Kujaza sahihi mfululizo kunaongeza kizidishi (hadi x5). Kumaliza safu mlalo na wima kunaleta pointi za ziada.';

  @override
  String levelScore(int score) {
    return 'Pointi $score';
  }

  @override
  String totalScore(int total) {
    return 'Jumla: $total';
  }

  @override
  String get rulesGoal =>
      'Tafuta visanduku vyote vilivyojazwa na vitalu vitageuka kuwa picha iliyofichwa.';

  @override
  String worldLabel(int n) {
    return 'Ramani $n';
  }

  @override
  String get worldsTitle => 'Ramani';

  @override
  String get worldUnlocked => 'Ramani mpya imefunguliwa!';

  @override
  String get worldComplete => 'Ramani imekamilika!';

  @override
  String nextWorld(String name) {
    return 'Ramani inayofuata: $name';
  }

  @override
  String nextWorldLocked(String name) {
    return 'Maliza ramani hii ili kufungua $name';
  }

  @override
  String nextWorldSoon(String name) {
    return '$name inakuja hivi karibuni';
  }

  @override
  String get worldLocked => 'Maliza ramani iliyotangulia';

  @override
  String get worldSoon => 'Inakuja hivi karibuni';

  @override
  String get youAreHere => 'Uko hapa';

  @override
  String get mapStart => 'Mwanzo';

  @override
  String playLevel(int n) {
    return 'Cheza · Kiwango $n';
  }

  @override
  String get tapToContinue => 'Gusa ili kuendelea';

  @override
  String starCount(int have, int max) {
    return '$have/$max';
  }

  @override
  String get settings => 'Mipangilio';

  @override
  String get settingsSound => 'Madoido ya sauti';

  @override
  String get settingsLanguage => 'Lugha';

  @override
  String get settingsLanguageDevice => 'Lugha ya kifaa';

  @override
  String hintRow(int n) {
    return 'Safu mlalo $n';
  }

  @override
  String hintColumn(int n) {
    return 'Safu wima $n';
  }

  @override
  String hintFullLine(String line, String clue) {
    return '$line ($clue): makundi pamoja na nafasi moja kati ya kila moja yanajaza mstari mzima, kwa hiyo kila kisanduku kinajulikana. Kisanduku hiki kimejazwa!';
  }

  @override
  String hintOverlap(String line, String clue) {
    return '$line ($clue): sukuma makundi mwanzoni au mwishoni: kisanduku hiki huwa ndani ya kundi kila wakati. Kwa hiyo lazima kijazwe!';
  }

  @override
  String hintForcedFill(String line, String clue) {
    return '$line ($clue): visanduku na alama za X ulizonazo tayari zinapunguza mahali makundi yanapoweza kutoshea. Katika kila mpangilio unaowezekana, kisanduku hiki kimejazwa!';
  }

  @override
  String hintForcedEmpty(String line, String clue) {
    return '$line ($clue): hakuna kundi linaloweza kufika kisanduku hiki, kwa hiyo ni kitupu. Tumeweka X hapa.';
  }

  @override
  String get hintFallback => 'Kisanduku hiki ni sehemu ya picha.';

  @override
  String get tutorialSkip => 'Ruka';

  @override
  String get tutorialGotIt => 'Nimeelewa';

  @override
  String get tutorialL1Fill =>
      'Namba zinaonyesha visanduku vingapi katika safu hiyo vimejazwa. Safu hii inasema 5, kwa hiyo visanduku vyote 5 vimejazwa! Gusa kisanduku ili kukijaza.';

  @override
  String get tutorialL1Drag =>
      'Vizuri! Sasa shikilia kidole chako na telezesha ili kujaza sehemu iliyobaki ya safu.';

  @override
  String get tutorialL1Column =>
      'Safu wima hii pia inasema 5: telezesha kutoka juu hadi chini.';

  @override
  String get tutorialL1Finish =>
      'Safu ikikamilika, visanduku vyake vingine hupata X vyenyewe. Malizia picha iliyobaki mwenyewe!';

  @override
  String get tutorialL2Cross =>
      '2 2 inamaanisha visanduku 2 vilivyojazwa, angalau nafasi moja, kisha visanduku 2 zaidi vilivyojazwa. 2 + nafasi + 2 = 5, kwa hiyo safu ni ya uhakika! Gusa mara mbili kisanduku kitupu ili kuweka X.';

  @override
  String get tutorialL2Drag =>
      'Visanduku vyenye X yako vinarukwa unapotelezesha. Telezesha safu nzima ili kuijaza.';

  @override
  String get tutorialL2Rules =>
      'Kujaza kisanduku kisicho sahihi kunagharimu maisha 1; alama za X ni bure. Ukikwama, kitufe cha Kidokezo pia kinaeleza sababu. Mengine ni juu yako!';
}
