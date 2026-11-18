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
  String tutorialLesson(int lesson, int count) {
    return 'Lektion $lesson/$count';
  }

  @override
  String get tutorialStart => 'Nu kör vi!';

  @override
  String get tutorialSkipTitle => 'Hoppa över guiden?';

  @override
  String get tutorialSkipBody =>
      'Hoppa bara över lektionen på den här nivån, eller hela guiden?';

  @override
  String get tutorialSkipLevel => 'Bara den här nivån';

  @override
  String get tutorialSkipAll => 'Hoppa över allt';

  @override
  String get tutorialWelcome =>
      'Hej! Varje pussel döljer en bild. Läs siffrorna, fyll rätt rutor och avslöja den!';

  @override
  String get tutorialL1Fill =>
      '[5]: den här raden har 5 fyllda rutor. Raden är 5 rutor lång, så alla är fyllda! Tryck på en.';

  @override
  String get tutorialL1Drag =>
      'Snyggt! Dra nu utan att lyfta fingret och fyll resten av raden.';

  @override
  String get tutorialL1Row =>
      'Den här raden är också [5]. Dra den här gången från ände till ände i ett svep.';

  @override
  String get tutorialL1AutoCross =>
      'Kolumnens [2] rutor är hittade, så resten fick ett X av sig själva. X betyder: tom.';

  @override
  String get tutorialL1Column =>
      'Siffrorna överst gäller kolumnerna. Den här kolumnen är [5]: dra uppifrån och ned.';

  @override
  String get tutorialL1Count =>
      'Den här raden behöver [3] rutor. X-rutorna är tomma, så exakt 3 rutor är kvar. Fyll alla!';

  @override
  String get tutorialL1Finish =>
      'Gör klart sista raden själv och avslöja bilden!';

  @override
  String get tutorialL2Groups =>
      '[2 2]: två separata grupper. 2 fyllda, minst 1 tom, sedan 2 fyllda. 2 + 1 + 2 = 5: passar exakt!';

  @override
  String get tutorialL2Cross =>
      'Alltså är mittrutan tom. Dubbeltryck på den för att sätta ett X.';

  @override
  String get tutorialL2Drag =>
      'Ett X är bara en anteckning och kostar inget. Dra nu över raden: X-rutan hoppas över.';

  @override
  String get tutorialL2CrossSelf =>
      'Raden under är också [2 2]. Din tur: dubbeltryck först på den tomma rutan för att sätta ett X.';

  @override
  String get tutorialL2DragSelf => 'Dra nu för att fylla raden.';

  @override
  String get tutorialL2Mistakes =>
      'Akta: fyller du fel ruta blir den ett rött X och du förlorar ett hjärta. Osäker? Sätt ett X först!';

  @override
  String get tutorialL2Finish =>
      'Resten är ditt! Fastnat? Räkna hur många rutor en linje fortfarande behöver.';

  @override
  String get tutorialL3Overlap =>
      'Den här kolumnen är [4], med plats för 5. Blocket med 4 står antingen överst eller underst. Hur som helst är de mittersta 3 fyllda!';

  @override
  String get tutorialL3OverlapFill =>
      'Fyll de säkra rutorna. Tricket kallas överlapp: hemligheten bakom stora pussel!';

  @override
  String get tutorialL3OverlapSelf =>
      'Den här kolumnen är också [4]. Hitta de säkra rutorna själv!';

  @override
  String get tutorialL3OverlapRow =>
      'Och [3]? Åt vänster eller åt höger, mittrutan är alltid fylld. Fyll den!';

  @override
  String get tutorialL3Finish =>
      'Toppen! Det här tricket kommer du ofta att använda i stora pussel. Gör nu klart bilden!';

  @override
  String get tutorialL4Ones =>
      'De tre översta raderna är [1 1 1]: tre ensamma rutor med mellanrum. 1 + 1 + 1 + 1 + 1 = 5: passar exakt!';

  @override
  String get tutorialL4CrossDrag =>
      'Alltså är kolumnens tre översta rutor tomma. Dubbeltryck, håll kvar fingret på andra trycket och dra nedåt: tre X på en gång!';

  @override
  String get tutorialL4CrossDragSelf =>
      'Din tur: dra X på kolumnens tre tomma rutor i ett svep.';

  @override
  String get tutorialL4Erase =>
      'Fel X? Dubbeltryck på det igen så försvinner det. Drar du med dubbeltryck från ett X suddar du X:en på vägen.';

  @override
  String get tutorialL4Finish => 'Super! Gör nu klart bilden.';

  @override
  String get tutorialL5Gaps =>
      'Sista lektionen: lös med X! De fyra yttre kolumnerna är [2 2]: 2 + 1 + 2 = 5. Alla deras luckor hamnar på mittenraden.';

  @override
  String get tutorialL5CrossDrag =>
      'Markera de tomma rutorna: dubbeltryck, håll kvar fingret på andra trycket och dra åt sidan: två X på en gång!';

  @override
  String get tutorialL5CrossDragSelf =>
      'Din tur: dra X på de två tomma rutorna till höger i ett svep.';

  @override
  String get tutorialL5Count =>
      'Den här raden är [1], och efter X:en finns bara en ruta kvar. X gör det lätt att räkna: fyll den!';

  @override
  String get tutorialL5Hint =>
      'Fastnat? Tryck på Ledtråd: den visar nästa steg och förklarar varför.';

  @override
  String get tutorialL5Finish =>
      'Du är redo! På stora rutnät delar tjocka linjer rutorna i femgrupper så att det är lätt att räkna. Gör klart bilden!';
}
