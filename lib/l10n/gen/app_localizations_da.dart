// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get appTitle => 'Pixel Bloom';

  @override
  String get whoIsPlaying => 'Hvem spiller?';

  @override
  String get newGame => 'Nyt spil';

  @override
  String get emptySlot => 'Tom plads';

  @override
  String get yourName => 'Dit navn';

  @override
  String get namePlaceholder => 'For eksempel Freja';

  @override
  String get nameRequired => 'Skriv et navn';

  @override
  String get start => 'Start';

  @override
  String get cancel => 'Annuller';

  @override
  String deleteSlotTitle(String name) {
    return 'Slet $name?';
  }

  @override
  String get deleteSlotBody =>
      'Al denne spillers fremgang bliver slettet. Det kan ikke fortrydes.';

  @override
  String get delete => 'Slet';

  @override
  String levelLabel(int n) {
    return 'Bane $n';
  }

  @override
  String hintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hints',
      one: '1 hint',
    );
    return '$_temp0';
  }

  @override
  String get tutorialTap => 'Tryk: udfyld';

  @override
  String get tutorialDoubleTap =>
      'Dobbelttryk: sæt X (dobbelttryk på et X igen: fjern det)';

  @override
  String get tutorialDrag =>
      'Hold og træk for at markere mange felter på én gang. Dobbelttryk og træk fra et X for at viske X\'er ud.';

  @override
  String get hint => 'Hint';

  @override
  String get noHintsTitle => 'Ingen hints tilbage';

  @override
  String get noHintsBody => 'Se en kort reklame for at få 1 hint.';

  @override
  String get noHintsBodyNoAds => 'Du har brugt alle dine hints.';

  @override
  String get watchAdForHint => 'Se reklame: +1 hint';

  @override
  String get outOfLivesTitle => 'Ikke flere liv';

  @override
  String get outOfLivesBody =>
      'Se en reklame for at få 1 liv mere, eller start banen forfra.';

  @override
  String get outOfLivesBodyNoAds =>
      'Start banen forfra, eller gå tilbage til banerne.';

  @override
  String get watchAdForLife => 'Se reklame: +1 liv';

  @override
  String get restart => 'Start forfra';

  @override
  String get backToLevels => 'Tilbage til banerne';

  @override
  String get levelComplete => 'Flot!';

  @override
  String nextLevel(int n) {
    return 'Næste: bane $n';
  }

  @override
  String get ok => 'OK';

  @override
  String get allDoneSoon => 'Nye baner kommer snart';

  @override
  String get adLabel => 'Reklame';

  @override
  String get adPlaceholder => 'Her vises en reklame';

  @override
  String get adClose => 'Luk';

  @override
  String adCountdown(int seconds) {
    return '$seconds s';
  }

  @override
  String get rulesTitle => 'Hvordan spiller man?';

  @override
  String get rulesClues =>
      'Tallene til venstre og øverst viser, hvor mange udfyldte felter der er i den række og kolonne. Er der flere tal, er der mindst ét tomt felt mellem grupperne.';

  @override
  String get rulesMistakes =>
      'At udfylde et felt, der skal være tomt, koster 1 liv. X\'er er gratis: tag noter, som du vil. For at udfylde et felt med X skal du først fjerne X\'et med et dobbelttryk.';

  @override
  String get rulesScoring =>
      'Hvert rigtigt udfyldt felt giver point. Rigtige træk i træk øger multiplikatoren (op til x5). Færdige rækker og kolonner giver bonuspoint.';

  @override
  String levelScore(int score) {
    return '$score point';
  }

  @override
  String totalScore(int total) {
    return 'I alt: $total';
  }

  @override
  String get rulesGoal =>
      'Find alle de udfyldte felter, så bliver blokkene til et skjult billede.';

  @override
  String worldLabel(int n) {
    return 'Kort $n';
  }

  @override
  String get worldsTitle => 'Kort';

  @override
  String get worldUnlocked => 'Nyt kort låst op!';

  @override
  String get worldComplete => 'Kortet er klaret!';

  @override
  String nextWorld(String name) {
    return 'Næste kort: $name';
  }

  @override
  String nextWorldLocked(String name) {
    return 'Klar dette kort for at låse op for $name';
  }

  @override
  String nextWorldSoon(String name) {
    return '$name kommer snart';
  }

  @override
  String get worldLocked => 'Klar det forrige kort';

  @override
  String get worldSoon => 'Kommer snart';

  @override
  String get youAreHere => 'Du er her';

  @override
  String get mapStart => 'Start';

  @override
  String playLevel(int n) {
    return 'Spil · Bane $n';
  }

  @override
  String get tapToContinue => 'Tryk for at fortsætte';

  @override
  String starCount(int have, int max) {
    return '$have/$max';
  }

  @override
  String get settings => 'Indstillinger';

  @override
  String get settingsSound => 'Lydeffekter';

  @override
  String get settingsLanguage => 'Sprog';

  @override
  String get settingsLanguageDevice => 'Enhedens sprog';

  @override
  String hintRow(int n) {
    return 'Række $n';
  }

  @override
  String hintColumn(int n) {
    return 'Kolonne $n';
  }

  @override
  String hintFullLine(String line, String clue) {
    return '$line ($clue): grupperne plus ét mellemrum mellem hver fylder hele linjen, så hvert felt ligger fast. Dette felt er udfyldt!';
  }

  @override
  String hintOverlap(String line, String clue) {
    return '$line ($clue): skub grupperne til starten eller slutningen: dette felt er altid inde i en gruppe. Så det skal være udfyldt!';
  }

  @override
  String hintForcedFill(String line, String clue) {
    return '$line ($clue): de felter og X\'er, du allerede har, begrænser, hvor grupperne kan være. I enhver mulig placering er dette felt udfyldt!';
  }

  @override
  String hintForcedEmpty(String line, String clue) {
    return '$line ($clue): ingen gruppe kan nå dette felt, så det er tomt. Vi sætter et X her.';
  }

  @override
  String get hintFallback => 'Dette felt er en del af billedet.';

  @override
  String get tutorialSkip => 'Spring over';

  @override
  String get tutorialGotIt => 'Forstået';

  @override
  String get tutorialL1Fill =>
      'Tallene viser, hvor mange felter i rækken der er udfyldt. Denne række siger 5, så alle 5 felter er udfyldt! Tryk på et felt for at udfylde det.';

  @override
  String get tutorialL1Drag =>
      'Godt! Hold nu fingeren nede og træk for at udfylde resten af rækken.';

  @override
  String get tutorialL1Column =>
      'Denne kolonne siger også 5: træk oppefra og ned.';

  @override
  String get tutorialL1Finish =>
      'Når en række eller kolonne er færdig, får de andre felter selv et X. Gør resten af billedet færdigt selv!';

  @override
  String get tutorialL2Cross =>
      '2 2 betyder 2 udfyldte felter, mindst ét mellemrum og så 2 udfyldte felter mere. 2 + mellemrum + 2 = 5, så rækken er sikker! Dobbelttryk på det tomme felt for at sætte et X.';

  @override
  String get tutorialL2Drag =>
      'Felter med dit X springes over, når du trækker. Træk hen over hele rækken for at udfylde den.';

  @override
  String get tutorialL2Rules =>
      'At udfylde et forkert felt koster 1 liv; X\'er er gratis. Sidder du fast, forklarer Hint-knappen også hvorfor. Resten er op til dig!';
}
