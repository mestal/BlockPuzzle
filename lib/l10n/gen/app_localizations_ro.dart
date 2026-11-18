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
  String tutorialLesson(int lesson, int count) {
    return 'Lecția $lesson/$count';
  }

  @override
  String get tutorialStart => 'Să începem!';

  @override
  String get tutorialSkipTitle => 'Sari peste tutorial?';

  @override
  String get tutorialSkipBody =>
      'Sari doar peste lecția acestui nivel sau peste tot tutorialul?';

  @override
  String get tutorialSkipLevel => 'Doar acest nivel';

  @override
  String get tutorialSkipAll => 'Sari peste tot';

  @override
  String get tutorialWelcome =>
      'Salut! Fiecare puzzle ascunde o imagine. Citește numerele, umple pătrățelele potrivite și descoper-o!';

  @override
  String get tutorialL1Fill =>
      '[5]: rândul acesta are 5 pătrățele pline. Rândul are 5 pătrățele, deci toate sunt pline! Atinge unul.';

  @override
  String get tutorialL1Drag =>
      'Super! Acum glisează fără să ridici degetul și umple restul rândului.';

  @override
  String get tutorialL1Row =>
      'Și rândul acesta e [5]. De data asta glisează dintr-un capăt în altul dintr-o mișcare.';

  @override
  String get tutorialL1AutoCross =>
      'Cele [2] pătrățele ale coloanei au fost găsite, așa că restul au primit singure X. X înseamnă: gol.';

  @override
  String get tutorialL1Column =>
      'Numerele de sus sunt pentru coloane. Coloana aceasta e [5]: glisează de sus în jos.';

  @override
  String get tutorialL1Count =>
      'Rândul acesta are nevoie de [3] pătrățele. Cele cu X sunt goale, deci au rămas exact 3. Umple-le pe toate!';

  @override
  String get tutorialL1Finish =>
      'Termină singur ultimul rând și descoperă imaginea!';

  @override
  String get tutorialL2Groups =>
      '[2 2]: două grupuri separate. 2 pline, cel puțin 1 gol, apoi 2 pline. 2 + 1 + 2 = 5: se potrivește perfect!';

  @override
  String get tutorialL2Cross =>
      'Deci pătrățelul din mijloc e gol. Atinge-l de două ori ca să pui un X.';

  @override
  String get tutorialL2Drag =>
      'X e doar o notiță și nu costă nimic. Acum glisează pe rând: X-ul e sărit.';

  @override
  String get tutorialL2CrossSelf =>
      'Și rândul de dedesubt e [2 2]. E rândul tău: atinge întâi de două ori pătrățelul gol ca să pui un X.';

  @override
  String get tutorialL2DragSelf => 'Acum glisează ca să umpli rândul.';

  @override
  String get tutorialL2Mistakes =>
      'Atenție: dacă umpli un pătrățel greșit, devine un X roșu și pierzi o inimă. Nu ești sigur? Pune întâi un X!';

  @override
  String get tutorialL2Finish =>
      'Restul e al tău! Te-ai blocat? Numără câte pătrățele îi mai trebuie unei linii.';

  @override
  String get tutorialL3Overlap =>
      'Coloana aceasta e [4], cu loc pentru 5. Blocul de 4 stă fie sus de tot, fie jos de tot. Oricum ar fi, cele 3 din mijloc sunt pline!';

  @override
  String get tutorialL3OverlapFill =>
      'Umple aceste pătrățele sigure. Trucul se numește suprapunere: secretul puzzle-urilor mari!';

  @override
  String get tutorialL3OverlapSelf =>
      'Și coloana aceasta e [4]. Găsește singur pătrățelele sigure!';

  @override
  String get tutorialL3OverlapRow =>
      'Și [3]? Împins la stânga sau la dreapta, pătrățelul din mijloc e mereu plin. Umple-l!';

  @override
  String get tutorialL3Finish =>
      'Grozav! Vei folosi des acest truc în puzzle-urile mari. Acum termină imaginea!';

  @override
  String get tutorialL4Ones =>
      'Primele trei rânduri sunt [1 1 1]: trei pătrățele singure, cu goluri între ele. 1 + 1 + 1 + 1 + 1 = 5: se potrivesc perfect!';

  @override
  String get tutorialL4CrossDrag =>
      'Deci primele trei pătrățele din coloana aceasta sunt goale. Atinge de două ori, ține degetul jos la a doua atingere și glisează în jos: trei X dintr-odată!';

  @override
  String get tutorialL4CrossDragSelf =>
      'E rândul tău: trage dintr-o singură mișcare X pe cele trei pătrățele goale din coloana aceasta.';

  @override
  String get tutorialL4Erase =>
      'X greșit? Atinge-l din nou de două ori și dispare. Dacă glisezi cu dublă atingere pornind de pe un X, ștergi X-urile din cale.';

  @override
  String get tutorialL4Finish => 'Super! Acum completează imaginea.';

  @override
  String get tutorialL5Sum =>
      'Ultima lecție! Coloana aceasta e [3 1]: 3 + 1 + 1 = 5, deci e sigură. Rezolv-o singur!';

  @override
  String get tutorialL5Hint =>
      'Te-ai blocat? Apasă Indiciu: îți arată pasul următor și de ce.';

  @override
  String get tutorialL5Finish =>
      'Ești gata! Pe grilele mari, linii groase despart câte 5 pătrățele ca să numeri ușor. Termină imaginea!';
}
