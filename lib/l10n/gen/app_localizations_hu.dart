// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get appTitle => 'Pixel Bloom';

  @override
  String get whoIsPlaying => 'Ki játszik?';

  @override
  String get newGame => 'Új játék';

  @override
  String get emptySlot => 'Üres hely';

  @override
  String get yourName => 'A neved';

  @override
  String get namePlaceholder => 'Például Anna';

  @override
  String get nameRequired => 'Írj be egy nevet';

  @override
  String get start => 'Indítás';

  @override
  String get cancel => 'Mégse';

  @override
  String deleteSlotTitle(String name) {
    return 'Törlöd: $name?';
  }

  @override
  String get deleteSlotBody =>
      'A játékos teljes előrehaladása törlődik. Ez nem vonható vissza.';

  @override
  String get delete => 'Törlés';

  @override
  String levelLabel(int n) {
    return '$n. pálya';
  }

  @override
  String hintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tipp',
    );
    return '$_temp0';
  }

  @override
  String get tutorialTap => 'Koppintás: kitöltés';

  @override
  String get tutorialDoubleTap =>
      'Dupla koppintás: X (dupla koppintás egy X-en: törlés)';

  @override
  String get tutorialDrag =>
      'Tartsd lenyomva és húzd, hogy sok négyzetet jelölj egyszerre. Dupla koppintás után húzd egy X-ről, hogy töröld az X-eket.';

  @override
  String get hint => 'Tipp';

  @override
  String get noHintsTitle => 'Elfogytak a tippek';

  @override
  String get noHintsBody => 'Nézz meg egy rövid hirdetést 1 tippért.';

  @override
  String get noHintsBodyNoAds => 'Elhasználtad az összes tippedet.';

  @override
  String get watchAdForHint => 'Hirdetés: +1 tipp';

  @override
  String get outOfLivesTitle => 'Elfogytak az életek';

  @override
  String get outOfLivesBody =>
      'Nézz meg egy hirdetést +1 életért, vagy kezdd újra a pályát.';

  @override
  String get outOfLivesBodyNoAds =>
      'Kezdd újra a pályát, vagy térj vissza a pályákhoz.';

  @override
  String get watchAdForLife => 'Hirdetés: +1 élet';

  @override
  String get restart => 'Újrakezdés';

  @override
  String get backToLevels => 'Vissza a pályákhoz';

  @override
  String get levelComplete => 'Szuper!';

  @override
  String nextLevel(int n) {
    return 'Következő: $n. pálya';
  }

  @override
  String get ok => 'OK';

  @override
  String get allDoneSoon => 'Hamarosan új pályák';

  @override
  String get adLabel => 'Hirdetés';

  @override
  String get adPlaceholder => 'Itt jelenik meg egy hirdetés';

  @override
  String get adClose => 'Bezárás';

  @override
  String adCountdown(int seconds) {
    return '$seconds mp';
  }

  @override
  String get rulesTitle => 'Hogyan kell játszani?';

  @override
  String get rulesClues =>
      'A bal oldali és felső számok megmutatják, hány kitöltött négyzet van az adott sorban és oszlopban. Ha több szám van, a csoportok között legalább egy üres négyzet van.';

  @override
  String get rulesMistakes =>
      'Ha kitöltesz egy négyzetet, aminek üresnek kell lennie, elveszítesz 1 életet. Az X-ek ingyenesek: jegyzetelj, ahogy szeretnél. Egy X-es négyzet kitöltéséhez előbb dupla koppintással töröld az X-et.';

  @override
  String get rulesScoring =>
      'Minden helyes kitöltés pontot ér. Egymás utáni helyes lépések növelik a szorzót (legfeljebb x5). A befejezett sorok és oszlopok bónuszpontot adnak.';

  @override
  String levelScore(int score) {
    return '$score pont';
  }

  @override
  String totalScore(int total) {
    return 'Összesen: $total';
  }

  @override
  String get rulesGoal =>
      'Találd meg az összes kitöltött négyzetet, és a blokkok rejtett képpé változnak.';

  @override
  String worldLabel(int n) {
    return '$n. térkép';
  }

  @override
  String get worldsTitle => 'Térképek';

  @override
  String get worldUnlocked => 'Új térkép nyílt meg!';

  @override
  String get worldComplete => 'Térkép teljesítve!';

  @override
  String nextWorld(String name) {
    return 'Következő térkép: $name';
  }

  @override
  String nextWorldLocked(String name) {
    return 'Teljesítsd ezt a térképet, és megnyílik: $name';
  }

  @override
  String nextWorldSoon(String name) {
    return 'Hamarosan: $name';
  }

  @override
  String get worldLocked => 'Teljesítsd az előző térképet';

  @override
  String get worldSoon => 'Hamarosan';

  @override
  String get youAreHere => 'Itt vagy';

  @override
  String get mapStart => 'Start';

  @override
  String playLevel(int n) {
    return 'Játék · $n. pálya';
  }

  @override
  String get tapToContinue => 'Koppints a folytatáshoz';

  @override
  String starCount(int have, int max) {
    return '$have/$max';
  }

  @override
  String get settings => 'Beállítások';

  @override
  String get settingsSound => 'Hangeffektusok';

  @override
  String get settingsLanguage => 'Nyelv';

  @override
  String get settingsLanguageDevice => 'Az eszköz nyelve';

  @override
  String hintRow(int n) {
    return '$n. sor';
  }

  @override
  String hintColumn(int n) {
    return '$n. oszlop';
  }

  @override
  String hintFullLine(String line, String clue, String sum, int length) {
    return '$line ($clue): $sum = $length, pont a vonal hossza. A csoportok a köztük lévő egy-egy üres hellyel teljesen kitöltik, minden négyzet helye biztos. Ez a négyzet kitöltött!';
  }

  @override
  String hintOverlap(
    String line,
    String clue,
    int size,
    String early,
    String late,
    String common,
  ) {
    return '$line ($clue): az elejére tolva a(z) $size hosszú blokk a(z) $early. négyzeteket fedi, a végére tolva a(z) $late. négyzeteket. A(z) $common. négyzetek mindkét esetben kitöltöttek, tehát biztosak!';
  }

  @override
  String hintForcedFill(String line, String clue) {
    return '$line ($clue): a már meglévő négyzetek és X-ek leszűkítik, hová férnek a csoportok. Minden lehetséges elrendezésben ez a négyzet kitöltött!';
  }

  @override
  String hintForcedEmpty(String line, String clue) {
    return '$line ($clue): egyik csoport sem éri el ezt a négyzetet, így üres. Ide teszünk egy X-et.';
  }

  @override
  String hintOutOfReach(String line, String clue, String reach, int cell) {
    return '$line ($clue): a csoportok csak ezekig a négyzetekig érnek el: $reach. A(z) $cell. négyzet mindegyiken kívül esik, tehát üres!';
  }

  @override
  String hintBlockDone(String line, String clue, String cells, int size) {
    return '$line ($clue): a szomszédos blokk ($cells) már $size hosszú, akkora, mint az ide férő legnagyobb csoport. A blokk kész, tehát ez a négyzet üres!';
  }

  @override
  String hintTooSmall(String line, String clue, int gap, int size) {
    return '$line ($clue): ez a négyzet X-ek vagy a szél közötti, mindössze $gap hosszú résben van. Még az ide érő legkisebb csoport is $size hosszú, és nem fér el, tehát üres!';
  }

  @override
  String get hintFixedCross => 'Az itteni X-ed hibás volt, ezért levettük.';

  @override
  String get hintFallback => 'Ez a négyzet a kép része.';

  @override
  String get tutorialSkip => 'Kihagyás';

  @override
  String get tutorialGotIt => 'Értem';

  @override
  String tutorialLesson(int lesson, int count) {
    return 'Lecke $lesson/$count';
  }

  @override
  String get tutorialStart => 'Kezdjük!';

  @override
  String get tutorialSkipTitle => 'Kihagyod a bemutatót?';

  @override
  String get tutorialSkipBody =>
      'Csak ennek a pályának a leckéjét hagyod ki, vagy az egész bemutatót?';

  @override
  String get tutorialSkipLevel => 'Csak ezt a pályát';

  @override
  String get tutorialSkipAll => 'Mindet kihagyom';

  @override
  String get tutorialWelcome =>
      'Szia! Minden rejtvényben egy kép lapul. Olvasd a számokat, töltsd ki a jó négyzeteket, és fedd fel!';

  @override
  String get tutorialL1Fill =>
      '[5]: ebben a sorban 5 kitöltött négyzet van. A sor 5 négyzet hosszú, tehát mind kitöltött! Koppints egyre.';

  @override
  String get tutorialL1Drag =>
      'Szuper! Most húzd az ujjad felemelés nélkül, és töltsd ki a sor többi részét.';

  @override
  String get tutorialL1Row =>
      'Ez a sor is [5]. Most húzd végig egy mozdulattal az egyik végétől a másikig.';

  @override
  String get tutorialL1AutoCross =>
      'Az oszlop [2] négyzete megvan, így a többi magától X-et kapott. Az X azt jelenti: üres.';

  @override
  String get tutorialL1Column =>
      'A fenti számok az oszlopokhoz tartoznak. Ez az oszlop [5]: húzd fentről lefelé.';

  @override
  String get tutorialL1Count =>
      'Ennek a sornak [3] négyzet kell. Az X-es négyzetek üresek, így pontosan 3 maradt. Töltsd ki mindet!';

  @override
  String get tutorialL1Finish =>
      'Az utolsó sort fejezd be egyedül, és fedd fel a képet!';

  @override
  String get tutorialL2Groups =>
      '[2 2]: két külön csoport. 2 kitöltött, legalább 1 üres, aztán 2 kitöltött. 2 + 1 + 2 = 5: pont kijön!';

  @override
  String get tutorialL2Cross =>
      'Tehát a középső négyzet üres. Koppints rá kétszer, hogy X-et tegyél.';

  @override
  String get tutorialL2Drag =>
      'Az X csak jegyzet, semmibe sem kerül. Most húzd végig a soron: az X-es négyzetet átugorja.';

  @override
  String get tutorialL2CrossSelf =>
      'Az alatta lévő sor is [2 2]. Te jössz: előbb koppints kétszer az üres négyzetre, hogy X-et tegyél.';

  @override
  String get tutorialL2DragSelf => 'Most húzással töltsd ki a sort.';

  @override
  String get tutorialL2Mistakes =>
      'Vigyázz: ha rossz négyzetet töltesz ki, piros X lesz belőle, és elveszítesz egy szívet. Nem vagy biztos? Előbb tegyél X-et!';

  @override
  String get tutorialL2Finish =>
      'A többi a tiéd! Elakadtál? Számold meg, hány négyzet hiányzik még egy vonalból.';

  @override
  String get tutorialL3Overlap =>
      'Ez az oszlop [4], és 5 négyzetnyi a hely. A 4-es blokk vagy legfelül, vagy legalul áll. Így is, úgy is a középső 3 kitöltött!';

  @override
  String get tutorialL3OverlapFill =>
      'Töltsd ki ezeket a biztos négyzeteket. A trükk neve átfedés: a nagy rejtvények titka!';

  @override
  String get tutorialL3OverlapSelf =>
      'Ez az oszlop is [4]. Keresd meg magad a biztos négyzeteket!';

  @override
  String get tutorialL3OverlapRow =>
      'És a [3]? Akár balra, akár jobbra tolod, a középső négyzet mindig kitöltött. Töltsd ki!';

  @override
  String get tutorialL3Finish =>
      'Remek! Ezt a trükköt sokszor használod majd a nagy rejtvényekben. Most fejezd be a képet!';

  @override
  String get tutorialL4Ones =>
      'A felső három sor [1 1 1]: három különálló négyzet, köztük hézaggal. 1 + 1 + 1 + 1 + 1 = 5: pont kijön!';

  @override
  String get tutorialL4CrossDrag =>
      'Tehát az oszlop felső három négyzete üres. Koppints kétszer, a második koppintásnál tartsd lent az ujjad, és húzd lefelé: három X egyszerre!';

  @override
  String get tutorialL4CrossDragSelf =>
      'Te jössz: egy húzással tegyél X-et az oszlop három üres négyzetére.';

  @override
  String get tutorialL4Erase =>
      'Rossz X? Koppints rá újra kétszer, és eltűnik. Ha X-ről indítva húzol dupla koppintással, letörlöd az útba eső X-eket.';

  @override
  String get tutorialL4Finish => 'Szuper! Most fejezd be a képet.';

  @override
  String get tutorialL5Gaps =>
      'Utolsó lecke: megoldás X-szel! A négy szélső oszlop [2 2]: 2 + 1 + 2 = 5. Minden hézaguk a középső sorba esik.';

  @override
  String get tutorialL5CrossDrag =>
      'Jelöld meg ezeket az üres négyzeteket: koppints kétszer, a második koppintásnál tartsd lent az ujjad, és húzd oldalra: két X egyszerre!';

  @override
  String get tutorialL5CrossDragSelf =>
      'Te jössz: egy húzással tegyél X-et a jobb oldali két üres négyzetre.';

  @override
  String get tutorialL5Count =>
      'Ez a sor [1], és az X-ek után csak egy négyzet maradt. Az X-ekkel könnyű számolni: töltsd ki!';

  @override
  String get tutorialL5Hint =>
      'Elakadtál? Nyomd meg a Tipp gombot: megmutatja a következő lépést, és elmagyarázza, miért.';

  @override
  String get tutorialL5Finish =>
      'Készen állsz! A nagy rácsokon vastag vonalak választják el az 5-ös csoportokat, így könnyű számolni. Fejezd be a képet!';
}
