// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get appTitle => 'Pixel Bloom';

  @override
  String get whoIsPlaying => 'Ποιος παίζει;';

  @override
  String get newGame => 'Νέο παιχνίδι';

  @override
  String get emptySlot => 'Κενή θέση';

  @override
  String get yourName => 'Το όνομά σου';

  @override
  String get namePlaceholder => 'Για παράδειγμα Νίκος';

  @override
  String get nameRequired => 'Γράψε ένα όνομα';

  @override
  String get start => 'Έναρξη';

  @override
  String get cancel => 'Ακύρωση';

  @override
  String deleteSlotTitle(String name) {
    return 'Διαγραφή: $name;';
  }

  @override
  String get deleteSlotBody =>
      'Όλη η πρόοδος αυτού του παίκτη θα διαγραφεί. Αυτό δεν αναιρείται.';

  @override
  String get delete => 'Διαγραφή';

  @override
  String levelLabel(int n) {
    return 'Επίπεδο $n';
  }

  @override
  String hintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count βοήθειες',
      one: '1 βοήθεια',
    );
    return '$_temp0';
  }

  @override
  String get tutorialTap => 'Πάτημα: γέμισμα';

  @override
  String get tutorialDoubleTap =>
      'Διπλό πάτημα: βάλε X (διπλό πάτημα σε X: αφαίρεση)';

  @override
  String get tutorialDrag =>
      'Κράτα πατημένο και σύρε για να σημειώσεις πολλά τετράγωνα μαζί. Διπλό πάτημα και σύρσιμο από ένα X σβήνει τα X.';

  @override
  String get hint => 'Βοήθεια';

  @override
  String get noHintsTitle => 'Δεν έχεις άλλες βοήθειες';

  @override
  String get noHintsBody =>
      'Δες μια σύντομη διαφήμιση για να πάρεις 1 βοήθεια.';

  @override
  String get noHintsBodyNoAds => 'Χρησιμοποίησες όλες τις βοήθειές σου.';

  @override
  String get watchAdForHint => 'Δες διαφήμιση: +1 βοήθεια';

  @override
  String get outOfLivesTitle => 'Τελείωσαν οι ζωές';

  @override
  String get outOfLivesBody =>
      'Δες μια διαφήμιση για 1 ακόμη ζωή ή ξεκίνα το επίπεδο από την αρχή.';

  @override
  String get outOfLivesBodyNoAds =>
      'Ξεκίνα την πίστα από την αρχή ή γύρνα στις πίστες.';

  @override
  String get watchAdForLife => 'Δες διαφήμιση: +1 ζωή';

  @override
  String get restart => 'Από την αρχή';

  @override
  String get backToLevels => 'Πίσω στα επίπεδα';

  @override
  String get levelComplete => 'Τέλεια!';

  @override
  String nextLevel(int n) {
    return 'Επόμενο: Επίπεδο $n';
  }

  @override
  String get ok => 'OK';

  @override
  String get allDoneSoon => 'Νέα επίπεδα έρχονται σύντομα';

  @override
  String get adLabel => 'Διαφήμιση';

  @override
  String get adPlaceholder => 'Εδώ θα εμφανιστεί μια διαφήμιση';

  @override
  String get adClose => 'Κλείσιμο';

  @override
  String adCountdown(int seconds) {
    return '$seconds δ';
  }

  @override
  String get rulesTitle => 'Πώς παίζεται;';

  @override
  String get rulesClues =>
      'Οι αριθμοί αριστερά και πάνω δείχνουν πόσα γεμάτα τετράγωνα έχει κάθε γραμμή και στήλη. Αν υπάρχουν πολλοί αριθμοί, οι ομάδες χωρίζονται με τουλάχιστον ένα κενό.';

  @override
  String get rulesMistakes =>
      'Αν γεμίσεις τετράγωνο που πρέπει να μείνει κενό, χάνεις 1 ζωή. Τα X είναι δωρεάν: κράτα σημειώσεις όπως θέλεις. Για να γεμίσεις τετράγωνο με X, αφαίρεσε πρώτα το X με διπλό πάτημα.';

  @override
  String get rulesScoring =>
      'Κάθε σωστό γέμισμα δίνει πόντους. Τα συνεχόμενα σωστά γεμίσματα αυξάνουν τον πολλαπλασιαστή (έως x5). Οι ολοκληρωμένες γραμμές και στήλες δίνουν πόντους μπόνους.';

  @override
  String levelScore(int score) {
    return '$score πόντοι';
  }

  @override
  String totalScore(int total) {
    return 'Σύνολο: $total';
  }

  @override
  String get rulesGoal =>
      'Βρες όλα τα γεμάτα τετράγωνα και τα τουβλάκια θα γίνουν μια κρυμμένη εικόνα.';

  @override
  String worldLabel(int n) {
    return 'Χάρτης $n';
  }

  @override
  String get worldsTitle => 'Χάρτες';

  @override
  String get worldUnlocked => 'Ξεκλείδωσε νέος χάρτης!';

  @override
  String get worldComplete => 'Ο χάρτης ολοκληρώθηκε!';

  @override
  String nextWorld(String name) {
    return 'Επόμενος χάρτης: $name';
  }

  @override
  String nextWorldLocked(String name) {
    return 'Ολοκλήρωσε αυτόν τον χάρτη για να ξεκλειδώσεις: $name';
  }

  @override
  String nextWorldSoon(String name) {
    return '$name: έρχεται σύντομα';
  }

  @override
  String get worldLocked => 'Ολοκλήρωσε τον προηγούμενο χάρτη';

  @override
  String get worldSoon => 'Σύντομα';

  @override
  String get youAreHere => 'Είσαι εδώ';

  @override
  String get mapStart => 'Αφετηρία';

  @override
  String playLevel(int n) {
    return 'Παίξε · Επίπεδο $n';
  }

  @override
  String get tapToContinue => 'Πάτησε για να συνεχίσεις';

  @override
  String starCount(int have, int max) {
    return '$have/$max';
  }

  @override
  String get settings => 'Ρυθμίσεις';

  @override
  String get settingsSound => 'Ηχητικά εφέ';

  @override
  String get settingsLanguage => 'Γλώσσα';

  @override
  String get settingsLanguageDevice => 'Γλώσσα συσκευής';

  @override
  String hintRow(int n) {
    return 'Γραμμή $n';
  }

  @override
  String hintColumn(int n) {
    return 'Στήλη $n';
  }

  @override
  String hintFullLine(String line, String clue) {
    return '$line ($clue): οι ομάδες μαζί με ένα κενό ανάμεσά τους γεμίζουν όλη τη σειρά, άρα κάθε τετράγωνο είναι σίγουρο. Αυτό το τετράγωνο είναι γεμάτο!';
  }

  @override
  String hintOverlap(String line, String clue) {
    return '$line ($clue): σπρώξε τις ομάδες στην αρχή ή στο τέλος· αυτό το τετράγωνο είναι πάντα μέσα σε μια ομάδα. Άρα πρέπει να είναι γεμάτο!';
  }

  @override
  String hintForcedFill(String line, String clue) {
    return '$line ($clue): τα τετράγωνα και τα X που έχεις ήδη περιορίζουν πού χωράνε οι ομάδες. Σε κάθε πιθανή διάταξη αυτό το τετράγωνο είναι γεμάτο!';
  }

  @override
  String hintForcedEmpty(String line, String clue) {
    return '$line ($clue): καμία ομάδα δεν φτάνει σε αυτό το τετράγωνο, άρα είναι κενό. Βάζουμε εδώ ένα X.';
  }

  @override
  String get hintFallback => 'Αυτό το τετράγωνο είναι μέρος της εικόνας.';

  @override
  String get tutorialSkip => 'Παράλειψη';

  @override
  String get tutorialGotIt => 'Κατάλαβα';

  @override
  String tutorialLesson(int lesson, int count) {
    return 'Μάθημα $lesson/$count';
  }

  @override
  String get tutorialStart => 'Πάμε!';

  @override
  String get tutorialSkipTitle => 'Παράλειψη οδηγού;';

  @override
  String get tutorialSkipBody =>
      'Να παραλειφθεί μόνο το μάθημα αυτού του επιπέδου ή όλος ο οδηγός;';

  @override
  String get tutorialSkipLevel => 'Μόνο αυτό το επίπεδο';

  @override
  String get tutorialSkipAll => 'Παράλειψη όλων';

  @override
  String get tutorialWelcome =>
      'Γεια! Κάθε γρίφος κρύβει μια εικόνα. Διάβασε τους αριθμούς, γέμισε τα σωστά τετράγωνα και αποκάλυψέ την!';

  @override
  String get tutorialL1Fill =>
      '[5]: αυτή η γραμμή έχει 5 γεμάτα τετράγωνα. Η γραμμή έχει 5 τετράγωνα, άρα γεμίζουν όλα! Πάτησε ένα.';

  @override
  String get tutorialL1Drag =>
      'Τέλεια! Τώρα σύρε χωρίς να σηκώσεις το δάχτυλο και γέμισε την υπόλοιπη γραμμή.';

  @override
  String get tutorialL1Row =>
      'Και αυτή η γραμμή είναι [5]. Αυτή τη φορά σύρε από άκρη σε άκρη με μια κίνηση.';

  @override
  String get tutorialL1AutoCross =>
      'Τα [2] τετράγωνα αυτής της στήλης βρέθηκαν, οπότε τα άλλα πήραν X μόνα τους. Το X σημαίνει: κενό.';

  @override
  String get tutorialL1Column =>
      'Οι αριθμοί πάνω είναι για τις στήλες. Αυτή η στήλη είναι [5]: σύρε από πάνω προς τα κάτω.';

  @override
  String get tutorialL1Count =>
      'Αυτή η γραμμή θέλει [3] τετράγωνα. Τα X είναι κενά, άρα μένουν ακριβώς 3. Γέμισέ τα όλα!';

  @override
  String get tutorialL1Finish =>
      'Τελείωσε μόνος σου την τελευταία γραμμή και αποκάλυψε την εικόνα!';

  @override
  String get tutorialL2Groups =>
      '[2 2]: δύο ξεχωριστές ομάδες. 2 γεμάτα, τουλάχιστον 1 κενό, μετά 2 γεμάτα. 2 + 1 + 2 = 5: χωράει ακριβώς!';

  @override
  String get tutorialL2Cross =>
      'Άρα το μεσαίο τετράγωνο είναι κενό. Πάτησέ το δύο φορές για να βάλεις X.';

  @override
  String get tutorialL2Drag =>
      'Το X είναι απλώς σημείωση και δεν κοστίζει τίποτα. Τώρα σύρε σε όλη τη γραμμή: το X παραλείπεται.';

  @override
  String get tutorialL2CrossSelf =>
      'Και η από κάτω γραμμή είναι [2 2]. Σειρά σου: βάλε πρώτα X στο κενό τετράγωνο.';

  @override
  String get tutorialL2DragSelf => 'Τώρα σύρε για να γεμίσεις τη γραμμή.';

  @override
  String get tutorialL2Mistakes =>
      'Προσοχή: αν γεμίσεις λάθος τετράγωνο, γίνεται κόκκινο X και χάνεις μια καρδιά. Δεν είσαι σίγουρος; Βάλε πρώτα X!';

  @override
  String get tutorialL2Finish =>
      'Τα υπόλοιπα είναι δικά σου! Κόλλησες; Μέτρα πόσα τετράγωνα λείπουν από μια γραμμή.';

  @override
  String get tutorialL3Overlap =>
      'Αυτή η στήλη είναι [4] με χώρο για 5. Το μπλοκ των 4 είναι είτε τέρμα πάνω είτε τέρμα κάτω. Σε κάθε περίπτωση τα 3 μεσαία είναι γεμάτα!';

  @override
  String get tutorialL3OverlapFill =>
      'Γέμισε αυτά τα σίγουρα τετράγωνα. Το κόλπο λέγεται επικάλυψη: το μυστικό των μεγάλων γρίφων!';

  @override
  String get tutorialL3OverlapSelf =>
      'Και αυτή η στήλη είναι [4]. Βρες μόνος σου τα σίγουρα τετράγωνα!';

  @override
  String get tutorialL3OverlapRow =>
      'Και το [3]; Είτε αριστερά είτε δεξιά, το μεσαίο τετράγωνο είναι πάντα γεμάτο. Γέμισέ το!';

  @override
  String get tutorialL3Finish =>
      'Υπέροχα! Θα χρησιμοποιείς συχνά αυτό το κόλπο στους μεγάλους γρίφους. Τώρα τελείωσε την εικόνα!';

  @override
  String get tutorialL4Ones =>
      'Οι δύο πάνω γραμμές είναι [1 1 1]: τρία μονά τετράγωνα με κενά ανάμεσα. 1 + 1 + 1 + 1 + 1 = 5: χωράνε ακριβώς!';

  @override
  String get tutorialL4CrossDrag =>
      'Αυτά τα δύο τετράγωνα είναι κενά. Πάτησε δύο φορές, κράτα το δάχτυλο στο δεύτερο πάτημα και σύρε κάτω: μια γραμμή από X!';

  @override
  String get tutorialL4CrossDragSelf =>
      'Σειρά σου: βάλε X στα δύο κενά τετράγωνα αυτής της στήλης.';

  @override
  String get tutorialL4Erase =>
      'Λάθος X; Πάτησέ το ξανά δύο φορές για να φύγει. Αν σύρεις με διπλό πάτημα ξεκινώντας από X, σβήνεις τα X που περνάς.';

  @override
  String get tutorialL4Finish => 'Σούπερ! Τώρα ολοκλήρωσε την εικόνα.';

  @override
  String get tutorialL5Sum =>
      'Τελευταίο μάθημα! Αυτή η στήλη είναι [3 1]: 3 + 1 + 1 = 5, άρα είναι σίγουρη. Λύσ’ την μόνος σου!';

  @override
  String get tutorialL5Hint =>
      'Κόλλησες; Πάτησε Βοήθεια: δείχνει το επόμενο βήμα και εξηγεί γιατί.';

  @override
  String get tutorialL5Finish =>
      'Είσαι έτοιμος! Στα μεγάλα πλέγματα, χοντρές γραμμές χωρίζουν ανά 5 τετράγωνα για να μετράς εύκολα. Τελείωσε την εικόνα!';
}
