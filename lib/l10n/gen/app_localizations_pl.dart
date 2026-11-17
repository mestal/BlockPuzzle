// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'BlockPuzzle';

  @override
  String get whoIsPlaying => 'Kto gra?';

  @override
  String get newGame => 'Nowa gra';

  @override
  String get emptySlot => 'Pusty slot';

  @override
  String get yourName => 'Twoje imię';

  @override
  String get namePlaceholder => 'Na przykład Ola';

  @override
  String get nameRequired => 'Wpisz imię';

  @override
  String get pickColor => 'Wybierz kolor';

  @override
  String get start => 'Start';

  @override
  String get cancel => 'Anuluj';

  @override
  String deleteSlotTitle(String name) {
    return 'Usunąć gracza $name?';
  }

  @override
  String get deleteSlotBody =>
      'Cały postęp tego gracza zostanie usunięty. Tej operacji nie można cofnąć.';

  @override
  String get delete => 'Usuń';

  @override
  String levelLabel(int n) {
    return 'Poziom $n';
  }

  @override
  String hintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count podpowiedzi',
      many: '$count podpowiedzi',
      few: '$count podpowiedzi',
      one: '1 podpowiedź',
    );
    return '$_temp0';
  }

  @override
  String get tutorialTap => 'Dotknij: wypełnij';

  @override
  String get tutorialDoubleTap =>
      'Dotknij dwukrotnie: postaw X (dotknij dwukrotnie X, aby go usunąć)';

  @override
  String get tutorialDrag =>
      'Przytrzymaj i przesuń, aby oznaczyć wiele pól naraz. Dotknij dwukrotnie i przesuń od X, aby zmazać znaki X.';

  @override
  String get hint => 'Podpowiedź';

  @override
  String get noHintsTitle => 'Brak podpowiedzi';

  @override
  String get noHintsBody => 'Obejrzyj krótką reklamę, aby dostać 1 podpowiedź.';

  @override
  String get watchAdForHint => 'Obejrzyj reklamę: +1 podpowiedź';

  @override
  String get outOfLivesTitle => 'Brak żyć';

  @override
  String get outOfLivesBody =>
      'Obejrzyj reklamę, aby dostać 1 życie więcej, lub zacznij poziom od nowa.';

  @override
  String get watchAdForLife => 'Obejrzyj reklamę: +1 życie';

  @override
  String get restart => 'Zacznij od nowa';

  @override
  String get backToLevels => 'Wróć do poziomów';

  @override
  String get levelComplete => 'Brawo!';

  @override
  String nextLevel(int n) {
    return 'Dalej: poziom $n';
  }

  @override
  String get ok => 'OK';

  @override
  String get allDoneSoon => 'Nowe poziomy już wkrótce';

  @override
  String get adLabel => 'Reklama';

  @override
  String get adPlaceholder => 'Tutaj pojawi się reklama';

  @override
  String get adClose => 'Zamknij';

  @override
  String adCountdown(int seconds) {
    return '$seconds s';
  }

  @override
  String get rulesTitle => 'Jak grać?';

  @override
  String get rulesClues =>
      'Liczby po lewej i u góry mówią, ile wypełnionych pól jest w danym wierszu i kolumnie. Jeśli liczb jest kilka, między grupami jest co najmniej jedno puste pole.';

  @override
  String get rulesMistakes =>
      'Wypełnienie pola, które powinno być puste, kosztuje 1 życie. Znaki X są darmowe: rób notatki, jak chcesz. Aby wypełnić pole z X, najpierw usuń X dwukrotnym dotknięciem.';

  @override
  String get rulesScoring =>
      'Każde poprawne wypełnienie daje punkty. Poprawne wypełnienia z rzędu zwiększają mnożnik (do x5). Ukończone wiersze i kolumny dają punkty bonusowe.';

  @override
  String levelScore(int score) {
    return '$score pkt';
  }

  @override
  String totalScore(int total) {
    return 'Razem: $total';
  }

  @override
  String get rulesGoal =>
      'Znajdź wszystkie wypełnione pola, a bloki zamienią się w ukryty obrazek.';

  @override
  String worldLabel(int n) {
    return 'Mapa $n';
  }

  @override
  String get worldsTitle => 'Mapy';

  @override
  String get worldUnlocked => 'Nowa mapa odblokowana!';

  @override
  String get worldComplete => 'Mapa ukończona!';

  @override
  String nextWorld(String name) {
    return 'Następna mapa: $name';
  }

  @override
  String nextWorldLocked(String name) {
    return 'Ukończ tę mapę, aby odblokować: $name';
  }

  @override
  String nextWorldSoon(String name) {
    return '$name już wkrótce';
  }

  @override
  String get worldLocked => 'Ukończ poprzednią mapę';

  @override
  String get worldSoon => 'Wkrótce';

  @override
  String get youAreHere => 'Jesteś tutaj';

  @override
  String get mapStart => 'Start';

  @override
  String playLevel(int n) {
    return 'Graj · Poziom $n';
  }

  @override
  String get tapToContinue => 'Dotknij, aby kontynuować';

  @override
  String starCount(int have, int max) {
    return '$have/$max';
  }

  @override
  String get settings => 'Ustawienia';

  @override
  String get settingsSound => 'Efekty dźwiękowe';

  @override
  String get settingsLanguage => 'Język';

  @override
  String get settingsLanguageDevice => 'Język urządzenia';

  @override
  String hintRow(int n) {
    return 'Wiersz $n';
  }

  @override
  String hintColumn(int n) {
    return 'Kolumna $n';
  }

  @override
  String hintFullLine(String line, String clue) {
    return '$line ($clue): grupy razem z jedną przerwą między nimi wypełniają całą linię, więc każde pole jest pewne. To pole jest wypełnione!';
  }

  @override
  String hintOverlap(String line, String clue) {
    return '$line ($clue): przesuń grupy na początek albo na koniec – to pole zawsze jest wewnątrz grupy. Musi więc być wypełnione!';
  }

  @override
  String hintForcedFill(String line, String clue) {
    return '$line ($clue): pola i znaki X, które już masz, zawężają miejsca, gdzie mieszczą się grupy. W każdym możliwym ułożeniu to pole jest wypełnione!';
  }

  @override
  String hintForcedEmpty(String line, String clue) {
    return '$line ($clue): żadna grupa nie sięga tego pola, więc jest puste. Stawiamy tu X.';
  }

  @override
  String get hintFallback => 'To pole jest częścią obrazka.';

  @override
  String get tutorialSkip => 'Pomiń';

  @override
  String get tutorialGotIt => 'Rozumiem';

  @override
  String get tutorialL1Fill =>
      'Liczby mówią, ile pól w danym wierszu jest wypełnionych. Ten wiersz ma 5, więc wszystkie 5 pól jest wypełnionych! Dotknij pola, aby je wypełnić.';

  @override
  String get tutorialL1Drag =>
      'Świetnie! Teraz przytrzymaj palec i przesuń, aby wypełnić resztę wiersza.';

  @override
  String get tutorialL1Column => 'Ta kolumna też ma 5: przesuń z góry na dół.';

  @override
  String get tutorialL1Finish =>
      'Gdy wiersz lub kolumna jest gotowa, pozostałe pola same dostają X. Dokończ resztę obrazka samodzielnie!';

  @override
  String get tutorialL2Cross =>
      '2 2 oznacza 2 wypełnione pola, co najmniej jedną przerwę, a potem jeszcze 2 wypełnione pola. 2 + przerwa + 2 = 5, więc wiersz jest pewny! Dotknij dwukrotnie puste pole, aby postawić X.';

  @override
  String get tutorialL2Drag =>
      'Pola z twoim X są pomijane przy przesuwaniu. Przesuń wzdłuż całego wiersza, aby go wypełnić.';

  @override
  String get tutorialL2Rules =>
      'Wypełnienie złego pola kosztuje 1 życie; znaki X są darmowe. Jeśli utkniesz, przycisk Podpowiedź wyjaśni też dlaczego. Reszta należy do ciebie!';
}
