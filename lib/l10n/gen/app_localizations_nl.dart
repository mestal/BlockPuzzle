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
  String get pickColor => 'Kies je kleur';

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
  String get tutorialL1Fill =>
      'De getallen geven aan hoeveel vakjes in die rij gevuld zijn. Deze rij zegt 5, dus alle 5 vakjes zijn gevuld! Tik op een vakje om het te vullen.';

  @override
  String get tutorialL1Drag =>
      'Goed zo! Houd nu je vinger op het scherm en schuif om de rest van de rij te vullen.';

  @override
  String get tutorialL1Column =>
      'Deze kolom zegt ook 5: schuif van boven naar beneden.';

  @override
  String get tutorialL1Finish =>
      'Is een rij of kolom af, dan krijgen de andere vakjes vanzelf een X. Maak de rest van het plaatje zelf af!';

  @override
  String get tutorialL2Cross =>
      '2 2 betekent 2 gevulde vakjes, minstens één lege ruimte en dan nog 2 gevulde vakjes. 2 + ruimte + 2 = 5, dus de rij ligt vast! Dubbeltik op het lege vakje om een X te plaatsen.';

  @override
  String get tutorialL2Drag =>
      'Vakjes met jouw X worden overgeslagen als je schuift. Schuif over de hele rij om hem te vullen.';

  @override
  String get tutorialL2Rules =>
      'Een verkeerd vakje vullen kost 1 leven; X\'jes zijn gratis. Zit je vast? De Hint-knop legt ook uit waarom. De rest is aan jou!';
}
