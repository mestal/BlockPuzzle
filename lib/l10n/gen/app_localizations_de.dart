// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Pixel Bloom';

  @override
  String get whoIsPlaying => 'Wer spielt?';

  @override
  String get newGame => 'Neues Spiel';

  @override
  String get emptySlot => 'Freier Platz';

  @override
  String get yourName => 'Dein Name';

  @override
  String get namePlaceholder => 'Zum Beispiel Lena';

  @override
  String get nameRequired => 'Gib einen Namen ein';

  @override
  String get start => 'Los';

  @override
  String get cancel => 'Abbrechen';

  @override
  String deleteSlotTitle(String name) {
    return '$name löschen?';
  }

  @override
  String get deleteSlotBody =>
      'Der gesamte Fortschritt dieses Spielers wird gelöscht. Das kann nicht rückgängig gemacht werden.';

  @override
  String get delete => 'Löschen';

  @override
  String levelLabel(int n) {
    return 'Level $n';
  }

  @override
  String hintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Tipps',
      one: '1 Tipp',
    );
    return '$_temp0';
  }

  @override
  String get tutorialTap => 'Tippen: füllen';

  @override
  String get tutorialDoubleTap =>
      'Doppelt tippen: X setzen (X erneut doppelt antippen: entfernen)';

  @override
  String get tutorialDrag =>
      'Gedrückt halten und ziehen, um viele Felder auf einmal zu markieren. Doppelt tippen und von einem X aus ziehen löscht X-Markierungen.';

  @override
  String get hint => 'Tipp';

  @override
  String get noHintsTitle => 'Keine Tipps mehr';

  @override
  String get noHintsBody =>
      'Sieh dir eine kurze Werbung an und erhalte 1 Tipp.';

  @override
  String get noHintsBodyNoAds => 'Du hast alle Tipps verbraucht.';

  @override
  String get watchAdForHint => 'Werbung ansehen: +1 Tipp';

  @override
  String get outOfLivesTitle => 'Keine Leben mehr';

  @override
  String get outOfLivesBody =>
      'Sieh dir eine Werbung an, um 1 weiteres Leben zu bekommen, oder starte das Level neu.';

  @override
  String get outOfLivesBodyNoAds =>
      'Starte das Level neu oder kehre zu den Levels zurück.';

  @override
  String get watchAdForLife => 'Werbung ansehen: +1 Leben';

  @override
  String get restart => 'Neu starten';

  @override
  String get backToLevels => 'Zurück zu den Levels';

  @override
  String get levelComplete => 'Super!';

  @override
  String nextLevel(int n) {
    return 'Weiter: Level $n';
  }

  @override
  String get ok => 'OK';

  @override
  String get allDoneSoon => 'Neue Level kommen bald';

  @override
  String get adLabel => 'Werbung';

  @override
  String get adPlaceholder => 'Hier wird Werbung angezeigt';

  @override
  String get adClose => 'Schließen';

  @override
  String adCountdown(int seconds) {
    return '$seconds s';
  }

  @override
  String get rulesTitle => 'Wie spielt man?';

  @override
  String get rulesClues =>
      'Die Zahlen links und oben zeigen, wie viele gefüllte Felder in dieser Zeile und Spalte sind. Bei mehreren Zahlen liegt zwischen den Gruppen mindestens ein freies Feld.';

  @override
  String get rulesMistakes =>
      'Füllst du ein Feld, das leer sein muss, verlierst du 1 Leben. X-Markierungen sind frei: Mach dir Notizen, wie du willst. Um ein Feld mit X zu füllen, entferne das X zuerst durch doppeltes Tippen.';

  @override
  String get rulesScoring =>
      'Jedes richtige Füllen bringt Punkte. Fehlerfreies Füllen hintereinander erhöht den Multiplikator (bis x5). Fertige Zeilen und Spalten geben Bonuspunkte.';

  @override
  String levelScore(int score) {
    return '$score Punkte';
  }

  @override
  String totalScore(int total) {
    return 'Gesamt: $total';
  }

  @override
  String get rulesGoal =>
      'Findest du alle gefüllten Felder, werden die Blöcke zu einem versteckten Bild.';

  @override
  String worldLabel(int n) {
    return 'Karte $n';
  }

  @override
  String get worldsTitle => 'Karten';

  @override
  String get worldUnlocked => 'Neue Karte freigeschaltet!';

  @override
  String get worldComplete => 'Karte geschafft!';

  @override
  String nextWorld(String name) {
    return 'Nächste Karte: $name';
  }

  @override
  String nextWorldLocked(String name) {
    return 'Beende diese Karte, um $name freizuschalten';
  }

  @override
  String nextWorldSoon(String name) {
    return '$name kommt bald';
  }

  @override
  String get worldLocked => 'Beende die vorherige Karte';

  @override
  String get worldSoon => 'Bald verfügbar';

  @override
  String get youAreHere => 'Du bist hier';

  @override
  String get mapStart => 'Start';

  @override
  String playLevel(int n) {
    return 'Spielen · Level $n';
  }

  @override
  String get tapToContinue => 'Tippen zum Fortfahren';

  @override
  String starCount(int have, int max) {
    return '$have/$max';
  }

  @override
  String get settings => 'Einstellungen';

  @override
  String get settingsSound => 'Soundeffekte';

  @override
  String get settingsLanguage => 'Sprache';

  @override
  String get settingsLanguageDevice => 'Gerätesprache';

  @override
  String hintRow(int n) {
    return 'Zeile $n';
  }

  @override
  String hintColumn(int n) {
    return 'Spalte $n';
  }

  @override
  String hintFullLine(String line, String clue) {
    return '$line ($clue): Die Gruppen plus je ein Abstand füllen die ganze Linie, also steht jedes Feld fest. Dieses Feld ist gefüllt!';
  }

  @override
  String hintOverlap(String line, String clue) {
    return '$line ($clue): Ob du die Gruppen ganz nach vorne oder ganz nach hinten schiebst, dieses Feld liegt immer in einer Gruppe. Also ist es sicher gefüllt!';
  }

  @override
  String hintForcedFill(String line, String clue) {
    return '$line ($clue): Deine gefüllten Felder und X-Markierungen schränken ein, wo die Gruppen passen. In jeder möglichen Lage ist dieses Feld gefüllt!';
  }

  @override
  String hintForcedEmpty(String line, String clue) {
    return '$line ($clue): Keine Gruppe reicht bis zu diesem Feld, also ist es leer. Wir haben ein X gesetzt.';
  }

  @override
  String get hintFallback => 'Dieses Feld gehört zum Bild.';

  @override
  String get tutorialSkip => 'Überspringen';

  @override
  String get tutorialGotIt => 'Verstanden';

  @override
  String tutorialLesson(int lesson, int count) {
    return 'Lektion $lesson/$count';
  }

  @override
  String get tutorialStart => 'Los geht\'s!';

  @override
  String get tutorialSkipTitle => 'Tutorial überspringen?';

  @override
  String get tutorialSkipBody =>
      'Nur die Lektion dieses Levels überspringen oder das ganze Tutorial?';

  @override
  String get tutorialSkipLevel => 'Nur dieses Level';

  @override
  String get tutorialSkipAll => 'Alles überspringen';

  @override
  String get tutorialWelcome =>
      'Hallo! In jedem Rätsel steckt ein Bild. Lies die Zahlen, fülle die richtigen Felder und decke es auf!';

  @override
  String get tutorialL1Fill =>
      '[5]: In dieser Zeile sind 5 Felder gefüllt. Die Zeile hat genau 5 Felder, also alle! Tippe auf eines.';

  @override
  String get tutorialL1Drag =>
      'Super! Wische jetzt, ohne den Finger zu heben, und fülle den Rest der Zeile.';

  @override
  String get tutorialL1Row =>
      'Diese Zeile ist auch [5]. Wische diesmal in einem Zug von einem Ende zum anderen.';

  @override
  String get tutorialL1AutoCross =>
      'Die [2] Felder dieser Spalte sind gefunden, die übrigen bekamen von selbst ein X. X heißt: leer.';

  @override
  String get tutorialL1Column =>
      'Die Zahlen oben gehören zu den Spalten. Diese Spalte ist [5]: wische von oben nach unten.';

  @override
  String get tutorialL1Count =>
      'Diese Zeile braucht [3] Felder. Die X sind leer, also bleiben genau 3 Felder. Fülle sie alle!';

  @override
  String get tutorialL1Finish =>
      'Fülle die letzte Zeile selbst und decke das Bild auf!';

  @override
  String get tutorialL2Groups =>
      '[2 2]: zwei getrennte Gruppen. 2 gefüllt, mindestens 1 leer, dann 2 gefüllt. 2 + 1 + 2 = 5: passt genau!';

  @override
  String get tutorialL2Cross =>
      'Das mittlere Feld ist also leer. Tippe doppelt darauf, um ein X zu setzen.';

  @override
  String get tutorialL2Drag =>
      'Ein X ist nur eine Notiz und kostet nichts. Wische jetzt über die Zeile: Das X wird übersprungen.';

  @override
  String get tutorialL2CrossSelf =>
      'Die Zeile darunter ist auch [2 2]. Du bist dran: Setze zuerst ein X auf das leere Feld.';

  @override
  String get tutorialL2DragSelf => 'Wische jetzt, um die Zeile zu füllen.';

  @override
  String get tutorialL2Mistakes =>
      'Vorsicht: Ein falsch gefülltes Feld wird zum roten X und kostet ein Herz. Unsicher? Setze erst ein X!';

  @override
  String get tutorialL2Finish =>
      'Der Rest gehört dir! Kommst du nicht weiter, zähle, wie viele Felder einer Linie noch fehlen.';

  @override
  String get tutorialL3Overlap =>
      'Diese Spalte ist [4], Platz ist für 5. Der 4er-Block steht ganz oben oder ganz unten. So oder so sind die mittleren 3 gefüllt!';

  @override
  String get tutorialL3OverlapFill =>
      'Fülle diese sicheren Felder. Der Trick heißt Überlappung: das Geheimnis großer Rätsel!';

  @override
  String get tutorialL3OverlapSelf =>
      'Diese Spalte ist auch [4]. Finde die sicheren Felder selbst!';

  @override
  String get tutorialL3OverlapRow =>
      'Und [3]? Ob links oder rechts: Das mittlere Feld ist immer gefüllt. Fülle es!';

  @override
  String get tutorialL3Finish =>
      'Klasse! Diesen Trick brauchst du in großen Rätseln oft. Mach jetzt das Bild fertig!';

  @override
  String get tutorialL4Ones =>
      'Die oberen zwei Zeilen sind [1 1 1]: drei einzelne Felder mit Lücken. 1 + 1 + 1 + 1 + 1 = 5: passt genau!';

  @override
  String get tutorialL4CrossDrag =>
      'Diese zwei Felder sind leer. Tippe doppelt, lass beim zweiten Tippen den Finger unten und wische runter: eine X-Linie!';

  @override
  String get tutorialL4CrossDragSelf =>
      'Du bist dran: Zeichne X auf die zwei leeren Felder dieser Spalte.';

  @override
  String get tutorialL4Erase =>
      'Falsches X? Tippe noch mal doppelt darauf, dann ist es weg. Wischst du mit Doppeltipp ab einem X, löschst du die X auf dem Weg.';

  @override
  String get tutorialL4Finish => 'Super! Jetzt vervollständige das Bild.';

  @override
  String get tutorialL5Sum =>
      'Letzte Lektion! Diese Spalte ist [3 1]: 3 + 1 + 1 = 5, also steht sie fest. Löse sie selbst!';

  @override
  String get tutorialL5Hint =>
      'Kommst du nicht weiter? Drück auf Tipp: Er zeigt den nächsten Schritt und erklärt, warum.';

  @override
  String get tutorialL5Finish =>
      'Du bist bereit! In großen Gittern trennen dicke Linien je 5 Felder, das hilft beim Zählen. Mach das Bild fertig!';
}
