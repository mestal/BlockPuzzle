// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'BlockPuzzle';

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
  String get pickColor => 'Wähle deine Farbe';

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
  String get watchAdForHint => 'Werbung ansehen: +1 Tipp';

  @override
  String get outOfLivesTitle => 'Keine Leben mehr';

  @override
  String get outOfLivesBody =>
      'Sieh dir eine Werbung an, um 1 weiteres Leben zu bekommen, oder starte das Level neu.';

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
  String get tutorialL1Fill =>
      'Die Zahlen sagen, wie viele Felder in dieser Zeile gefüllt sind. Hier steht 4, also sind alle 4 Felder gefüllt! Tippe auf ein Feld, um es zu füllen.';

  @override
  String get tutorialL1Drag =>
      'Super! Halte jetzt den Finger gedrückt und wische, um den Rest der Zeile zu füllen.';

  @override
  String get tutorialL1Column =>
      'Ist eine Zeile oder Spalte fertig, bekommen die übrigen Felder von selbst ein X. Diese Spalte hat auch 4: wische von oben nach unten.';

  @override
  String get tutorialL1Finish =>
      'Noch eine Spalte. Vervollständige das Bild selbst!';

  @override
  String get tutorialL2Cross =>
      '2 1 heißt: 2 gefüllte Felder, mindestens eine Lücke, dann 1 gefülltes Feld. 2 + Lücke + 1 = 4, die Zeile steht fest! Tippe doppelt auf das leere Feld, um ein X zu setzen.';

  @override
  String get tutorialL2Drag =>
      'Felder mit deinem X werden beim Wischen übersprungen. Wische über die ganze Zeile, um sie zu füllen.';

  @override
  String get tutorialL2Rules =>
      'Ein falsch gefülltes Feld kostet 1 Leben; X-Markierungen sind gratis. Wenn du nicht weiterkommst, erklärt der Tipp-Knopf auch das Warum. Der Rest liegt bei dir!';
}
