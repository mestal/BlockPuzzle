// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Pixel Bloom';

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
  String get noHintsBodyNoAds => 'Wykorzystałeś wszystkie podpowiedzi.';

  @override
  String get watchAdForHint => 'Obejrzyj reklamę: +1 podpowiedź';

  @override
  String get outOfLivesTitle => 'Brak żyć';

  @override
  String get outOfLivesBody =>
      'Obejrzyj reklamę, aby dostać 1 życie więcej, lub zacznij poziom od nowa.';

  @override
  String get outOfLivesBodyNoAds =>
      'Zacznij poziom od nowa albo wróć do poziomów.';

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
  String tutorialLesson(int lesson, int count) {
    return 'Lekcja $lesson/$count';
  }

  @override
  String get tutorialStart => 'Zaczynamy!';

  @override
  String get tutorialSkipTitle => 'Pominąć samouczek?';

  @override
  String get tutorialSkipBody =>
      'Pominąć tylko lekcję tego poziomu czy cały samouczek?';

  @override
  String get tutorialSkipLevel => 'Tylko ten poziom';

  @override
  String get tutorialSkipAll => 'Pomiń wszystko';

  @override
  String get tutorialWelcome =>
      'Cześć! W każdej łamigłówce ukryty jest obrazek. Czytaj liczby, wypełniaj właściwe pola i odkryj go!';

  @override
  String get tutorialL1Fill =>
      '[5]: w tym wierszu jest 5 wypełnionych pól. Wiersz ma 5 pól, więc wszystkie są wypełnione! Dotknij jednego.';

  @override
  String get tutorialL1Drag =>
      'Super! Teraz przesuń palec, nie odrywając go, i wypełnij resztę wiersza.';

  @override
  String get tutorialL1Row =>
      'Ten wiersz też ma [5]. Tym razem przesuń od końca do końca jednym ruchem.';

  @override
  String get tutorialL1AutoCross =>
      'Znaleziono [2] pola tej kolumny, więc reszta sama dostała X. X oznacza: puste.';

  @override
  String get tutorialL1Column =>
      'Liczby u góry dotyczą kolumn. Ta kolumna ma [5]: przesuń z góry na dół.';

  @override
  String get tutorialL1Count =>
      'Ten wiersz potrzebuje [3] pól. Pola z X są puste, więc zostały dokładnie 3. Wypełnij je wszystkie!';

  @override
  String get tutorialL1Finish => 'Dokończ sam ostatni wiersz i odkryj obrazek!';

  @override
  String get tutorialL2Groups =>
      '[2 2]: dwie osobne grupy. 2 pełne, co najmniej 1 puste, potem 2 pełne. 2 + 1 + 2 = 5: pasuje idealnie!';

  @override
  String get tutorialL2Cross =>
      'Czyli środkowe pole jest puste. Dotknij go dwa razy, aby postawić X.';

  @override
  String get tutorialL2Drag =>
      'X to tylko notatka i nic nie kosztuje. Teraz przesuń wzdłuż wiersza: X zostanie pominięty.';

  @override
  String get tutorialL2CrossSelf =>
      'Wiersz poniżej też ma [2 2]. Twoja kolej: najpierw dotknij dwa razy pustego pola, aby postawić X.';

  @override
  String get tutorialL2DragSelf => 'Teraz przesuń, aby wypełnić wiersz.';

  @override
  String get tutorialL2Mistakes =>
      'Uwaga: wypełnienie złego pola zmienia je w czerwony X i kosztuje serce. Nie masz pewności? Najpierw postaw X!';

  @override
  String get tutorialL2Finish =>
      'Reszta należy do ciebie! Utknąłeś? Policz, ilu pól brakuje w danej linii.';

  @override
  String get tutorialL3Overlap =>
      'Ta kolumna ma [4], a miejsca jest na 5. Blok 4 pól stoi na samej górze albo na samym dole. Tak czy inaczej środkowe 3 są pełne!';

  @override
  String get tutorialL3OverlapFill =>
      'Wypełnij te pewne pola. Ta sztuczka to nakładanie: sekret dużych łamigłówek!';

  @override
  String get tutorialL3OverlapSelf =>
      'Ta kolumna też ma [4]. Znajdź pewne pola sam!';

  @override
  String get tutorialL3OverlapRow =>
      'A [3]? Przesunięty w lewo czy w prawo, środkowe pole zawsze jest pełne. Wypełnij je!';

  @override
  String get tutorialL3Finish =>
      'Świetnie! Ta sztuczka przyda się często w dużych łamigłówkach. Teraz dokończ obrazek!';

  @override
  String get tutorialL4Ones =>
      'Trzy górne wiersze to [1 1 1]: trzy pojedyncze pola z przerwami. 1 + 1 + 1 + 1 + 1 = 5: pasują idealnie!';

  @override
  String get tutorialL4CrossDrag =>
      'Czyli trzy górne pola tej kolumny są puste. Dotknij dwa razy, przy drugim dotknięciu przytrzymaj palec i przesuń w dół: trzy X naraz!';

  @override
  String get tutorialL4CrossDragSelf =>
      'Twoja kolej: jednym ruchem narysuj X na trzech pustych polach tej kolumny.';

  @override
  String get tutorialL4Erase =>
      'Zły X? Dotknij go znów dwa razy, aby go usunąć. Przesunięcie z podwójnym dotknięciem od X usuwa X na drodze.';

  @override
  String get tutorialL4Finish => 'Super! Teraz dokończ obrazek.';

  @override
  String get tutorialL5Sum =>
      'Ostatnia lekcja! Ta kolumna to [3 1]: 3 + 1 + 1 = 5, więc jest pewna. Rozwiąż ją sam!';

  @override
  String get tutorialL5Hint =>
      'Utknąłeś? Naciśnij Podpowiedź: pokaże następny krok i wyjaśni dlaczego.';

  @override
  String get tutorialL5Finish =>
      'Jesteś gotowy! Na dużych planszach grube linie dzielą pola co 5, co ułatwia liczenie. Dokończ obrazek!';
}
