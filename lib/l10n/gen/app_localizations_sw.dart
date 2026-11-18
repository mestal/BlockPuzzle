// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swahili (`sw`).
class AppLocalizationsSw extends AppLocalizations {
  AppLocalizationsSw([String locale = 'sw']) : super(locale);

  @override
  String get appTitle => 'Pixel Bloom';

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
  String get noHintsBodyNoAds => 'Umetumia vidokezo vyako vyote.';

  @override
  String get watchAdForHint => 'Tazama tangazo: +1 kidokezo';

  @override
  String get outOfLivesTitle => 'Maisha yameisha';

  @override
  String get outOfLivesBody =>
      'Tazama tangazo upate maisha 1 zaidi, au anza kiwango upya.';

  @override
  String get outOfLivesBodyNoAds =>
      'Anza kiwango upya, au rudi kwenye viwango.';

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
  String tutorialLesson(int lesson, int count) {
    return 'Somo $lesson/$count';
  }

  @override
  String get tutorialStart => 'Twende!';

  @override
  String get tutorialSkipTitle => 'Ruka mafunzo?';

  @override
  String get tutorialSkipBody =>
      'Ruka somo la kiwango hiki tu, au mafunzo yote?';

  @override
  String get tutorialSkipLevel => 'Kiwango hiki tu';

  @override
  String get tutorialSkipAll => 'Ruka yote';

  @override
  String get tutorialWelcome =>
      'Habari! Kila fumbo lina picha iliyofichwa. Soma namba, jaza visanduku sahihi na uifichue!';

  @override
  String get tutorialL1Fill =>
      '[5]: safu hii ina visanduku 5 vilivyojazwa. Safu ina visanduku 5, kwa hiyo vyote vimejazwa! Gusa kimoja.';

  @override
  String get tutorialL1Drag =>
      'Safi! Sasa telezesha bila kuinua kidole ujaze safu iliyobaki.';

  @override
  String get tutorialL1Row =>
      'Safu hii pia ni [5]. Safari hii telezesha kutoka mwisho hadi mwisho kwa mara moja.';

  @override
  String get tutorialL1AutoCross =>
      'Visanduku [2] vya safu wima hii vimepatikana, kwa hiyo vingine vimepata X vyenyewe. X maana yake: tupu.';

  @override
  String get tutorialL1Column =>
      'Namba za juu ni za safu wima. Safu wima hii ni [5]: telezesha kutoka juu hadi chini.';

  @override
  String get tutorialL1Count =>
      'Safu hii inahitaji visanduku [3]. Vya X ni vitupu, kwa hiyo vimebaki 3 kamili. Vijaze vyote!';

  @override
  String get tutorialL1Finish =>
      'Maliza safu ya mwisho mwenyewe na ufichue picha!';

  @override
  String get tutorialL2Groups =>
      '[2 2]: makundi mawili tofauti. 2 vimejazwa, angalau 1 kitupu, kisha 2 vimejazwa. 2 + 1 + 2 = 5: inatosha kabisa!';

  @override
  String get tutorialL2Cross =>
      'Kwa hiyo kisanduku cha katikati ni kitupu. Kiguse mara mbili kuweka X.';

  @override
  String get tutorialL2Drag =>
      'X ni dokezo tu; haigharimu chochote. Sasa telezesha kwenye safu: kisanduku chenye X kinarukwa.';

  @override
  String get tutorialL2CrossSelf =>
      'Safu ya chini pia ni [2 2]. Zamu yako: kwanza gusa kisanduku kitupu mara mbili kuweka X.';

  @override
  String get tutorialL2DragSelf => 'Sasa telezesha ujaze safu.';

  @override
  String get tutorialL2Mistakes =>
      'Tahadhari: ukijaza kisanduku kisicho sahihi kinakuwa X nyekundu na unapoteza moyo mmoja. Huna uhakika? Weka X kwanza!';

  @override
  String get tutorialL2Finish =>
      'Yaliyobaki ni yako! Umekwama? Hesabu mstari bado unahitaji visanduku vingapi.';

  @override
  String get tutorialL3Overlap =>
      'Safu wima hii ni [4], nafasi ni 5. Kipande cha 4 kiko juu kabisa au chini kabisa. Vyovyote vile, 3 vya katikati vimejazwa!';

  @override
  String get tutorialL3OverlapFill =>
      'Jaza visanduku hivyo vya uhakika. Mbinu hii inaitwa mwingiliano: siri ya mafumbo makubwa!';

  @override
  String get tutorialL3OverlapSelf =>
      'Safu wima hii pia ni [4]. Tafuta visanduku vya uhakika mwenyewe!';

  @override
  String get tutorialL3OverlapRow =>
      'Na [3]? Kikisukumwa kushoto au kulia, kisanduku cha katikati hujazwa daima. Kijaze!';

  @override
  String get tutorialL3Finish =>
      'Hongera! Utatumia mbinu hii mara nyingi kwenye mafumbo makubwa. Sasa maliza picha!';

  @override
  String get tutorialL4Ones =>
      'Safu mbili za juu ni [1 1 1]: visanduku vitatu vya pekee vyenye nafasi kati yake. 1 + 1 + 1 + 1 + 1 = 5: vinatosha kabisa!';

  @override
  String get tutorialL4CrossDrag =>
      'Visanduku hivi viwili ni vitupu. Gusa mara mbili, shikilia kidole kwenye mguso wa pili na telezesha chini: mstari wa X!';

  @override
  String get tutorialL4CrossDragSelf =>
      'Zamu yako: chora X kwenye visanduku viwili vitupu vya safu wima hii.';

  @override
  String get tutorialL4Erase =>
      'X isiyo sahihi? Iguse mara mbili tena itaondoka. Ukitelezesha kwa mguso wa mara mbili kuanzia kwenye X, unafuta X za njiani.';

  @override
  String get tutorialL4Finish => 'Safi sana! Sasa kamilisha picha.';

  @override
  String get tutorialL5Sum =>
      'Somo la mwisho! Safu wima hii ni [3 1]: 3 + 1 + 1 = 5, kwa hiyo ni ya uhakika. Itatue mwenyewe!';

  @override
  String get tutorialL5Hint =>
      'Umekwama? Bonyeza Kidokezo: kinaonyesha hatua inayofuata na sababu yake.';

  @override
  String get tutorialL5Finish =>
      'Uko tayari! Kwenye gridi kubwa, mistari minene hutenganisha kila visanduku 5 ili kuhesabu kuwe rahisi. Maliza picha!';
}
