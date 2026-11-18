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
  String tutorialLesson(int lesson, int count) {
    return 'Leksjon $lesson/$count';
  }

  @override
  String get tutorialStart => 'Da kjører vi!';

  @override
  String get tutorialSkipTitle => 'Hoppe over opplæringen?';

  @override
  String get tutorialSkipBody =>
      'Hoppe over bare leksjonen på dette nivået, eller hele opplæringen?';

  @override
  String get tutorialSkipLevel => 'Bare dette nivået';

  @override
  String get tutorialSkipAll => 'Hopp over alt';

  @override
  String get tutorialWelcome =>
      'Hei! Hvert puslespill skjuler et bilde. Les tallene, fyll de riktige rutene og avslør det!';

  @override
  String get tutorialL1Fill =>
      '[5]: denne raden har 5 fylte ruter. Raden er 5 ruter lang, så alle er fylt! Trykk på en.';

  @override
  String get tutorialL1Drag =>
      'Flott! Dra nå uten å løfte fingeren og fyll resten av raden.';

  @override
  String get tutorialL1Row =>
      'Denne raden er også [5]. Dra fra ende til ende i ett drag denne gangen.';

  @override
  String get tutorialL1AutoCross =>
      'Kolonnens [2] ruter er funnet, så resten fikk en X av seg selv. X betyr: tom.';

  @override
  String get tutorialL1Column =>
      'Tallene øverst gjelder kolonnene. Denne kolonnen er [5]: dra ovenfra og ned.';

  @override
  String get tutorialL1Count =>
      'Denne raden trenger [3] ruter. X-rutene er tomme, så det er nøyaktig 3 igjen. Fyll alle!';

  @override
  String get tutorialL1Finish => 'Gjør ferdig siste rad selv og avslør bildet!';

  @override
  String get tutorialL2Groups =>
      '[2 2]: to separate grupper. 2 fylt, minst 1 tom, så 2 fylt. 2 + 1 + 2 = 5: passer akkurat!';

  @override
  String get tutorialL2Cross =>
      'Altså er midtruten tom. Dobbelttrykk på den for å sette en X.';

  @override
  String get tutorialL2Drag =>
      'En X er bare et notat og koster ingenting. Dra nå over raden: X-ruten hoppes over.';

  @override
  String get tutorialL2CrossSelf =>
      'Raden under er også [2 2]. Din tur: dobbelttrykk først på den tomme ruten for å sette en X.';

  @override
  String get tutorialL2DragSelf => 'Dra nå for å fylle raden.';

  @override
  String get tutorialL2Mistakes =>
      'Pass på: fyller du feil rute, blir den en rød X, og du mister et hjerte. Usikker? Sett en X først!';

  @override
  String get tutorialL2Finish =>
      'Resten er ditt! Står du fast? Tell hvor mange ruter en linje fortsatt mangler.';

  @override
  String get tutorialL3Overlap =>
      'Denne kolonnen er [4], med plass til 5. Blokken på 4 står enten helt øverst eller helt nederst. Uansett er de 3 midterste fylt!';

  @override
  String get tutorialL3OverlapFill =>
      'Fyll de sikre rutene. Trikset heter overlapp: hemmeligheten bak store puslespill!';

  @override
  String get tutorialL3OverlapSelf =>
      'Denne kolonnen er også [4]. Finn de sikre rutene selv!';

  @override
  String get tutorialL3OverlapRow =>
      'Og [3]? Skjøvet til venstre eller høyre, er midtruten alltid fylt. Fyll den!';

  @override
  String get tutorialL3Finish =>
      'Supert! Dette trikset får du bruk for ofte i store puslespill. Gjør nå ferdig bildet!';

  @override
  String get tutorialL4Ones =>
      'De tre øverste radene er [1 1 1]: tre enkle ruter med mellomrom. 1 + 1 + 1 + 1 + 1 = 5: passer akkurat!';

  @override
  String get tutorialL4CrossDrag =>
      'Altså er de tre øverste rutene i denne kolonnen tomme. Dobbelttrykk, hold fingeren nede på andre trykk og dra nedover: tre X-er på én gang!';

  @override
  String get tutorialL4CrossDragSelf =>
      'Din tur: tegn X-er på de tre tomme rutene i denne kolonnen i ett drag.';

  @override
  String get tutorialL4Erase =>
      'Feil X? Dobbelttrykk på den igjen, så forsvinner den. Drar du med dobbelttrykk fra en X, sletter du X-ene på veien.';

  @override
  String get tutorialL4Finish => 'Supert! Fullfør nå bildet.';

  @override
  String get tutorialL5Sum =>
      'Siste leksjon! Denne kolonnen er [3 1]: 3 + 1 + 1 = 5, så den er sikker. Løs den selv!';

  @override
  String get tutorialL5Hint =>
      'Står du fast? Trykk på Hint: det viser neste steg og forklarer hvorfor.';

  @override
  String get tutorialL5Finish =>
      'Du er klar! På store rutenett deler tykke linjer rutene i femmere, så det blir lett å telle. Gjør ferdig bildet!';
}
