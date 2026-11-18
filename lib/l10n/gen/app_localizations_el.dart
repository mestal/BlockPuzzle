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
  String get tutorialL1Fill =>
      'Οι αριθμοί δείχνουν πόσα τετράγωνα της γραμμής είναι γεμάτα. Αυτή η γραμμή λέει 5, άρα και τα 5 τετράγωνα είναι γεμάτα! Πάτησε ένα τετράγωνο για να το γεμίσεις.';

  @override
  String get tutorialL1Drag =>
      'Τέλεια! Τώρα κράτα το δάχτυλο πατημένο και σύρε για να γεμίσεις την υπόλοιπη γραμμή.';

  @override
  String get tutorialL1Column =>
      'Και αυτή η στήλη λέει 5: σύρε από πάνω προς τα κάτω.';

  @override
  String get tutorialL1Finish =>
      'Όταν τελειώνει μια γραμμή ή στήλη, τα υπόλοιπα τετράγωνά της παίρνουν X από μόνα τους. Ολοκλήρωσε την υπόλοιπη εικόνα!';

  @override
  String get tutorialL2Cross =>
      'Το 2 2 σημαίνει 2 γεμάτα τετράγωνα, τουλάχιστον ένα κενό και μετά άλλα 2 γεμάτα. 2 + κενό + 2 = 5, άρα η γραμμή είναι σίγουρη! Πάτησε δύο φορές το κενό τετράγωνο για να βάλεις X.';

  @override
  String get tutorialL2Drag =>
      'Τα τετράγωνα με το δικό σου X παραλείπονται όταν σύρεις. Σύρε σε όλη τη γραμμή για να τη γεμίσεις.';

  @override
  String get tutorialL2Rules =>
      'Αν γεμίσεις λάθος τετράγωνο, χάνεις 1 ζωή· τα X είναι δωρεάν. Αν κολλήσεις, το κουμπί Βοήθεια εξηγεί και το γιατί. Τα υπόλοιπα είναι δικά σου!';
}
