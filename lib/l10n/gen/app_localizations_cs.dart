// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get appTitle => 'BlockPuzzle';

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
  String get pickColor => 'Vyber si barvu';

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
  String get watchAdForHint => 'Reklama: +1 nápověda';

  @override
  String get outOfLivesTitle => 'Došly životy';

  @override
  String get outOfLivesBody =>
      'Podívej se na reklamu a získej 1 život navíc, nebo začni úroveň znovu.';

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
  String hintFullLine(String line, String clue) {
    return '$line ($clue): skupiny s jednou mezerou mezi sebou vyplní celou čáru, takže každé políčko je jisté. Toto políčko je vyplněné!';
  }

  @override
  String hintOverlap(String line, String clue) {
    return '$line ($clue): posuň skupiny na začátek nebo na konec: toto políčko je vždy uvnitř skupiny. Musí tedy být vyplněné!';
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
  String get hintFallback => 'Toto políčko je součástí obrázku.';

  @override
  String get tutorialSkip => 'Přeskočit';

  @override
  String get tutorialGotIt => 'Rozumím';

  @override
  String get tutorialL1Fill =>
      'Čísla udávají, kolik políček v řádku je vyplněných. Tento řádek říká 5, takže všech 5 políček je vyplněných! Klepnutím políčko vyplníš.';

  @override
  String get tutorialL1Drag =>
      'Výborně! Teď podrž prst a táhni, abys vyplnil zbytek řádku.';

  @override
  String get tutorialL1Column => 'Tento sloupec říká také 5: táhni shora dolů.';

  @override
  String get tutorialL1Finish =>
      'Když je řádek nebo sloupec hotový, ostatní políčka dostanou X sama. Zbytek obrázku dokonči sám!';

  @override
  String get tutorialL2Cross =>
      '2 2 znamená 2 vyplněná políčka, aspoň jednu mezeru a pak další 2 vyplněná políčka. 2 + mezera + 2 = 5, takže řádek je jistý! Dvakrát klepni na prázdné políčko a dej X.';

  @override
  String get tutorialL2Drag =>
      'Políčka s tvým X se při tažení přeskakují. Táhni po celém řádku a vyplň ho.';

  @override
  String get tutorialL2Rules =>
      'Vyplnění špatného políčka stojí 1 život; značky X jsou zdarma. Když se zasekneš, tlačítko Nápověda ti vysvětlí i proč. Zbytek je na tobě!';
}
