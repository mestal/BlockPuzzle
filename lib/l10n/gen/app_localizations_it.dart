// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Pixel Bloom';

  @override
  String get whoIsPlaying => 'Chi gioca?';

  @override
  String get newGame => 'Nuova partita';

  @override
  String get emptySlot => 'Slot libero';

  @override
  String get yourName => 'Il tuo nome';

  @override
  String get namePlaceholder => 'Per esempio Giulia';

  @override
  String get nameRequired => 'Scrivi un nome';

  @override
  String get pickColor => 'Scegli il tuo colore';

  @override
  String get start => 'Inizia';

  @override
  String get cancel => 'Annulla';

  @override
  String deleteSlotTitle(String name) {
    return 'Eliminare $name?';
  }

  @override
  String get deleteSlotBody =>
      'Tutti i progressi di questo giocatore verranno eliminati. L\'operazione non si può annullare.';

  @override
  String get delete => 'Elimina';

  @override
  String levelLabel(int n) {
    return 'Livello $n';
  }

  @override
  String hintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count aiuti',
      one: '1 aiuto',
    );
    return '$_temp0';
  }

  @override
  String get tutorialTap => 'Tocca: riempi';

  @override
  String get tutorialDoubleTap =>
      'Doppio tocco: metti una X (doppio tocco su una X: toglila)';

  @override
  String get tutorialDrag =>
      'Tieni premuto e trascina per segnare molte caselle insieme. Doppio tocco e trascina da una X per cancellare le X.';

  @override
  String get hint => 'Aiuto';

  @override
  String get noHintsTitle => 'Aiuti finiti';

  @override
  String get noHintsBody => 'Guarda una breve pubblicità e ottieni 1 aiuto.';

  @override
  String get noHintsBodyNoAds => 'Hai usato tutti i tuoi suggerimenti.';

  @override
  String get watchAdForHint => 'Guarda pubblicità: +1 aiuto';

  @override
  String get outOfLivesTitle => 'Vite finite';

  @override
  String get outOfLivesBody =>
      'Guarda una pubblicità per avere 1 vita in più, oppure ricomincia il livello.';

  @override
  String get outOfLivesBodyNoAds => 'Ricomincia il livello o torna ai livelli.';

  @override
  String get watchAdForLife => 'Guarda pubblicità: +1 vita';

  @override
  String get restart => 'Ricomincia';

  @override
  String get backToLevels => 'Torna ai livelli';

  @override
  String get levelComplete => 'Fantastico!';

  @override
  String nextLevel(int n) {
    return 'Prossimo: livello $n';
  }

  @override
  String get ok => 'OK';

  @override
  String get allDoneSoon => 'Nuovi livelli in arrivo';

  @override
  String get adLabel => 'Pubblicità';

  @override
  String get adPlaceholder => 'Qui verrà mostrata una pubblicità';

  @override
  String get adClose => 'Chiudi';

  @override
  String adCountdown(int seconds) {
    return '$seconds s';
  }

  @override
  String get rulesTitle => 'Come si gioca?';

  @override
  String get rulesClues =>
      'I numeri a sinistra e in alto indicano quante caselle piene ci sono in quella riga e colonna. Se ci sono più numeri, tra i gruppi c\'è almeno uno spazio vuoto.';

  @override
  String get rulesMistakes =>
      'Se riempi una casella che deve restare vuota perdi 1 vita. Le X sono libere: prendi appunti come vuoi. Per riempire una casella con una X, togli prima la X con un doppio tocco.';

  @override
  String get rulesScoring =>
      'Ogni casella giusta dà punti. Riempire senza errori di fila fa crescere il moltiplicatore (fino a x5). Completare righe e colonne dà punti bonus.';

  @override
  String levelScore(int score) {
    return '$score punti';
  }

  @override
  String totalScore(int total) {
    return 'Totale: $total';
  }

  @override
  String get rulesGoal =>
      'Trova tutte le caselle piene e i blocchi diventeranno un\'immagine nascosta.';

  @override
  String worldLabel(int n) {
    return 'Mappa $n';
  }

  @override
  String get worldsTitle => 'Mappe';

  @override
  String get worldUnlocked => 'Nuova mappa sbloccata!';

  @override
  String get worldComplete => 'Mappa completata!';

  @override
  String nextWorld(String name) {
    return 'Prossima mappa: $name';
  }

  @override
  String nextWorldLocked(String name) {
    return 'Finisci questa mappa per sbloccare $name';
  }

  @override
  String nextWorldSoon(String name) {
    return '$name in arrivo';
  }

  @override
  String get worldLocked => 'Finisci la mappa precedente';

  @override
  String get worldSoon => 'In arrivo';

  @override
  String get youAreHere => 'Sei qui';

  @override
  String get mapStart => 'Partenza';

  @override
  String playLevel(int n) {
    return 'Gioca · Livello $n';
  }

  @override
  String get tapToContinue => 'Tocca per continuare';

  @override
  String starCount(int have, int max) {
    return '$have/$max';
  }

  @override
  String get settings => 'Impostazioni';

  @override
  String get settingsSound => 'Effetti sonori';

  @override
  String get settingsLanguage => 'Lingua';

  @override
  String get settingsLanguageDevice => 'Lingua del dispositivo';

  @override
  String hintRow(int n) {
    return 'Riga $n';
  }

  @override
  String hintColumn(int n) {
    return 'Colonna $n';
  }

  @override
  String hintFullLine(String line, String clue) {
    return '$line ($clue): i gruppi più uno spazio tra ciascuno riempiono tutta la linea, quindi ogni casella è nota. Questa casella è piena!';
  }

  @override
  String hintOverlap(String line, String clue) {
    return '$line ($clue): che tu spinga i gruppi all\'inizio o alla fine, questa casella resta sempre dentro un gruppo. Quindi è sicuramente piena!';
  }

  @override
  String hintForcedFill(String line, String clue) {
    return '$line ($clue): le caselle e le X che hai già limitano dove possono stare i gruppi. In ogni posizione possibile questa casella è piena!';
  }

  @override
  String hintForcedEmpty(String line, String clue) {
    return '$line ($clue): nessun gruppo può arrivare a questa casella, quindi è vuota. Abbiamo messo una X.';
  }

  @override
  String get hintFallback => 'Questa casella fa parte dell\'immagine.';

  @override
  String get tutorialSkip => 'Salta';

  @override
  String get tutorialGotIt => 'Capito';

  @override
  String get tutorialL1Fill =>
      'I numeri dicono quante caselle della riga sono piene. Qui c\'è 5: tutte e 5 le caselle sono piene! Tocca una casella per riempirla.';

  @override
  String get tutorialL1Drag =>
      'Ottimo! Ora tieni premuto il dito e scorri per riempire il resto della riga.';

  @override
  String get tutorialL1Column =>
      'Anche questa colonna dice 5: scorri dall\'alto in basso.';

  @override
  String get tutorialL1Finish =>
      'Quando una riga o colonna è finita, le altre caselle ricevono una X da sole. Completa il resto dell\'immagine da solo!';

  @override
  String get tutorialL2Cross =>
      '2 2 significa 2 caselle piene, almeno uno spazio, poi altre 2 caselle piene. 2 + spazio + 2 = 5: la riga è certa! Tocca due volte la casella vuota per mettere una X.';

  @override
  String get tutorialL2Drag =>
      'Le caselle con la tua X vengono saltate quando scorri. Scorri lungo tutta la riga per riempirla.';

  @override
  String get tutorialL2Rules =>
      'Riempire una casella sbagliata costa 1 vita; le X sono gratis. Se ti blocchi, il pulsante Aiuto spiega anche il perché. Il resto tocca a te!';
}
