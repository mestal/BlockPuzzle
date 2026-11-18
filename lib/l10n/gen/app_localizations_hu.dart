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
  String hintFullLine(String line, String clue) {
    return '$line ($clue): a csoportok a köztük lévő egy-egy hellyel együtt kitöltik az egész vonalat, így minden négyzet biztos. Ez a négyzet kitöltött!';
  }

  @override
  String hintOverlap(String line, String clue) {
    return '$line ($clue): told a csoportokat az elejére vagy a végére: ez a négyzet mindig egy csoporton belül van. Tehát ki kell tölteni!';
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
  String get hintFallback => 'Ez a négyzet a kép része.';

  @override
  String get tutorialSkip => 'Kihagyás';

  @override
  String get tutorialGotIt => 'Értem';

  @override
  String get tutorialL1Fill =>
      'A számok megmutatják, hány négyzet van kitöltve a sorban. Ez a sor 5-öt mond, tehát mind az 5 négyzet kitöltött! Koppints egy négyzetre a kitöltéshez.';

  @override
  String get tutorialL1Drag =>
      'Szuper! Most tartsd lenyomva az ujjad, és húzd végig a sor többi részén.';

  @override
  String get tutorialL1Column =>
      'Ez az oszlop is 5-öt mond: húzd fentről lefelé.';

  @override
  String get tutorialL1Finish =>
      'Ha egy sor vagy oszlop kész, a többi négyzete magától X-et kap. A kép többi részét fejezd be egyedül!';

  @override
  String get tutorialL2Cross =>
      'A 2 2 azt jelenti: 2 kitöltött négyzet, legalább egy hely, majd még 2 kitöltött négyzet. 2 + hely + 2 = 5, tehát a sor biztos! Koppints duplán az üres négyzetre, hogy X-et tegyél.';

  @override
  String get tutorialL2Drag =>
      'A te X-eddel jelölt négyzeteket húzáskor átugorja. Húzd végig az egész soron a kitöltéshez.';

  @override
  String get tutorialL2Rules =>
      'Egy rossz négyzet kitöltése 1 életbe kerül; az X-ek ingyenesek. Ha elakadsz, a Tipp gomb azt is elmagyarázza, miért. A többi rajtad múlik!';
}
