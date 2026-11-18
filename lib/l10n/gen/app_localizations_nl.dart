// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'Pixel Bloom';

  @override
  String get whoIsPlaying => 'Wie speelt er?';

  @override
  String get newGame => 'Nieuw spel';

  @override
  String get emptySlot => 'Leeg slot';

  @override
  String get yourName => 'Je naam';

  @override
  String get namePlaceholder => 'Bijvoorbeeld Sanne';

  @override
  String get nameRequired => 'Vul een naam in';

  @override
  String get start => 'Start';

  @override
  String get cancel => 'Annuleren';

  @override
  String deleteSlotTitle(String name) {
    return '$name verwijderen?';
  }

  @override
  String get deleteSlotBody =>
      'Alle voortgang van deze speler wordt verwijderd. Dit kan niet ongedaan worden gemaakt.';

  @override
  String get delete => 'Verwijderen';

  @override
  String levelLabel(int n) {
    return 'Level $n';
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
  String get tutorialTap => 'Tik: vullen';

  @override
  String get tutorialDoubleTap =>
      'Dubbeltik: X plaatsen (nog eens dubbeltikken op een X: weghalen)';

  @override
  String get tutorialDrag =>
      'Houd vast en schuif om veel vakjes tegelijk te markeren. Dubbeltik en schuif vanaf een X om X\'jes te wissen.';

  @override
  String get hint => 'Hint';

  @override
  String get noHintsTitle => 'Geen hints meer';

  @override
  String get noHintsBody => 'Bekijk een korte advertentie voor 1 hint.';

  @override
  String get noHintsBodyNoAds => 'Je hebt al je hints gebruikt.';

  @override
  String get watchAdForHint => 'Advertentie: +1 hint';

  @override
  String get outOfLivesTitle => 'Geen levens meer';

  @override
  String get outOfLivesBody =>
      'Bekijk een advertentie voor 1 extra leven, of begin het level opnieuw.';

  @override
  String get outOfLivesBodyNoAds =>
      'Begin het level opnieuw of ga terug naar de levels.';

  @override
  String get watchAdForLife => 'Advertentie: +1 leven';

  @override
  String get restart => 'Opnieuw beginnen';

  @override
  String get backToLevels => 'Terug naar levels';

  @override
  String get levelComplete => 'Geweldig!';

  @override
  String nextLevel(int n) {
    return 'Volgende: level $n';
  }

  @override
  String get ok => 'OK';

  @override
  String get allDoneSoon => 'Binnenkort nieuwe levels';

  @override
  String get adLabel => 'Advertentie';

  @override
  String get adPlaceholder => 'Hier wordt een advertentie getoond';

  @override
  String get adClose => 'Sluiten';

  @override
  String adCountdown(int seconds) {
    return '$seconds s';
  }

  @override
  String get rulesTitle => 'Hoe speel je?';

  @override
  String get rulesClues =>
      'De getallen links en bovenaan geven aan hoeveel gevulde vakjes er in die rij en kolom zitten. Staan er meerdere getallen, dan zit er tussen de groepen minstens één leeg vakje.';

  @override
  String get rulesMistakes =>
      'Een vakje vullen dat leeg moet blijven kost 1 leven. X\'jes zijn gratis: maak zoveel aantekeningen als je wilt. Om een vakje met een X te vullen, haal je eerst de X weg met een dubbeltik.';

  @override
  String get rulesScoring =>
      'Elk juist gevuld vakje levert punten op. Juiste vakjes achter elkaar verhogen de vermenigvuldiger (tot x5). Afgemaakte rijen en kolommen geven bonuspunten.';

  @override
  String levelScore(int score) {
    return '$score punten';
  }

  @override
  String totalScore(int total) {
    return 'Totaal: $total';
  }

  @override
  String get rulesGoal =>
      'Vind alle gevulde vakjes en de blokken veranderen in een verborgen plaatje.';

  @override
  String worldLabel(int n) {
    return 'Kaart $n';
  }

  @override
  String get worldsTitle => 'Kaarten';

  @override
  String get worldUnlocked => 'Nieuwe kaart ontgrendeld!';

  @override
  String get worldComplete => 'Kaart voltooid!';

  @override
  String nextWorld(String name) {
    return 'Volgende kaart: $name';
  }

  @override
  String nextWorldLocked(String name) {
    return 'Maak deze kaart af om $name te ontgrendelen';
  }

  @override
  String nextWorldSoon(String name) {
    return '$name komt binnenkort';
  }

  @override
  String get worldLocked => 'Maak eerst de vorige kaart af';

  @override
  String get worldSoon => 'Binnenkort';

  @override
  String get youAreHere => 'Je bent hier';

  @override
  String get mapStart => 'Start';

  @override
  String playLevel(int n) {
    return 'Spelen · Level $n';
  }

  @override
  String get tapToContinue => 'Tik om verder te gaan';

  @override
  String starCount(int have, int max) {
    return '$have/$max';
  }

  @override
  String get settings => 'Instellingen';

  @override
  String get settingsSound => 'Geluidseffecten';

  @override
  String get settingsLanguage => 'Taal';

  @override
  String get settingsLanguageDevice => 'Taal van het apparaat';

  @override
  String hintRow(int n) {
    return 'Rij $n';
  }

  @override
  String hintColumn(int n) {
    return 'Kolom $n';
  }

  @override
  String hintFullLine(String line, String clue) {
    return '$line ($clue): de groepen met telkens één lege ruimte ertussen vullen de hele lijn, dus elk vakje ligt vast. Dit vakje is gevuld!';
  }

  @override
  String hintOverlap(String line, String clue) {
    return '$line ($clue): schuif de groepen naar het begin of naar het einde: dit vakje valt altijd binnen een groep. Het moet dus gevuld zijn!';
  }

  @override
  String hintForcedFill(String line, String clue) {
    return '$line ($clue): de vakjes en X\'jes die je al hebt beperken waar de groepen passen. In elke mogelijke plaatsing is dit vakje gevuld!';
  }

  @override
  String hintForcedEmpty(String line, String clue) {
    return '$line ($clue): geen enkele groep kan dit vakje bereiken, dus het is leeg. We zetten hier een X.';
  }

  @override
  String get hintFallback => 'Dit vakje hoort bij het plaatje.';

  @override
  String get tutorialSkip => 'Overslaan';

  @override
  String get tutorialGotIt => 'Begrepen';

  @override
  String tutorialLesson(int lesson, int count) {
    return 'Les $lesson/$count';
  }

  @override
  String get tutorialStart => 'Daar gaan we!';

  @override
  String get tutorialSkipTitle => 'Uitleg overslaan?';

  @override
  String get tutorialSkipBody =>
      'Alleen de les van dit level overslaan, of de hele uitleg?';

  @override
  String get tutorialSkipLevel => 'Alleen dit level';

  @override
  String get tutorialSkipAll => 'Alles overslaan';

  @override
  String get tutorialWelcome =>
      'Hoi! In elke puzzel zit een plaatje verstopt. Lees de getallen, vul de juiste vakjes en onthul het!';

  @override
  String get tutorialL1Fill =>
      '[5]: deze rij heeft 5 gevulde vakjes. De rij is 5 vakjes lang, dus ze zijn allemaal gevuld! Tik er een aan.';

  @override
  String get tutorialL1Drag =>
      'Top! Schuif nu zonder je vinger op te tillen en vul de rest van de rij.';

  @override
  String get tutorialL1Row =>
      'Deze rij is ook [5]. Schuif nu in één keer van begin tot eind.';

  @override
  String get tutorialL1AutoCross =>
      'De [2] vakjes van deze kolom zijn gevonden, dus de rest kreeg vanzelf een X. Een X betekent: leeg.';

  @override
  String get tutorialL1Column =>
      'De getallen bovenaan horen bij de kolommen. Deze kolom is [5]: schuif van boven naar beneden.';

  @override
  String get tutorialL1Count =>
      'Deze rij heeft [3] vakjes nodig. De X\'jes zijn leeg, dus er zijn precies 3 vakjes over. Vul ze allemaal!';

  @override
  String get tutorialL1Finish =>
      'Maak de laatste rij zelf af en onthul het plaatje!';

  @override
  String get tutorialL2Groups =>
      '[2 2]: twee losse groepen. 2 gevuld, minstens 1 leeg, dan 2 gevuld. 2 + 1 + 2 = 5: past precies!';

  @override
  String get tutorialL2Cross =>
      'Het middelste vakje is dus leeg. Dubbeltik erop om er een X te zetten.';

  @override
  String get tutorialL2Drag =>
      'Een X is maar een notitie en kost niets. Schuif nu over de rij: de X wordt overgeslagen.';

  @override
  String get tutorialL2CrossSelf =>
      'De rij eronder is ook [2 2]. Jouw beurt: dubbeltik eerst op het lege vakje om er een X te zetten.';

  @override
  String get tutorialL2DragSelf => 'Schuif nu om de rij te vullen.';

  @override
  String get tutorialL2Mistakes =>
      'Let op: een verkeerd vakje vullen maakt er een rode X van en kost een hartje. Twijfel je? Zet eerst een X!';

  @override
  String get tutorialL2Finish =>
      'De rest is aan jou! Vast? Tel hoeveel vakjes een lijn nog nodig heeft.';

  @override
  String get tutorialL3Overlap =>
      'Deze kolom is [4], met ruimte voor 5. Het blok van 4 staat helemaal boven of helemaal onder. Hoe dan ook: de middelste 3 zijn gevuld!';

  @override
  String get tutorialL3OverlapFill =>
      'Vul die zekere vakjes. Deze truc heet overlap: het geheim van grote puzzels!';

  @override
  String get tutorialL3OverlapSelf =>
      'Deze kolom is ook [4]. Zoek de zekere vakjes zelf!';

  @override
  String get tutorialL3OverlapRow =>
      'En [3]? Links of rechts tegenaan, het middelste vakje is altijd gevuld. Vul het!';

  @override
  String get tutorialL3Finish =>
      'Geweldig! Deze truc ga je vaak gebruiken in grote puzzels. Maak nu het plaatje af!';

  @override
  String get tutorialL4Ones =>
      'De bovenste drie rijen zijn [1 1 1]: drie losse vakjes met gaten ertussen. 1 + 1 + 1 + 1 + 1 = 5: past precies!';

  @override
  String get tutorialL4CrossDrag =>
      'Dus de bovenste drie vakjes van deze kolom zijn leeg. Dubbeltik, houd bij de tweede tik je vinger neer en schuif omlaag: drie X\'jes in één keer!';

  @override
  String get tutorialL4CrossDragSelf =>
      'Jouw beurt: teken in één veeg X\'jes op de drie lege vakjes van deze kolom.';

  @override
  String get tutorialL4Erase =>
      'Verkeerde X? Dubbeltik er nog eens op en hij is weg. Schuif je met een dubbeltik vanaf een X, dan wis je de X\'jes onderweg.';

  @override
  String get tutorialL4Finish => 'Super! Maak nu het plaatje af.';

  @override
  String get tutorialL5Sum =>
      'Laatste les! Deze kolom is [3 1]: 3 + 1 + 1 = 5, dus hij staat vast. Los hem zelf op!';

  @override
  String get tutorialL5Hint =>
      'Vast? Druk op Hint: die toont de volgende stap en legt uit waarom.';

  @override
  String get tutorialL5Finish =>
      'Je bent er klaar voor! In grote roosters verdelen dikke lijnen de vakjes per 5, zo tel je makkelijker. Maak het plaatje af!';
}
