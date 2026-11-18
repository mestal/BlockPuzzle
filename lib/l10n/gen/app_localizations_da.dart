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
  String tutorialLesson(int lesson, int count) {
    return 'Lektion $lesson/$count';
  }

  @override
  String get tutorialStart => 'Så kører vi!';

  @override
  String get tutorialSkipTitle => 'Spring vejledningen over?';

  @override
  String get tutorialSkipBody =>
      'Spring kun denne banes lektion over, eller hele vejledningen?';

  @override
  String get tutorialSkipLevel => 'Kun denne bane';

  @override
  String get tutorialSkipAll => 'Spring alt over';

  @override
  String get tutorialWelcome =>
      'Hej! Hvert puslespil gemmer et billede. Læs tallene, udfyld de rigtige felter og afslør det!';

  @override
  String get tutorialL1Fill =>
      '[5]: denne række har 5 udfyldte felter. Rækken er 5 felter lang, så alle er udfyldt! Tryk på et.';

  @override
  String get tutorialL1Drag =>
      'Flot! Træk nu uden at løfte fingeren, og udfyld resten af rækken.';

  @override
  String get tutorialL1Row =>
      'Denne række er også [5]. Træk denne gang fra ende til ende i ét stræk.';

  @override
  String get tutorialL1AutoCross =>
      'Kolonnens [2] felter er fundet, så resten fik selv et X. X betyder: tomt.';

  @override
  String get tutorialL1Column =>
      'Tallene øverst hører til kolonnerne. Denne kolonne er [5]: træk oppefra og ned.';

  @override
  String get tutorialL1Count =>
      'Denne række skal bruge [3] felter. X\'erne er tomme, så der er præcis 3 tilbage. Udfyld dem alle!';

  @override
  String get tutorialL1Finish =>
      'Gør selv den sidste række færdig, og afslør billedet!';

  @override
  String get tutorialL2Groups =>
      '[2 2]: to adskilte grupper. 2 udfyldt, mindst 1 tomt, så 2 udfyldt. 2 + 1 + 2 = 5: passer præcis!';

  @override
  String get tutorialL2Cross =>
      'Så det midterste felt er tomt. Dobbelttryk på det for at sætte et X.';

  @override
  String get tutorialL2Drag =>
      'Et X er bare en note og koster intet. Træk nu hen over rækken: X-feltet springes over.';

  @override
  String get tutorialL2CrossSelf =>
      'Rækken nedenunder er også [2 2]. Din tur: dobbelttryk først på det tomme felt for at sætte et X.';

  @override
  String get tutorialL2DragSelf => 'Træk nu for at udfylde rækken.';

  @override
  String get tutorialL2Mistakes =>
      'Pas på: udfylder du et forkert felt, bliver det et rødt X, og du mister et hjerte. Usikker? Sæt et X først!';

  @override
  String get tutorialL2Finish =>
      'Resten er dit! Kører du fast? Tæl hvor mange felter en linje stadig mangler.';

  @override
  String get tutorialL3Overlap =>
      'Denne kolonne er [4], med plads til 5. Blokken på 4 står enten helt øverst eller helt nederst. Uanset hvad er de midterste 3 udfyldt!';

  @override
  String get tutorialL3OverlapFill =>
      'Udfyld de sikre felter. Tricket hedder overlap: hemmeligheden bag store puslespil!';

  @override
  String get tutorialL3OverlapSelf =>
      'Denne kolonne er også [4]. Find selv de sikre felter!';

  @override
  String get tutorialL3OverlapRow =>
      'Og [3]? Skubbet til venstre eller højre er det midterste felt altid udfyldt. Udfyld det!';

  @override
  String get tutorialL3Finish =>
      'Fedt! Det trick får du tit brug for i store puslespil. Gør nu billedet færdigt!';

  @override
  String get tutorialL4Ones =>
      'De to øverste rækker er [1 1 1]: tre enkelte felter med mellemrum. 1 + 1 + 1 + 1 + 1 = 5: passer præcis!';

  @override
  String get tutorialL4CrossDrag =>
      'Disse to felter er tomme. Dobbelttryk, hold fingeren nede ved andet tryk og træk nedad: en linje af X\'er!';

  @override
  String get tutorialL4CrossDragSelf =>
      'Din tur: tegn X\'er på kolonnens to tomme felter.';

  @override
  String get tutorialL4Erase =>
      'Forkert X? Dobbelttryk på det igen, så forsvinder det. Trækker du med dobbelttryk fra et X, sletter du X\'erne på vejen.';

  @override
  String get tutorialL4Finish => 'Super! Gør nu billedet færdigt.';

  @override
  String get tutorialL5Sum =>
      'Sidste lektion! Denne kolonne er [3 1]: 3 + 1 + 1 = 5, så den er sikker. Løs den selv!';

  @override
  String get tutorialL5Hint =>
      'Kører du fast? Tryk på Hint: det viser næste skridt og forklarer hvorfor.';

  @override
  String get tutorialL5Finish =>
      'Du er klar! På store gitre deler tykke linjer felterne i femmere, så det er let at tælle. Gør billedet færdigt!';
}
