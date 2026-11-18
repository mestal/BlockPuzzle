// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get appTitle => 'Pixel Bloom';

  @override
  String get whoIsPlaying => 'Kuka pelaa?';

  @override
  String get newGame => 'Uusi peli';

  @override
  String get emptySlot => 'Tyhjä paikka';

  @override
  String get yourName => 'Nimesi';

  @override
  String get namePlaceholder => 'Esimerkiksi Aino';

  @override
  String get nameRequired => 'Kirjoita nimi';

  @override
  String get start => 'Aloita';

  @override
  String get cancel => 'Peruuta';

  @override
  String deleteSlotTitle(String name) {
    return 'Poistetaanko $name?';
  }

  @override
  String get deleteSlotBody =>
      'Kaikki tämän pelaajan edistyminen poistetaan. Tätä ei voi perua.';

  @override
  String get delete => 'Poista';

  @override
  String levelLabel(int n) {
    return 'Taso $n';
  }

  @override
  String hintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count vihjettä',
      one: '1 vihje',
    );
    return '$_temp0';
  }

  @override
  String get tutorialTap => 'Napauta: täytä';

  @override
  String get tutorialDoubleTap =>
      'Kaksoisnapauta: merkitse X (kaksoisnapauta X:ää uudelleen: poista se)';

  @override
  String get tutorialDrag =>
      'Pidä painettuna ja liu\'uta merkitäksesi monta ruutua kerralla. Kaksoisnapauta ja liu\'uta X:stä pyyhkiäksesi X-merkit.';

  @override
  String get hint => 'Vihje';

  @override
  String get noHintsTitle => 'Vihjeet loppuivat';

  @override
  String get noHintsBody => 'Katso lyhyt mainos saadaksesi 1 vihjeen.';

  @override
  String get noHintsBodyNoAds => 'Olet käyttänyt kaikki vihjeesi.';

  @override
  String get watchAdForHint => 'Katso mainos: +1 vihje';

  @override
  String get outOfLivesTitle => 'Elämät loppuivat';

  @override
  String get outOfLivesBody =>
      'Katso mainos saadaksesi 1 elämän lisää tai aloita taso alusta.';

  @override
  String get outOfLivesBodyNoAds => 'Aloita taso alusta tai palaa tasoihin.';

  @override
  String get watchAdForLife => 'Katso mainos: +1 elämä';

  @override
  String get restart => 'Aloita alusta';

  @override
  String get backToLevels => 'Takaisin tasoihin';

  @override
  String get levelComplete => 'Mahtavaa!';

  @override
  String nextLevel(int n) {
    return 'Seuraava: taso $n';
  }

  @override
  String get ok => 'OK';

  @override
  String get allDoneSoon => 'Uusia tasoja tulossa pian';

  @override
  String get adLabel => 'Mainos';

  @override
  String get adPlaceholder => 'Tähän tulee mainos';

  @override
  String get adClose => 'Sulje';

  @override
  String adCountdown(int seconds) {
    return '$seconds s';
  }

  @override
  String get rulesTitle => 'Miten pelataan?';

  @override
  String get rulesClues =>
      'Vasemmalla ja ylhäällä olevat numerot kertovat, montako täytettyä ruutua rivillä ja sarakkeessa on. Jos numeroita on useita, ryhmien välissä on vähintään yksi tyhjä ruutu.';

  @override
  String get rulesMistakes =>
      'Tyhjäksi kuuluvan ruudun täyttäminen maksaa 1 elämän. X-merkit ovat ilmaisia: tee muistiinpanoja vapaasti. Jos haluat täyttää X-ruudun, poista X ensin kaksoisnapautuksella.';

  @override
  String get rulesScoring =>
      'Jokainen oikea täyttö tuo pisteitä. Peräkkäiset oikeat täytöt kasvattavat kerrointa (enintään x5). Valmiit rivit ja sarakkeet antavat lisäpisteitä.';

  @override
  String levelScore(int score) {
    return '$score pistettä';
  }

  @override
  String totalScore(int total) {
    return 'Yhteensä: $total';
  }

  @override
  String get rulesGoal =>
      'Löydä kaikki täytetyt ruudut, niin palikat muuttuvat piilokuvaksi.';

  @override
  String worldLabel(int n) {
    return 'Kartta $n';
  }

  @override
  String get worldsTitle => 'Kartat';

  @override
  String get worldUnlocked => 'Uusi kartta avattu!';

  @override
  String get worldComplete => 'Kartta suoritettu!';

  @override
  String nextWorld(String name) {
    return 'Seuraava kartta: $name';
  }

  @override
  String nextWorldLocked(String name) {
    return 'Suorita tämä kartta avataksesi kartan $name';
  }

  @override
  String nextWorldSoon(String name) {
    return '$name tulossa pian';
  }

  @override
  String get worldLocked => 'Suorita edellinen kartta';

  @override
  String get worldSoon => 'Tulossa pian';

  @override
  String get youAreHere => 'Olet tässä';

  @override
  String get mapStart => 'Lähtö';

  @override
  String playLevel(int n) {
    return 'Pelaa · Taso $n';
  }

  @override
  String get tapToContinue => 'Jatka napauttamalla';

  @override
  String starCount(int have, int max) {
    return '$have/$max';
  }

  @override
  String get settings => 'Asetukset';

  @override
  String get settingsSound => 'Äänitehosteet';

  @override
  String get settingsLanguage => 'Kieli';

  @override
  String get settingsLanguageDevice => 'Laitteen kieli';

  @override
  String hintRow(int n) {
    return 'Rivi $n';
  }

  @override
  String hintColumn(int n) {
    return 'Sarake $n';
  }

  @override
  String hintFullLine(String line, String clue) {
    return '$line ($clue): ryhmät ja yksi väli kunkin välissä täyttävät koko linjan, joten jokainen ruutu on varma. Tämä ruutu on täytetty!';
  }

  @override
  String hintOverlap(String line, String clue) {
    return '$line ($clue): työnnä ryhmät alkuun tai loppuun: tämä ruutu on aina ryhmän sisällä. Sen on siis oltava täytetty!';
  }

  @override
  String hintForcedFill(String line, String clue) {
    return '$line ($clue): jo tiedossa olevat ruudut ja X-merkit rajaavat, mihin ryhmät mahtuvat. Jokaisessa mahdollisessa sijoituksessa tämä ruutu on täytetty!';
  }

  @override
  String hintForcedEmpty(String line, String clue) {
    return '$line ($clue): mikään ryhmä ei ulotu tähän ruutuun, joten se on tyhjä. Laitamme tähän X:n.';
  }

  @override
  String get hintFallback => 'Tämä ruutu kuuluu kuvaan.';

  @override
  String get tutorialSkip => 'Ohita';

  @override
  String get tutorialGotIt => 'Selvä';

  @override
  String get tutorialL1Fill =>
      'Numerot kertovat, montako ruutua rivillä on täytetty. Tällä rivillä lukee 5, joten kaikki 5 ruutua ovat täytettyjä! Täytä ruutu napauttamalla sitä.';

  @override
  String get tutorialL1Drag =>
      'Hienoa! Pidä nyt sormea painettuna ja liu\'uta täyttääksesi loput rivistä.';

  @override
  String get tutorialL1Column =>
      'Tässäkin sarakkeessa lukee 5: liu\'uta ylhäältä alas.';

  @override
  String get tutorialL1Finish =>
      'Kun rivi tai sarake on valmis, sen muut ruudut saavat X:n itsestään. Tee loput kuvasta itse!';

  @override
  String get tutorialL2Cross =>
      '2 2 tarkoittaa 2 täytettyä ruutua, vähintään yhtä väliä ja sitten 2 täytettyä ruutua lisää. 2 + väli + 2 = 5, joten rivi on varma! Kaksoisnapauta tyhjää ruutua merkitäksesi X:n.';

  @override
  String get tutorialL2Drag =>
      'Ruudut, joissa on X:si, ohitetaan liu\'uttaessa. Liu\'uta koko rivin yli täyttääksesi sen.';

  @override
  String get tutorialL2Rules =>
      'Väärän ruudun täyttäminen maksaa 1 elämän; X-merkit ovat ilmaisia. Jos jäät jumiin, Vihje-painike kertoo myös miksi. Loppu on sinun käsissäsi!';
}
