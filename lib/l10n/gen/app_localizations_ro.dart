// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get appTitle => 'Pixel Bloom';

  @override
  String get whoIsPlaying => 'Cine joacă?';

  @override
  String get newGame => 'Joc nou';

  @override
  String get emptySlot => 'Slot liber';

  @override
  String get yourName => 'Numele tău';

  @override
  String get namePlaceholder => 'De exemplu Ana';

  @override
  String get nameRequired => 'Scrie un nume';

  @override
  String get pickColor => 'Alege-ți culoarea';

  @override
  String get start => 'Începe';

  @override
  String get cancel => 'Anulează';

  @override
  String deleteSlotTitle(String name) {
    return 'Ștergi $name?';
  }

  @override
  String get deleteSlotBody =>
      'Tot progresul acestui jucător va fi șters. Acțiunea nu poate fi anulată.';

  @override
  String get delete => 'Șterge';

  @override
  String levelLabel(int n) {
    return 'Nivelul $n';
  }

  @override
  String hintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de indicii',
      few: '$count indicii',
      one: '1 indiciu',
    );
    return '$_temp0';
  }

  @override
  String get tutorialTap => 'Atinge: umple';

  @override
  String get tutorialDoubleTap =>
      'Atinge de două ori: pune X (atinge din nou de două ori un X: îl elimini)';

  @override
  String get tutorialDrag =>
      'Ține apăsat și glisează ca să marchezi multe pătrățele deodată. Atinge de două ori și glisează de pe un X ca să ștergi semnele X.';

  @override
  String get hint => 'Indiciu';

  @override
  String get noHintsTitle => 'Nu mai ai indicii';

  @override
  String get noHintsBody =>
      'Urmărește o reclamă scurtă ca să primești 1 indiciu.';

  @override
  String get noHintsBodyNoAds => 'Ai folosit toate indiciile.';

  @override
  String get watchAdForHint => 'Reclamă: +1 indiciu';

  @override
  String get outOfLivesTitle => 'Nu mai ai vieți';

  @override
  String get outOfLivesBody =>
      'Urmărește o reclamă ca să primești încă o viață sau ia nivelul de la capăt.';

  @override
  String get outOfLivesBodyNoAds =>
      'Ia nivelul de la capăt sau întoarce-te la niveluri.';

  @override
  String get watchAdForLife => 'Reclamă: +1 viață';

  @override
  String get restart => 'Ia-o de la capăt';

  @override
  String get backToLevels => 'Înapoi la niveluri';

  @override
  String get levelComplete => 'Grozav!';

  @override
  String nextLevel(int n) {
    return 'Urmează: nivelul $n';
  }

  @override
  String get ok => 'OK';

  @override
  String get allDoneSoon => 'Niveluri noi în curând';

  @override
  String get adLabel => 'Reclamă';

  @override
  String get adPlaceholder => 'Aici va apărea o reclamă';

  @override
  String get adClose => 'Închide';

  @override
  String adCountdown(int seconds) {
    return '$seconds s';
  }

  @override
  String get rulesTitle => 'Cum se joacă?';

  @override
  String get rulesClues =>
      'Numerele din stânga și de sus arată câte pătrățele pline sunt în acel rând și în acea coloană. Dacă sunt mai multe numere, între grupuri există cel puțin un pătrățel gol.';

  @override
  String get rulesMistakes =>
      'Dacă umpli un pătrățel care trebuie să rămână gol, pierzi 1 viață. Semnele X sunt gratuite: notează cum vrei. Ca să umpli un pătrățel cu X, elimină mai întâi X-ul atingând de două ori.';

  @override
  String get rulesScoring =>
      'Fiecare pătrățel umplut corect aduce puncte. Mutările corecte la rând cresc multiplicatorul (până la x5). Rândurile și coloanele terminate aduc puncte bonus.';

  @override
  String levelScore(int score) {
    return '$score puncte';
  }

  @override
  String totalScore(int total) {
    return 'Total: $total';
  }

  @override
  String get rulesGoal =>
      'Găsește toate pătrățelele pline și blocurile se transformă într-o imagine ascunsă.';

  @override
  String worldLabel(int n) {
    return 'Harta $n';
  }

  @override
  String get worldsTitle => 'Hărți';

  @override
  String get worldUnlocked => 'Hartă nouă deblocată!';

  @override
  String get worldComplete => 'Hartă terminată!';

  @override
  String nextWorld(String name) {
    return 'Harta următoare: $name';
  }

  @override
  String nextWorldLocked(String name) {
    return 'Termină această hartă ca să deblochezi $name';
  }

  @override
  String nextWorldSoon(String name) {
    return '$name în curând';
  }

  @override
  String get worldLocked => 'Termină harta anterioară';

  @override
  String get worldSoon => 'În curând';

  @override
  String get youAreHere => 'Ești aici';

  @override
  String get mapStart => 'Start';

  @override
  String playLevel(int n) {
    return 'Joacă · Nivelul $n';
  }

  @override
  String get tapToContinue => 'Atinge ca să continui';

  @override
  String starCount(int have, int max) {
    return '$have/$max';
  }

  @override
  String get settings => 'Setări';

  @override
  String get settingsSound => 'Efecte sonore';

  @override
  String get settingsLanguage => 'Limbă';

  @override
  String get settingsLanguageDevice => 'Limba dispozitivului';

  @override
  String hintRow(int n) {
    return 'Rândul $n';
  }

  @override
  String hintColumn(int n) {
    return 'Coloana $n';
  }

  @override
  String hintFullLine(String line, String clue) {
    return '$line ($clue): grupurile, cu câte un spațiu între ele, umplu toată linia, deci fiecare pătrățel e stabilit. Acest pătrățel e plin!';
  }

  @override
  String hintOverlap(String line, String clue) {
    return '$line ($clue): împinge grupurile la început sau la sfârșit: acest pătrățel e mereu într-un grup. Deci trebuie să fie plin!';
  }

  @override
  String hintForcedFill(String line, String clue) {
    return '$line ($clue): pătrățelele și semnele X pe care le ai deja limitează unde pot sta grupurile. În orice așezare posibilă, acest pătrățel e plin!';
  }

  @override
  String hintForcedEmpty(String line, String clue) {
    return '$line ($clue): niciun grup nu poate ajunge la acest pătrățel, deci e gol. Punem aici un X.';
  }

  @override
  String get hintFallback => 'Acest pătrățel face parte din imagine.';

  @override
  String get tutorialSkip => 'Sari peste';

  @override
  String get tutorialGotIt => 'Am înțeles';

  @override
  String get tutorialL1Fill =>
      'Numerele arată câte pătrățele din acel rând sunt pline. Acest rând spune 5, deci toate cele 5 pătrățele sunt pline! Atinge un pătrățel ca să-l umpli.';

  @override
  String get tutorialL1Drag =>
      'Bravo! Acum ține degetul apăsat și glisează ca să umpli restul rândului.';

  @override
  String get tutorialL1Column =>
      'Și această coloană spune 5: glisează de sus în jos.';

  @override
  String get tutorialL1Finish =>
      'Când un rând sau o coloană e gata, celelalte pătrățele primesc singure un X. Termină restul imaginii singur!';

  @override
  String get tutorialL2Cross =>
      '2 2 înseamnă 2 pătrățele pline, cel puțin un spațiu, apoi încă 2 pătrățele pline. 2 + spațiu + 2 = 5, deci rândul e sigur! Atinge de două ori pătrățelul gol ca să pui un X.';

  @override
  String get tutorialL2Drag =>
      'Pătrățelele cu X-ul tău sunt sărite când glisezi. Glisează pe tot rândul ca să-l umpli.';

  @override
  String get tutorialL2Rules =>
      'Dacă umpli un pătrățel greșit, pierzi 1 viață; semnele X sunt gratuite. Dacă te blochezi, butonul Indiciu îți explică și de ce. Restul depinde de tine!';
}
