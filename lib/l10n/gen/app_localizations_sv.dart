// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get appTitle => 'Pixel Bloom';

  @override
  String get whoIsPlaying => 'Vem spelar?';

  @override
  String get newGame => 'Nytt spel';

  @override
  String get emptySlot => 'Tom plats';

  @override
  String get yourName => 'Ditt namn';

  @override
  String get namePlaceholder => 'Till exempel Elsa';

  @override
  String get nameRequired => 'Skriv ett namn';

  @override
  String get pickColor => 'Välj din färg';

  @override
  String get start => 'Starta';

  @override
  String get cancel => 'Avbryt';

  @override
  String deleteSlotTitle(String name) {
    return 'Radera $name?';
  }

  @override
  String get deleteSlotBody =>
      'Allt den här spelarens framsteg raderas. Det går inte att ångra.';

  @override
  String get delete => 'Radera';

  @override
  String levelLabel(int n) {
    return 'Nivå $n';
  }

  @override
  String hintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ledtrådar',
      one: '1 ledtråd',
    );
    return '$_temp0';
  }

  @override
  String get tutorialTap => 'Tryck: fyll';

  @override
  String get tutorialDoubleTap =>
      'Dubbeltryck: sätt X (dubbeltryck på ett X igen: ta bort det)';

  @override
  String get tutorialDrag =>
      'Håll kvar och dra för att markera många rutor på en gång. Dubbeltryck och dra från ett X för att sudda X-markeringar.';

  @override
  String get hint => 'Ledtråd';

  @override
  String get noHintsTitle => 'Inga ledtrådar kvar';

  @override
  String get noHintsBody => 'Titta på en kort reklam för att få 1 ledtråd.';

  @override
  String get noHintsBodyNoAds => 'Du har använt alla dina ledtrådar.';

  @override
  String get watchAdForHint => 'Se reklam: +1 ledtråd';

  @override
  String get outOfLivesTitle => 'Slut på liv';

  @override
  String get outOfLivesBody =>
      'Titta på en reklam för att få 1 liv till, eller börja om nivån.';

  @override
  String get outOfLivesBodyNoAds =>
      'Börja om nivån eller gå tillbaka till nivåerna.';

  @override
  String get watchAdForLife => 'Se reklam: +1 liv';

  @override
  String get restart => 'Börja om';

  @override
  String get backToLevels => 'Tillbaka till nivåerna';

  @override
  String get levelComplete => 'Snyggt!';

  @override
  String nextLevel(int n) {
    return 'Nästa: nivå $n';
  }

  @override
  String get ok => 'OK';

  @override
  String get allDoneSoon => 'Nya nivåer kommer snart';

  @override
  String get adLabel => 'Reklam';

  @override
  String get adPlaceholder => 'Här visas en reklam';

  @override
  String get adClose => 'Stäng';

  @override
  String adCountdown(int seconds) {
    return '$seconds s';
  }

  @override
  String get rulesTitle => 'Hur spelar man?';

  @override
  String get rulesClues =>
      'Siffrorna till vänster och upptill visar hur många fyllda rutor som finns i den raden och kolumnen. Om det finns flera siffror har grupperna minst en tom ruta mellan sig.';

  @override
  String get rulesMistakes =>
      'Att fylla en ruta som ska vara tom kostar 1 liv. X-markeringar är gratis: anteckna hur du vill. För att fylla en ruta med X tar du först bort X:et med ett dubbeltryck.';

  @override
  String get rulesScoring =>
      'Varje rätt ifylld ruta ger poäng. Rätt i rad ökar multiplikatorn (upp till x5). Färdiga rader och kolumner ger bonuspoäng.';

  @override
  String levelScore(int score) {
    return '$score poäng';
  }

  @override
  String totalScore(int total) {
    return 'Totalt: $total';
  }

  @override
  String get rulesGoal =>
      'Hitta alla fyllda rutor så förvandlas blocken till en dold bild.';

  @override
  String worldLabel(int n) {
    return 'Karta $n';
  }

  @override
  String get worldsTitle => 'Kartor';

  @override
  String get worldUnlocked => 'Ny karta upplåst!';

  @override
  String get worldComplete => 'Kartan klar!';

  @override
  String nextWorld(String name) {
    return 'Nästa karta: $name';
  }

  @override
  String nextWorldLocked(String name) {
    return 'Klara den här kartan för att låsa upp $name';
  }

  @override
  String nextWorldSoon(String name) {
    return '$name kommer snart';
  }

  @override
  String get worldLocked => 'Klara föregående karta';

  @override
  String get worldSoon => 'Kommer snart';

  @override
  String get youAreHere => 'Du är här';

  @override
  String get mapStart => 'Start';

  @override
  String playLevel(int n) {
    return 'Spela · Nivå $n';
  }

  @override
  String get tapToContinue => 'Tryck för att fortsätta';

  @override
  String starCount(int have, int max) {
    return '$have/$max';
  }

  @override
  String get settings => 'Inställningar';

  @override
  String get settingsSound => 'Ljudeffekter';

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
    return 'Kolumn $n';
  }

  @override
  String hintFullLine(String line, String clue) {
    return '$line ($clue): grupperna plus ett mellanrum mellan varje fyller hela linjen, så varje ruta är bestämd. Den här rutan är fylld!';
  }

  @override
  String hintOverlap(String line, String clue) {
    return '$line ($clue): skjut grupperna till början eller till slutet: den här rutan hamnar alltid i en grupp. Så den måste vara fylld!';
  }

  @override
  String hintForcedFill(String line, String clue) {
    return '$line ($clue): rutorna och X:en du redan har begränsar var grupperna får plats. I varje möjlig placering är den här rutan fylld!';
  }

  @override
  String hintForcedEmpty(String line, String clue) {
    return '$line ($clue): ingen grupp når den här rutan, så den är tom. Vi sätter ett X här.';
  }

  @override
  String get hintFallback => 'Den här rutan är en del av bilden.';

  @override
  String get tutorialSkip => 'Hoppa över';

  @override
  String get tutorialGotIt => 'Jag fattar';

  @override
  String get tutorialL1Fill =>
      'Siffrorna visar hur många rutor i raden som är fyllda. Den här raden säger 5, så alla 5 rutorna är fyllda! Tryck på en ruta för att fylla den.';

  @override
  String get tutorialL1Drag =>
      'Bra! Håll nu fingret nere och dra för att fylla resten av raden.';

  @override
  String get tutorialL1Column =>
      'Den här kolumnen säger också 5: dra uppifrån och ned.';

  @override
  String get tutorialL1Finish =>
      'När en rad eller kolumn är klar får dess övriga rutor ett X av sig själva. Gör klart resten av bilden själv!';

  @override
  String get tutorialL2Cross =>
      '2 2 betyder 2 fyllda rutor, minst ett mellanrum och sedan 2 fyllda rutor till. 2 + mellanrum + 2 = 5, så raden är säker! Dubbeltryck på den tomma rutan för att sätta ett X.';

  @override
  String get tutorialL2Drag =>
      'Rutor med ditt X hoppas över när du drar. Dra längs hela raden för att fylla den.';

  @override
  String get tutorialL2Rules =>
      'Att fylla fel ruta kostar 1 liv; X-markeringar är gratis. Om du kör fast förklarar Ledtråd-knappen också varför. Resten är upp till dig!';
}
