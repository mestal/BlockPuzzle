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
  String tutorialLesson(int lesson, int count) {
    return 'Lezione $lesson/$count';
  }

  @override
  String get tutorialStart => 'Si parte!';

  @override
  String get tutorialSkipTitle => 'Saltare il tutorial?';

  @override
  String get tutorialSkipBody =>
      'Vuoi saltare solo la lezione di questo livello o tutto il tutorial?';

  @override
  String get tutorialSkipLevel => 'Solo questo livello';

  @override
  String get tutorialSkipAll => 'Salta tutto';

  @override
  String get tutorialWelcome =>
      'Ciao! Ogni puzzle nasconde un\'immagine. Leggi i numeri, riempi le caselle giuste e scoprila!';

  @override
  String get tutorialL1Fill =>
      '[5]: questa riga ha 5 caselle piene. La riga è lunga 5, quindi sono tutte piene! Toccane una.';

  @override
  String get tutorialL1Drag =>
      'Ottimo! Ora scorri senza alzare il dito per riempire il resto della riga.';

  @override
  String get tutorialL1Row =>
      'Anche questa riga è [5]. Stavolta scorri da un capo all\'altro in un colpo solo.';

  @override
  String get tutorialL1AutoCross =>
      'Le [2] caselle di questa colonna sono trovate, così le altre hanno ricevuto una X da sole. X vuol dire: vuota.';

  @override
  String get tutorialL1Column =>
      'I numeri in alto sono per le colonne. Questa colonna è [5]: scorri dall\'alto in basso.';

  @override
  String get tutorialL1Count =>
      'Questa riga vuole [3] caselle. Le X sono vuote, quindi ne restano proprio 3. Riempile tutte!';

  @override
  String get tutorialL1Finish =>
      'Finisci tu l\'ultima riga e scopri l\'immagine!';

  @override
  String get tutorialL2Groups =>
      '[2 2]: due gruppi separati. 2 piene, almeno 1 vuota, poi 2 piene. 2 + 1 + 2 = 5: entra giusto giusto!';

  @override
  String get tutorialL2Cross =>
      'Quindi la casella centrale è vuota. Toccala due volte per metterci una X.';

  @override
  String get tutorialL2Drag =>
      'Una X è solo un appunto e non costa nulla. Ora scorri sulla riga: la X viene saltata.';

  @override
  String get tutorialL2CrossSelf =>
      'Anche la riga sotto è [2 2]. Tocca a te: prima tocca due volte la casella vuota per metterci una X.';

  @override
  String get tutorialL2DragSelf => 'Ora scorri per riempire la riga.';

  @override
  String get tutorialL2Mistakes =>
      'Attenzione: riempire una casella sbagliata la trasforma in una X rossa e costa un cuore. Hai dubbi? Metti prima una X!';

  @override
  String get tutorialL2Finish =>
      'Il resto è tuo! Bloccato? Conta quante caselle mancano a una linea.';

  @override
  String get tutorialL3Overlap =>
      'Questa colonna è [4] e c\'è posto per 5. Il blocco da 4 sta tutto in alto o tutto in basso. In entrambi i casi le 3 centrali sono piene!';

  @override
  String get tutorialL3OverlapFill =>
      'Riempi queste caselle sicure. Il trucco si chiama sovrapposizione: il segreto dei puzzle grandi!';

  @override
  String get tutorialL3OverlapSelf =>
      'Anche questa colonna è [4]. Trova tu le caselle sicure!';

  @override
  String get tutorialL3OverlapRow =>
      'E [3]? Spinto a sinistra o a destra, la casella centrale è sempre piena. Riempila!';

  @override
  String get tutorialL3Finish =>
      'Grande! Userai spesso questo trucco nei puzzle grandi. Ora finisci l\'immagine!';

  @override
  String get tutorialL4Ones =>
      'Le prime tre righe sono [1 1 1]: tre caselle singole con spazi in mezzo. 1 + 1 + 1 + 1 + 1 = 5: entrano giuste!';

  @override
  String get tutorialL4CrossDrag =>
      'Quindi le tre caselle in alto di questa colonna sono vuote. Tocca due volte, tieni giù il dito al secondo tocco e scorri in basso: tre X in un colpo!';

  @override
  String get tutorialL4CrossDragSelf =>
      'Tocca a te: traccia in un solo gesto le X sulle tre caselle vuote di questa colonna.';

  @override
  String get tutorialL4Erase =>
      'X sbagliata? Toccala di nuovo due volte per toglierla. Scorrendo con doppio tocco da una X, cancelli le X che incontri.';

  @override
  String get tutorialL4Finish => 'Super! Ora completa l\'immagine.';

  @override
  String get tutorialL5Gaps =>
      'Ultima lezione: risolvere con le X! Le quattro colonne esterne sono [2 2]: 2 + 1 + 2 = 5. Tutti i loro spazi vuoti cadono nella riga centrale.';

  @override
  String get tutorialL5CrossDrag =>
      'Segna queste caselle vuote: tocca due volte, tieni giù il dito al secondo tocco e scorri di lato. Due X in un colpo!';

  @override
  String get tutorialL5CrossDragSelf =>
      'Tocca a te: traccia in un solo gesto le X sulle due caselle vuote a destra.';

  @override
  String get tutorialL5Count =>
      'Questa riga è [1] e, dopo le X, resta una sola casella. Le X rendono facile contare: riempila!';

  @override
  String get tutorialL5Hint =>
      'Bloccato? Premi Aiuto: ti mostra il passo successivo e il perché.';

  @override
  String get tutorialL5Finish =>
      'Sei pronto! Nelle griglie grandi, linee spesse dividono le caselle a gruppi di 5 per aiutarti a contare. Finisci l\'immagine!';
}
