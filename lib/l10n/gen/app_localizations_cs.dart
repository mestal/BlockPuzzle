// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get appTitle => 'Pixel Bloom';

  @override
  String get whoIsPlaying => 'Kdo hraje?';

  @override
  String get newGame => 'Nová hra';

  @override
  String get emptySlot => 'Volný slot';

  @override
  String get yourName => 'Tvoje jméno';

  @override
  String get namePlaceholder => 'Například Tereza';

  @override
  String get nameRequired => 'Napiš jméno';

  @override
  String get start => 'Začít';

  @override
  String get cancel => 'Zrušit';

  @override
  String deleteSlotTitle(String name) {
    return 'Smazat $name?';
  }

  @override
  String get deleteSlotBody =>
      'Veškerý postup tohoto hráče bude smazán. Tuto akci nelze vrátit.';

  @override
  String get delete => 'Smazat';

  @override
  String levelLabel(int n) {
    return 'Úroveň $n';
  }

  @override
  String hintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nápověd',
      many: '$count nápovědy',
      few: '$count nápovědy',
      one: '1 nápověda',
    );
    return '$_temp0';
  }

  @override
  String get tutorialTap => 'Klepnutí: vyplnit';

  @override
  String get tutorialDoubleTap =>
      'Dvojí klepnutí: dát X (znovu dvakrát klepni na X: odstranit)';

  @override
  String get tutorialDrag =>
      'Podrž a táhni, abys označil více políček najednou. Dvakrát klepni a táhni od X, abys smazal značky X.';

  @override
  String get hint => 'Nápověda';

  @override
  String get noHintsTitle => 'Došly nápovědy';

  @override
  String get noHintsBody =>
      'Podívej se na krátkou reklamu a získej 1 nápovědu.';

  @override
  String get noHintsBodyNoAds => 'Využil jsi všechny nápovědy.';

  @override
  String get watchAdForHint => 'Reklama: +1 nápověda';

  @override
  String get outOfLivesTitle => 'Došly životy';

  @override
  String get outOfLivesBody =>
      'Podívej se na reklamu a získej 1 život navíc, nebo začni úroveň znovu.';

  @override
  String get outOfLivesBodyNoAds =>
      'Začni úroveň znovu, nebo se vrať na úrovně.';

  @override
  String get watchAdForLife => 'Reklama: +1 život';

  @override
  String get restart => 'Začít znovu';

  @override
  String get backToLevels => 'Zpět na úrovně';

  @override
  String get levelComplete => 'Skvělé!';

  @override
  String nextLevel(int n) {
    return 'Další: úroveň $n';
  }

  @override
  String get ok => 'OK';

  @override
  String get allDoneSoon => 'Nové úrovně již brzy';

  @override
  String get adLabel => 'Reklama';

  @override
  String get adPlaceholder => 'Zde se zobrazí reklama';

  @override
  String get adClose => 'Zavřít';

  @override
  String adCountdown(int seconds) {
    return '$seconds s';
  }

  @override
  String get rulesTitle => 'Jak hrát?';

  @override
  String get rulesClues =>
      'Čísla vlevo a nahoře udávají, kolik vyplněných políček je v daném řádku a sloupci. Je-li čísel více, mezi skupinami je aspoň jedno prázdné políčko.';

  @override
  String get rulesMistakes =>
      'Vyplnění políčka, které má zůstat prázdné, stojí 1 život. Značky X jsou zdarma: dělej si poznámky, jak chceš. Chceš-li vyplnit políčko s X, nejdřív X odstraň dvojím klepnutím.';

  @override
  String get rulesScoring =>
      'Každé správné vyplnění přináší body. Správné tahy za sebou zvyšují násobič (až na x5). Dokončené řádky a sloupce dávají bonusové body.';

  @override
  String levelScore(int score) {
    return '$score bodů';
  }

  @override
  String totalScore(int total) {
    return 'Celkem: $total';
  }

  @override
  String get rulesGoal =>
      'Najdi všechna vyplněná políčka a bloky se promění ve skrytý obrázek.';

  @override
  String worldLabel(int n) {
    return 'Mapa $n';
  }

  @override
  String get worldsTitle => 'Mapy';

  @override
  String get worldUnlocked => 'Nová mapa odemčena!';

  @override
  String get worldComplete => 'Mapa dokončena!';

  @override
  String nextWorld(String name) {
    return 'Další mapa: $name';
  }

  @override
  String nextWorldLocked(String name) {
    return 'Dokonči tuto mapu a odemkni $name';
  }

  @override
  String nextWorldSoon(String name) {
    return '$name již brzy';
  }

  @override
  String get worldLocked => 'Dokonči předchozí mapu';

  @override
  String get worldSoon => 'Již brzy';

  @override
  String get youAreHere => 'Jsi tady';

  @override
  String get mapStart => 'Start';

  @override
  String playLevel(int n) {
    return 'Hrát · Úroveň $n';
  }

  @override
  String get tapToContinue => 'Klepni pro pokračování';

  @override
  String starCount(int have, int max) {
    return '$have/$max';
  }

  @override
  String get settings => 'Nastavení';

  @override
  String get settingsSound => 'Zvukové efekty';

  @override
  String get settingsLanguage => 'Jazyk';

  @override
  String get settingsLanguageDevice => 'Jazyk zařízení';

  @override
  String hintRow(int n) {
    return 'Řádek $n';
  }

  @override
  String hintColumn(int n) {
    return 'Sloupec $n';
  }

  @override
  String hintFullLine(String line, String clue, String sum, int length) {
    return '$line ($clue): $sum = $length, přesně délka řady. Skupiny s jednou mezerou mezi sebou ji zaplní celou, každé políčko má pevné místo. Toto políčko je vyplněné!';
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
    return '$line ($clue): posunutý na začátek zabírá blok délky $size políčka $early, posunutý na konec políčka $late. Políčka $common jsou vyplněná v obou případech, takže jsou jistá!';
  }

  @override
  String hintForcedFill(String line, String clue) {
    return '$line ($clue): políčka a značky X, které už máš, omezují, kam se skupiny vejdou. V každém možném rozložení je toto políčko vyplněné!';
  }

  @override
  String hintForcedEmpty(String line, String clue) {
    return '$line ($clue): žádná skupina na toto políčko nedosáhne, takže je prázdné. Dáme sem X.';
  }

  @override
  String hintOutOfReach(String line, String clue, String reach, int cell) {
    return '$line ($clue): skupiny dosáhnou jen na tato políčka: $reach. Políčko $cell leží mimo všechna, takže je prázdné!';
  }

  @override
  String hintBlockDone(String line, String clue, String cells, int size) {
    return '$line ($clue): vedlejší blok ($cells) má už délku $size, stejnou jako největší skupina, která se sem vejde. Blok je hotový, takže toto políčko je prázdné!';
  }

  @override
  String hintTooSmall(String line, String clue, int gap, int size) {
    return '$line ($clue): toto políčko leží v mezeře délky jen $gap mezi X nebo okrajem. I nejmenší skupina, která sem dosáhne, má délku $size a nevejde se, takže je prázdné!';
  }

  @override
  String get hintFixedCross =>
      'Tvoje X tu bylo špatně, tak jsme ho odstranili.';

  @override
  String get hintFallback => 'Toto políčko je součástí obrázku.';

  @override
  String get tutorialSkip => 'Přeskočit';

  @override
  String get tutorialGotIt => 'Rozumím';

  @override
  String tutorialLesson(int lesson, int count) {
    return 'Lekce $lesson/$count';
  }

  @override
  String get tutorialStart => 'Jdeme na to!';

  @override
  String get tutorialSkipTitle => 'Přeskočit výuku?';

  @override
  String get tutorialSkipBody =>
      'Přeskočit jen lekci této úrovně, nebo celou výuku?';

  @override
  String get tutorialSkipLevel => 'Jen tuto úroveň';

  @override
  String get tutorialSkipAll => 'Přeskočit vše';

  @override
  String get tutorialWelcome =>
      'Ahoj! V každé hádance je ukrytý obrázek. Čti čísla, vyplňuj správná políčka a odhal ho!';

  @override
  String get tutorialL1Fill =>
      '[5]: tento řádek má 5 vyplněných políček. Řádek má 5 políček, takže jsou vyplněná všechna! Klepni na jedno.';

  @override
  String get tutorialL1Drag =>
      'Super! Teď táhni bez zvednutí prstu a vyplň zbytek řádku.';

  @override
  String get tutorialL1Row =>
      'I tento řádek je [5]. Tentokrát táhni od kraje ke kraji jedním tahem.';

  @override
  String get tutorialL1AutoCross =>
      'Obě [2] políčka sloupce jsou nalezena, takže zbytek dostal X sám. X znamená: prázdné.';

  @override
  String get tutorialL1Column =>
      'Čísla nahoře patří sloupcům. Tento sloupec je [5]: táhni shora dolů.';

  @override
  String get tutorialL1Count =>
      'Tento řádek potřebuje [3] políčka. Políčka s X jsou prázdná, takže zbývají přesně 3. Vyplň je všechna!';

  @override
  String get tutorialL1Finish => 'Dokonči poslední řádek sám a odhal obrázek!';

  @override
  String get tutorialL2Groups =>
      '[2 2]: dvě oddělené skupiny. 2 vyplněná, aspoň 1 prázdné, pak 2 vyplněná. 2 + 1 + 2 = 5: sedí přesně!';

  @override
  String get tutorialL2Cross =>
      'Prostřední políčko je tedy prázdné. Dvojím klepnutím na něj dej X.';

  @override
  String get tutorialL2Drag =>
      'X je jen poznámka a nic nestojí. Teď táhni přes řádek: políčko s X se přeskočí.';

  @override
  String get tutorialL2CrossSelf =>
      'Řádek pod ním je taky [2 2]. Jsi na řadě: nejdřív dvojím klepnutím dej X na prázdné políčko.';

  @override
  String get tutorialL2DragSelf => 'Teď táhni a vyplň řádek.';

  @override
  String get tutorialL2Mistakes =>
      'Pozor: vyplnění špatného políčka z něj udělá červené X a stojí srdíčko. Nejsi si jistý? Dej nejdřív X!';

  @override
  String get tutorialL2Finish =>
      'Zbytek je na tobě! Zasekl ses? Spočítej, kolik políček ještě linii chybí.';

  @override
  String get tutorialL3Overlap =>
      'Tento sloupec je [4] a místa je na 5. Blok 4 políček je buď úplně nahoře, nebo úplně dole. Tak či tak jsou prostřední 3 vyplněná!';

  @override
  String get tutorialL3OverlapFill =>
      'Vyplň tato jistá políčka. Ten trik se jmenuje překryv: tajemství velkých hádanek!';

  @override
  String get tutorialL3OverlapSelf =>
      'I tento sloupec je [4]. Najdi jistá políčka sám!';

  @override
  String get tutorialL3OverlapRow =>
      'A [3]? Ať je posunutý doleva, nebo doprava, prostřední políčko je vždy vyplněné. Vyplň ho!';

  @override
  String get tutorialL3Finish =>
      'Skvělé! Tenhle trik ve velkých hádankách často využiješ. Teď dokonči obrázek!';

  @override
  String get tutorialL4Ones =>
      'Horní tři řádky jsou [1 1 1]: tři samostatná políčka s mezerami. 1 + 1 + 1 + 1 + 1 = 5: sedí přesně!';

  @override
  String get tutorialL4CrossDrag =>
      'Takže horní tři políčka tohoto sloupce jsou prázdná. Klepni dvakrát, při druhém klepnutí nech prst dole a táhni dolů: tři X najednou!';

  @override
  String get tutorialL4CrossDragSelf =>
      'Jsi na řadě: jedním tahem nakresli X na tři prázdná políčka tohoto sloupce.';

  @override
  String get tutorialL4Erase =>
      'Špatné X? Klepni na něj znovu dvakrát a zmizí. Tah dvojím klepnutím začatý na X maže X po cestě.';

  @override
  String get tutorialL4Finish => 'Super! Teď dokonči obrázek.';

  @override
  String get tutorialL5Gaps =>
      'Poslední lekce: řešení pomocí X! Čtyři krajní sloupce jsou [2 2]: 2 + 1 + 2 = 5. Všechny jejich mezery padnou na prostřední řádek.';

  @override
  String get tutorialL5CrossDrag =>
      'Označ tato prázdná políčka: klepni dvakrát, při druhém klepnutí nech prst dole a táhni do strany: dvě X najednou!';

  @override
  String get tutorialL5CrossDragSelf =>
      'Jsi na řadě: jedním tahem nakresli X na dvě prázdná políčka vpravo.';

  @override
  String get tutorialL5Count =>
      'Tento řádek je [1] a po X zbylo jen jedno políčko. S X se snadno počítá: vyplň ho!';

  @override
  String get tutorialL5Hint =>
      'Zasekl ses? Stiskni Nápověda: ukáže další krok a vysvětlí proč.';

  @override
  String get tutorialL5Finish =>
      'Jsi připraven! Ve velkých mřížkách dělí silné čáry políčka po 5, takže se snadno počítá. Dokonči obrázek!';
}
