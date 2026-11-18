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
  String tutorialLesson(int lesson, int count) {
    return 'Oppitunti $lesson/$count';
  }

  @override
  String get tutorialStart => 'Aloitetaan!';

  @override
  String get tutorialSkipTitle => 'Ohitetaanko opastus?';

  @override
  String get tutorialSkipBody =>
      'Ohitetaanko vain tämän tason oppitunti vai koko opastus?';

  @override
  String get tutorialSkipLevel => 'Vain tämä taso';

  @override
  String get tutorialSkipAll => 'Ohita kaikki';

  @override
  String get tutorialWelcome =>
      'Hei! Jokaisessa ristikossa on piilossa kuva. Lue numerot, täytä oikeat ruudut ja paljasta se!';

  @override
  String get tutorialL1Fill =>
      '[5]: tällä rivillä on 5 täytettyä ruutua. Rivi on 5 ruudun mittainen, joten kaikki täytetään! Napauta yhtä.';

  @override
  String get tutorialL1Drag =>
      'Hienoa! Liu’uta nyt sormea nostamatta ja täytä loput rivistä.';

  @override
  String get tutorialL1Row =>
      'Tämäkin rivi on [5]. Liu’uta tällä kertaa päästä päähän yhdellä vedolla.';

  @override
  String get tutorialL1AutoCross =>
      'Sarakkeen [2] ruutua löytyi, joten muut saivat X:n itsestään. X tarkoittaa: tyhjä.';

  @override
  String get tutorialL1Column =>
      'Ylhäällä olevat numerot kuuluvat sarakkeille. Tämä sarake on [5]: liu’uta ylhäältä alas.';

  @override
  String get tutorialL1Count =>
      'Tähän riviin tarvitaan [3] ruutua. X-ruudut ovat tyhjiä, joten jäljellä on tasan 3. Täytä ne kaikki!';

  @override
  String get tutorialL1Finish => 'Täytä viimeinen rivi itse ja paljasta kuva!';

  @override
  String get tutorialL2Groups =>
      '[2 2]: kaksi erillistä ryhmää. 2 täytettyä, vähintään 1 tyhjä, sitten 2 täytettyä. 2 + 1 + 2 = 5: mahtuu juuri!';

  @override
  String get tutorialL2Cross =>
      'Keskimmäinen ruutu on siis tyhjä. Kaksoisnapauta sitä merkitäksesi X:n.';

  @override
  String get tutorialL2Drag =>
      'X on vain muistiinpano eikä maksa mitään. Liu’uta nyt rivin yli: X-ruutu ohitetaan.';

  @override
  String get tutorialL2CrossSelf =>
      'Alempikin rivi on [2 2]. Sinun vuorosi: kaksoisnapauta ensin tyhjää ruutua merkitäksesi X:n.';

  @override
  String get tutorialL2DragSelf => 'Liu’uta nyt ja täytä rivi.';

  @override
  String get tutorialL2Mistakes =>
      'Varo: väärän ruudun täyttäminen tekee siitä punaisen X:n ja maksaa sydämen. Epävarma? Merkitse ensin X!';

  @override
  String get tutorialL2Finish =>
      'Loput ovat sinun! Jumissa? Laske, montako ruutua linjalta vielä puuttuu.';

  @override
  String get tutorialL3Overlap =>
      'Tämä sarake on [4], ja tilaa on 5 ruudulle. Neljän palikka on joko ihan ylhäällä tai ihan alhaalla. Kummin vain, keskimmäiset 3 ovat täytettyjä!';

  @override
  String get tutorialL3OverlapFill =>
      'Täytä nämä varmat ruudut. Temppu on nimeltään päällekkäisyys: suurten ristikoiden salaisuus!';

  @override
  String get tutorialL3OverlapSelf =>
      'Tämäkin sarake on [4]. Etsi varmat ruudut itse!';

  @override
  String get tutorialL3OverlapRow =>
      'Entä [3]? Vasemmalle tai oikealle työnnettynä keskiruutu on aina täytetty. Täytä se!';

  @override
  String get tutorialL3Finish =>
      'Mahtavaa! Tätä temppua käytät usein isoissa ristikoissa. Viimeistele nyt kuva!';

  @override
  String get tutorialL4Ones =>
      'Kaksi ylintä riviä ovat [1 1 1]: kolme yksittäistä ruutua välein. 1 + 1 + 1 + 1 + 1 = 5: mahtuvat juuri!';

  @override
  String get tutorialL4CrossDrag =>
      'Nämä kaksi ruutua ovat tyhjiä. Kaksoisnapauta, pidä sormi alhaalla toisella napautuksella ja liu’uta alas: X-viiva!';

  @override
  String get tutorialL4CrossDragSelf =>
      'Sinun vuorosi: vedä X:t tämän sarakkeen kahteen tyhjään ruutuun.';

  @override
  String get tutorialL4Erase =>
      'Väärä X? Kaksoisnapauta sitä uudestaan, niin se katoaa. Kaksoisnapautusliu’utus X:stä alkaen pyyhkii matkan X:t.';

  @override
  String get tutorialL4Finish => 'Huippua! Viimeistele nyt kuva.';

  @override
  String get tutorialL5Sum =>
      'Viimeinen oppitunti! Tämä sarake on [3 1]: 3 + 1 + 1 = 5, joten se on varma. Ratkaise se itse!';

  @override
  String get tutorialL5Hint =>
      'Jumissa? Paina Vihje: se näyttää seuraavan askeleen ja kertoo miksi.';

  @override
  String get tutorialL5Finish =>
      'Olet valmis! Isoissa ruudukoissa paksut viivat jakavat ruudut viitosiin, mikä helpottaa laskemista. Viimeistele kuva!';
}
