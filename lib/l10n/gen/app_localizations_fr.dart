// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Pixel Bloom';

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
  String get noHintsBodyNoAds => 'Tu as utilisé tous tes indices.';

  @override
  String get watchAdForHint => 'Regarder une pub : +1 indice';

  @override
  String get outOfLivesTitle => 'Plus de vies';

  @override
  String get outOfLivesBody =>
      'Regarde une pub pour gagner 1 vie de plus, ou recommence le niveau.';

  @override
  String get outOfLivesBodyNoAds =>
      'Recommence le niveau ou reviens aux niveaux.';

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

  @override
  String get tutorialSkip => 'Passer';

  @override
  String get tutorialGotIt => 'Compris';

  @override
  String tutorialLesson(int lesson, int count) {
    return 'Leçon $lesson/$count';
  }

  @override
  String get tutorialStart => 'C\'est parti !';

  @override
  String get tutorialSkipTitle => 'Passer le tutoriel ?';

  @override
  String get tutorialSkipBody =>
      'Passer seulement la leçon de ce niveau, ou tout le tutoriel ?';

  @override
  String get tutorialSkipLevel => 'Ce niveau seulement';

  @override
  String get tutorialSkipAll => 'Tout passer';

  @override
  String get tutorialWelcome =>
      'Salut ! Chaque puzzle cache une image. Lis les nombres, remplis les bonnes cases et révèle-la !';

  @override
  String get tutorialL1Fill =>
      '[5] : cette ligne a 5 cases remplies. Elle fait 5 cases, donc elles sont toutes remplies ! Touche-en une.';

  @override
  String get tutorialL1Drag =>
      'Bravo ! Maintenant glisse sans lever le doigt pour remplir le reste de la ligne.';

  @override
  String get tutorialL1Row =>
      'Cette ligne aussi, c\'est [5]. Cette fois, glisse d\'un bout à l\'autre d\'un seul geste.';

  @override
  String get tutorialL1AutoCross =>
      'Les [2] cases de cette colonne sont trouvées : les autres ont reçu un X toutes seules. Un X veut dire : vide.';

  @override
  String get tutorialL1Column =>
      'Les nombres du haut sont pour les colonnes. Cette colonne est [5] : glisse de haut en bas.';

  @override
  String get tutorialL1Count =>
      'Cette ligne a besoin de [3] cases. Les X sont vides : il reste pile 3 cases. Remplis-les toutes !';

  @override
  String get tutorialL1Finish =>
      'Termine la dernière ligne toi-même et révèle l\'image !';

  @override
  String get tutorialL2Groups =>
      '[2 2] : deux groupes séparés. 2 remplies, au moins 1 vide, puis 2 remplies. 2 + 1 + 2 = 5 : ça tient pile !';

  @override
  String get tutorialL2Cross =>
      'Donc la case du milieu est vide. Touche-la deux fois pour y mettre un X.';

  @override
  String get tutorialL2Drag =>
      'Un X est juste une note, il ne coûte rien. Glisse maintenant sur la ligne : le X est sauté.';

  @override
  String get tutorialL2CrossSelf =>
      'La ligne du dessous est aussi [2 2]. À toi : touche d\'abord deux fois la case vide pour y mettre un X.';

  @override
  String get tutorialL2DragSelf => 'Maintenant glisse pour remplir la ligne.';

  @override
  String get tutorialL2Mistakes =>
      'Attention : remplir une mauvaise case la change en X rouge et coûte un cœur. Pas sûr ? Mets d\'abord un X !';

  @override
  String get tutorialL2Finish =>
      'La suite est à toi ! Bloqué ? Compte combien de cases il manque à une ligne.';

  @override
  String get tutorialL3Overlap =>
      'Cette colonne est [4] pour 5 cases. Le bloc de 4 est soit en haut, soit en bas. Dans les deux cas, les 3 du milieu sont remplies !';

  @override
  String get tutorialL3OverlapFill =>
      'Remplis ces cases sûres. Cette astuce s\'appelle le chevauchement : le secret des grands puzzles !';

  @override
  String get tutorialL3OverlapSelf =>
      'Cette colonne est aussi [4]. Trouve toi-même les cases sûres !';

  @override
  String get tutorialL3OverlapRow =>
      'Et [3] ? Poussé à gauche ou à droite, la case du milieu est toujours remplie. Remplis-la !';

  @override
  String get tutorialL3Finish =>
      'Génial ! Tu utiliseras souvent cette astuce dans les grands puzzles. Termine l\'image !';

  @override
  String get tutorialL4Ones =>
      'Les deux lignes du haut sont [1 1 1] : trois cases seules, séparées par des vides. 1 + 1 + 1 + 1 + 1 = 5 : ça tient pile !';

  @override
  String get tutorialL4CrossDrag =>
      'Ces deux cases sont vides. Touche deux fois, garde le doigt posé au second toucher et glisse vers le bas : une ligne de X !';

  @override
  String get tutorialL4CrossDragSelf =>
      'À toi : trace des X sur les deux cases vides de cette colonne.';

  @override
  String get tutorialL4Erase =>
      'Un X de trop ? Touche-le encore deux fois pour l\'enlever. Un double toucher glissé depuis un X efface les X sur son chemin.';

  @override
  String get tutorialL4Finish => 'Super ! Maintenant termine l\'image.';

  @override
  String get tutorialL5Sum =>
      'Dernière leçon ! Cette colonne est [3 1] : 3 + 1 + 1 = 5, c\'est certain. Résous-la toi-même !';

  @override
  String get tutorialL5Hint =>
      'Bloqué ? Appuie sur Indice : il montre l\'étape suivante et explique pourquoi.';

  @override
  String get tutorialL5Finish =>
      'Tu es prêt ! Sur les grandes grilles, des traits épais séparent les cases par 5 pour t\'aider à compter. Termine l\'image !';
}
