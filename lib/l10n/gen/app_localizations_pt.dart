// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'BlockPuzzle';

  @override
  String get whoIsPlaying => 'Quem vai jogar?';

  @override
  String get newGame => 'Novo jogo';

  @override
  String get emptySlot => 'Espaço vazio';

  @override
  String get yourName => 'Seu nome';

  @override
  String get namePlaceholder => 'Por exemplo, Ana';

  @override
  String get nameRequired => 'Digite um nome';

  @override
  String get pickColor => 'Escolha sua cor';

  @override
  String get start => 'Começar';

  @override
  String get cancel => 'Cancelar';

  @override
  String deleteSlotTitle(String name) {
    return 'Apagar $name?';
  }

  @override
  String get deleteSlotBody =>
      'Todo o progresso deste jogador será apagado. Isso não pode ser desfeito.';

  @override
  String get delete => 'Apagar';

  @override
  String levelLabel(int n) {
    return 'Fase $n';
  }

  @override
  String hintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dicas',
      one: '1 dica',
    );
    return '$_temp0';
  }

  @override
  String get tutorialTap => 'Toque: preencher';

  @override
  String get tutorialDoubleTap =>
      'Toque duplo: colocar X (toque duplo no X de novo: remover)';

  @override
  String get tutorialDrag =>
      'Segure e deslize para marcar vários quadrados de uma vez. Toque duas vezes e deslize a partir de um X para apagar os X.';

  @override
  String get hint => 'Dica';

  @override
  String get noHintsTitle => 'Sem dicas';

  @override
  String get noHintsBody => 'Assista a um anúncio curto para ganhar 1 dica.';

  @override
  String get watchAdForHint => 'Ver anúncio: +1 dica';

  @override
  String get outOfLivesTitle => 'Sem vidas';

  @override
  String get outOfLivesBody =>
      'Assista a um anúncio para ganhar mais 1 vida ou recomece a fase.';

  @override
  String get watchAdForLife => 'Ver anúncio: +1 vida';

  @override
  String get restart => 'Recomeçar';

  @override
  String get backToLevels => 'Voltar às fases';

  @override
  String get levelComplete => 'Muito bem!';

  @override
  String nextLevel(int n) {
    return 'Próxima: Fase $n';
  }

  @override
  String get ok => 'OK';

  @override
  String get allDoneSoon => 'Novas fases em breve';

  @override
  String get adLabel => 'Anúncio';

  @override
  String get adPlaceholder => 'Um anúncio aparecerá aqui';

  @override
  String get adClose => 'Fechar';

  @override
  String adCountdown(int seconds) {
    return '$seconds s';
  }

  @override
  String get rulesTitle => 'Como jogar?';

  @override
  String get rulesClues =>
      'Os números à esquerda e em cima dizem quantos quadrados estão preenchidos naquela linha e coluna. Se houver vários números, os grupos têm pelo menos um espaço entre eles.';

  @override
  String get rulesMistakes =>
      'Preencher um quadrado que deveria ficar vazio custa 1 vida. Os X são livres: anote como quiser. Para preencher um quadrado com X, primeiro remova o X com um toque duplo.';

  @override
  String get rulesScoring =>
      'Cada quadrado certo vale pontos. Acertar em sequência aumenta o multiplicador (até x5). Completar linhas e colunas dá pontos extras.';

  @override
  String levelScore(int score) {
    return '$score pontos';
  }

  @override
  String totalScore(int total) {
    return 'Total: $total';
  }

  @override
  String get rulesGoal =>
      'Encontre todos os quadrados preenchidos e os blocos viram uma imagem escondida.';

  @override
  String worldLabel(int n) {
    return 'Mapa $n';
  }

  @override
  String get worldsTitle => 'Mapas';

  @override
  String get worldUnlocked => 'Novo mapa liberado!';

  @override
  String get worldComplete => 'Mapa concluído!';

  @override
  String nextWorld(String name) {
    return 'Próximo mapa: $name';
  }

  @override
  String nextWorldLocked(String name) {
    return 'Termine este mapa para liberar $name';
  }

  @override
  String nextWorldSoon(String name) {
    return '$name em breve';
  }

  @override
  String get worldLocked => 'Termine o mapa anterior';

  @override
  String get worldSoon => 'Em breve';

  @override
  String get youAreHere => 'Você está aqui';

  @override
  String get mapStart => 'Início';

  @override
  String playLevel(int n) {
    return 'Jogar · Fase $n';
  }

  @override
  String get tapToContinue => 'Toque para continuar';

  @override
  String starCount(int have, int max) {
    return '$have/$max';
  }

  @override
  String get settings => 'Configurações';

  @override
  String get settingsSound => 'Efeitos sonoros';

  @override
  String get settingsLanguage => 'Idioma';

  @override
  String get settingsLanguageDevice => 'Idioma do aparelho';

  @override
  String hintRow(int n) {
    return 'Linha $n';
  }

  @override
  String hintColumn(int n) {
    return 'Coluna $n';
  }

  @override
  String hintFullLine(String line, String clue) {
    return '$line ($clue): os grupos com um espaço entre eles enchem a linha inteira, então cada quadrado está definido. Este quadrado é preenchido!';
  }

  @override
  String hintOverlap(String line, String clue) {
    return '$line ($clue): empurre os grupos para o início ou para o fim, este quadrado sempre fica dentro de um grupo. Então ele é preenchido!';
  }

  @override
  String hintForcedFill(String line, String clue) {
    return '$line ($clue): os quadrados e os X que você já tem limitam onde os grupos cabem. Em toda posição possível este quadrado é preenchido!';
  }

  @override
  String hintForcedEmpty(String line, String clue) {
    return '$line ($clue): nenhum grupo alcança este quadrado, então ele é vazio. Colocamos um X aqui.';
  }

  @override
  String get hintFallback => 'Este quadrado faz parte da imagem.';

  @override
  String get tutorialSkip => 'Pular';

  @override
  String get tutorialGotIt => 'Entendi';

  @override
  String get tutorialL1Fill =>
      'Os números dizem quantos quadrados da linha estão preenchidos. Aqui é 4, então os 4 quadrados estão preenchidos! Toque em um quadrado para preenchê-lo.';

  @override
  String get tutorialL1Drag =>
      'Ótimo! Agora segure o dedo e deslize para preencher o resto da linha.';

  @override
  String get tutorialL1Column =>
      'Quando uma linha ou coluna termina, os outros quadrados ganham um X sozinhos. Esta coluna também é 4: deslize de cima para baixo.';

  @override
  String get tutorialL1Finish => 'Falta uma coluna. Termine a imagem sozinho!';

  @override
  String get tutorialL2Cross =>
      '2 1 quer dizer 2 quadrados preenchidos, pelo menos um espaço e depois 1 quadrado preenchido. 2 + espaço + 1 = 4, então a linha está certa! Toque duas vezes no quadrado vazio para colocar um X.';

  @override
  String get tutorialL2Drag =>
      'Quadrados com o seu X são pulados ao deslizar. Deslize pela linha inteira para preenchê-la.';

  @override
  String get tutorialL2Rules =>
      'Preencher um quadrado errado custa 1 vida; os X são livres. Se travar, o botão Dica também explica o porquê. O resto é com você!';
}
