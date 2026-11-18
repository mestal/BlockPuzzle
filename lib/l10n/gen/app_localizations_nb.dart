// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian Bokmål (`nb`).
class AppLocalizationsNb extends AppLocalizations {
  AppLocalizationsNb([String locale = 'nb']) : super(locale);

  @override
  String get appTitle => 'Pixel Bloom';

  @override
  String get whoIsPlaying => 'Hvem spiller?';

  @override
  String get newGame => 'Nytt spill';

  @override
  String get emptySlot => 'Tom plass';

  @override
  String get yourName => 'Navnet ditt';

  @override
  String get namePlaceholder => 'For eksempel Ingrid';

  @override
  String get nameRequired => 'Skriv inn et navn';

  @override
  String get pickColor => 'Velg fargen din';

  @override
  String get start => 'Start';

  @override
  String get cancel => 'Avbryt';

  @override
  String deleteSlotTitle(String name) {
    return 'Slette $name?';
  }

  @override
  String get deleteSlotBody =>
      'All fremgangen til denne spilleren blir slettet. Dette kan ikke angres.';

  @override
  String get delete => 'Slett';

  @override
  String levelLabel(int n) {
    return 'Nivå $n';
  }

  @override
  String hintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hint',
      one: '1 hint',
    );
    return '$_temp0';
  }

  @override
  String get tutorialTap => 'Trykk: fyll';

  @override
  String get tutorialDoubleTap =>
      'Dobbelttrykk: sett X (dobbelttrykk på en X igjen: fjern den)';

  @override
  String get tutorialDrag =>
      'Hold og dra for å merke mange ruter samtidig. Dobbelttrykk og dra fra en X for å viske ut X-er.';

  @override
  String get hint => 'Hint';

  @override
  String get noHintsTitle => 'Ingen hint igjen';

  @override
  String get noHintsBody => 'Se en kort reklame for å få 1 hint.';

  @override
  String get noHintsBodyNoAds => 'Du har brukt opp alle hintene dine.';

  @override
  String get watchAdForHint => 'Se reklame: +1 hint';

  @override
  String get outOfLivesTitle => 'Tom for liv';

  @override
  String get outOfLivesBody =>
      'Se en reklame for å få 1 liv til, eller start nivået på nytt.';

  @override
  String get outOfLivesBodyNoAds =>
      'Start nivået på nytt, eller gå tilbake til nivåene.';

  @override
  String get watchAdForLife => 'Se reklame: +1 liv';

  @override
  String get restart => 'Start på nytt';

  @override
  String get backToLevels => 'Tilbake til nivåene';

  @override
  String get levelComplete => 'Supert!';

  @override
  String nextLevel(int n) {
    return 'Neste: nivå $n';
  }

  @override
  String get ok => 'OK';

  @override
  String get allDoneSoon => 'Nye nivåer kommer snart';

  @override
  String get adLabel => 'Reklame';

  @override
  String get adPlaceholder => 'En reklame vises her';

  @override
  String get adClose => 'Lukk';

  @override
  String adCountdown(int seconds) {
    return '$seconds s';
  }

  @override
  String get rulesTitle => 'Hvordan spiller man?';

  @override
  String get rulesClues =>
      'Tallene til venstre og øverst viser hvor mange fylte ruter som er i den raden og kolonnen. Står det flere tall, er det minst én tom rute mellom gruppene.';

  @override
  String get rulesMistakes =>
      'Å fylle en rute som skal være tom koster 1 liv. X-er er gratis: noter som du vil. For å fylle en rute med X fjerner du først X-en med et dobbelttrykk.';

  @override
  String get rulesScoring =>
      'Hver riktig fylte rute gir poeng. Riktige trekk på rad øker multiplikatoren (opptil x5). Ferdige rader og kolonner gir bonuspoeng.';

  @override
  String levelScore(int score) {
    return '$score poeng';
  }

  @override
  String totalScore(int total) {
    return 'Totalt: $total';
  }

  @override
  String get rulesGoal =>
      'Finn alle de fylte rutene, så blir blokkene til et skjult bilde.';

  @override
  String worldLabel(int n) {
    return 'Kart $n';
  }

  @override
  String get worldsTitle => 'Kart';

  @override
  String get worldUnlocked => 'Nytt kart låst opp!';

  @override
  String get worldComplete => 'Kartet er fullført!';

  @override
  String nextWorld(String name) {
    return 'Neste kart: $name';
  }

  @override
  String nextWorldLocked(String name) {
    return 'Fullfør dette kartet for å låse opp $name';
  }

  @override
  String nextWorldSoon(String name) {
    return '$name kommer snart';
  }

  @override
  String get worldLocked => 'Fullfør forrige kart';

  @override
  String get worldSoon => 'Kommer snart';

  @override
  String get youAreHere => 'Du er her';

  @override
  String get mapStart => 'Start';

  @override
  String playLevel(int n) {
    return 'Spill · Nivå $n';
  }

  @override
  String get tapToContinue => 'Trykk for å fortsette';

  @override
  String starCount(int have, int max) {
    return '$have/$max';
  }

  @override
  String get settings => 'Innstillinger';

  @override
  String get settingsSound => 'Lydeffekter';

  @override
  String get settingsLanguage => 'Språk';

  @override
  String get settingsLanguageDevice => 'Enhetens språk';

  @override
  String hintRow(int n) {
    return 'Rad $n';
  }

  @override
  String hintColumn(int n) {
    return 'Kolonne $n';
  }

  @override
  String hintFullLine(String line, String clue) {
    return '$line ($clue): gruppene pluss ett mellomrom mellom hver fyller hele linjen, så hver rute er bestemt. Denne ruten er fylt!';
  }

  @override
  String hintOverlap(String line, String clue) {
    return '$line ($clue): skyv gruppene til starten eller slutten: denne ruten er alltid inne i en gruppe. Den må altså være fylt!';
  }

  @override
  String hintForcedFill(String line, String clue) {
    return '$line ($clue): rutene og X-ene du allerede har begrenser hvor gruppene får plass. I alle mulige plasseringer er denne ruten fylt!';
  }

  @override
  String hintForcedEmpty(String line, String clue) {
    return '$line ($clue): ingen gruppe når denne ruten, så den er tom. Vi setter en X her.';
  }

  @override
  String get hintFallback => 'Denne ruten er en del av bildet.';

  @override
  String get tutorialSkip => 'Hopp over';

  @override
  String get tutorialGotIt => 'Skjønner';

  @override
  String get tutorialL1Fill =>
      'Tallene viser hvor mange ruter i raden som er fylt. Denne raden sier 5, så alle 5 rutene er fylt! Trykk på en rute for å fylle den.';

  @override
  String get tutorialL1Drag =>
      'Flott! Hold nå fingeren nede og dra for å fylle resten av raden.';

  @override
  String get tutorialL1Column =>
      'Denne kolonnen sier også 5: dra ovenfra og ned.';

  @override
  String get tutorialL1Finish =>
      'Når en rad eller kolonne er ferdig, får de andre rutene en X av seg selv. Gjør ferdig resten av bildet selv!';

  @override
  String get tutorialL2Cross =>
      '2 2 betyr 2 fylte ruter, minst ett mellomrom og så 2 fylte ruter til. 2 + mellomrom + 2 = 5, så raden er sikker! Dobbelttrykk på den tomme ruten for å sette en X.';

  @override
  String get tutorialL2Drag =>
      'Ruter med X-en din hoppes over når du drar. Dra langs hele raden for å fylle den.';

  @override
  String get tutorialL2Rules =>
      'Å fylle feil rute koster 1 liv; X-er er gratis. Står du fast, forklarer Hint-knappen også hvorfor. Resten er opp til deg!';
}
