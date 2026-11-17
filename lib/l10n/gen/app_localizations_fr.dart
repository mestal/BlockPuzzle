// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'BlockPuzzle';

  @override
  String get whoIsPlaying => 'Qui joue ?';

  @override
  String get newGame => 'Nouvelle partie';

  @override
  String get emptySlot => 'Emplacement libre';

  @override
  String get yourName => 'Ton prénom';

  @override
  String get namePlaceholder => 'Par exemple Léa';

  @override
  String get nameRequired => 'Écris un prénom';

  @override
  String get pickColor => 'Choisis ta couleur';

  @override
  String get start => 'Commencer';

  @override
  String get cancel => 'Annuler';

  @override
  String deleteSlotTitle(String name) {
    return 'Supprimer $name ?';
  }

  @override
  String get deleteSlotBody =>
      'Toute la progression de ce joueur sera supprimée. Cette action est irréversible.';

  @override
  String get delete => 'Supprimer';

  @override
  String levelLabel(int n) {
    return 'Niveau $n';
  }

  @override
  String hintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count indices',
      one: '1 indice',
    );
    return '$_temp0';
  }

  @override
  String get tutorialTap => 'Toucher : remplir';

  @override
  String get tutorialDoubleTap =>
      'Toucher deux fois : mettre un X (toucher deux fois un X : l\'enlever)';

  @override
  String get tutorialDrag =>
      'Garde le doigt appuyé et glisse pour marquer plusieurs cases d\'un coup. Touche deux fois puis glisse depuis un X pour effacer les X.';

  @override
  String get hint => 'Indice';

  @override
  String get noHintsTitle => 'Plus d\'indices';

  @override
  String get noHintsBody => 'Regarde une courte pub pour gagner 1 indice.';

  @override
  String get watchAdForHint => 'Regarder une pub : +1 indice';

  @override
  String get outOfLivesTitle => 'Plus de vies';

  @override
  String get outOfLivesBody =>
      'Regarde une pub pour gagner 1 vie de plus, ou recommence le niveau.';

  @override
  String get watchAdForLife => 'Regarder une pub : +1 vie';

  @override
  String get restart => 'Recommencer';

  @override
  String get backToLevels => 'Retour aux niveaux';

  @override
  String get levelComplete => 'Bravo !';

  @override
  String nextLevel(int n) {
    return 'Suivant : niveau $n';
  }

  @override
  String get ok => 'OK';

  @override
  String get allDoneSoon => 'De nouveaux niveaux arrivent bientôt';

  @override
  String get adLabel => 'Pub';

  @override
  String get adPlaceholder => 'Une publicité s\'affichera ici';

  @override
  String get adClose => 'Fermer';

  @override
  String adCountdown(int seconds) {
    return '$seconds s';
  }

  @override
  String get rulesTitle => 'Comment jouer ?';

  @override
  String get rulesClues =>
      'Les nombres à gauche et en haut indiquent combien de cases pleines il y a dans la ligne et la colonne. S\'il y a plusieurs nombres, les groupes sont séparés par au moins une case vide.';

  @override
  String get rulesMistakes =>
      'Remplir une case qui doit rester vide te coûte 1 vie. Les X sont libres : prends des notes comme tu veux. Pour remplir une case avec un X, enlève d\'abord le X en touchant deux fois.';

  @override
  String get rulesScoring =>
      'Chaque bonne case rapporte des points. Enchaîner sans erreur augmente le multiplicateur (jusqu\'à x5). Terminer des lignes et des colonnes donne des points bonus.';

  @override
  String levelScore(int score) {
    return '$score points';
  }

  @override
  String totalScore(int total) {
    return 'Total : $total';
  }

  @override
  String get rulesGoal =>
      'Trouve toutes les cases pleines et les blocs révèlent une image cachée.';

  @override
  String worldLabel(int n) {
    return 'Carte $n';
  }

  @override
  String get worldsTitle => 'Cartes';

  @override
  String get worldUnlocked => 'Nouvelle carte débloquée !';

  @override
  String get worldComplete => 'Carte terminée !';

  @override
  String nextWorld(String name) {
    return 'Carte suivante : $name';
  }

  @override
  String nextWorldLocked(String name) {
    return 'Termine cette carte pour débloquer $name';
  }

  @override
  String nextWorldSoon(String name) {
    return '$name arrive bientôt';
  }

  @override
  String get worldLocked => 'Termine la carte précédente';

  @override
  String get worldSoon => 'Bientôt';

  @override
  String get youAreHere => 'Tu es ici';

  @override
  String get mapStart => 'Départ';

  @override
  String playLevel(int n) {
    return 'Jouer · Niveau $n';
  }

  @override
  String get tapToContinue => 'Touche pour continuer';

  @override
  String starCount(int have, int max) {
    return '$have/$max';
  }

  @override
  String get settings => 'Réglages';

  @override
  String get settingsSound => 'Effets sonores';

  @override
  String get settingsLanguage => 'Langue';

  @override
  String get settingsLanguageDevice => 'Langue de l\'appareil';

  @override
  String hintRow(int n) {
    return 'Ligne $n';
  }

  @override
  String hintColumn(int n) {
    return 'Colonne $n';
  }

  @override
  String hintFullLine(String line, String clue) {
    return '$line ($clue) : les groupes et un espace entre chacun remplissent toute la ligne, chaque case est donc connue. Cette case est pleine !';
  }

  @override
  String hintOverlap(String line, String clue) {
    return '$line ($clue) : que tu pousses les groupes au début ou à la fin, cette case reste toujours dans un groupe. Elle est donc forcément pleine !';
  }

  @override
  String hintForcedFill(String line, String clue) {
    return '$line ($clue) : tes cases et tes X limitent les places possibles des groupes. Dans tous les cas, cette case est pleine !';
  }

  @override
  String hintForcedEmpty(String line, String clue) {
    return '$line ($clue) : aucun groupe ne peut atteindre cette case, elle est donc vide. On y a mis un X.';
  }

  @override
  String get hintFallback => 'Cette case fait partie de l\'image.';
}
