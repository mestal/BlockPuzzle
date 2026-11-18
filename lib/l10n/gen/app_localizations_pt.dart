// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Pixel Bloom';

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
  String get noHintsBodyNoAds => 'Você usou todas as suas dicas.';

  @override
  String get watchAdForHint => 'Ver anúncio: +1 dica';

  @override
  String get outOfLivesTitle => 'Sem vidas';

  @override
  String get outOfLivesBody =>
      'Assista a um anúncio para ganhar mais 1 vida ou recomece a fase.';

  @override
  String get outOfLivesBodyNoAds => 'Recomece o nível ou volte aos níveis.';

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
  String tutorialLesson(int lesson, int count) {
    return 'Lição $lesson/$count';
  }

  @override
  String get tutorialStart => 'Vamos lá!';

  @override
  String get tutorialSkipTitle => 'Pular o tutorial?';

  @override
  String get tutorialSkipBody =>
      'Pular só a lição desta fase ou o tutorial inteiro?';

  @override
  String get tutorialSkipLevel => 'Só esta fase';

  @override
  String get tutorialSkipAll => 'Pular tudo';

  @override
  String get tutorialWelcome =>
      'Olá! Cada quebra-cabeça esconde uma imagem. Leia os números, preencha os quadrados certos e revele-a!';

  @override
  String get tutorialL1Fill =>
      '[5]: esta linha tem 5 quadrados preenchidos. Ela tem 5 quadrados, então todos estão preenchidos! Toque em um.';

  @override
  String get tutorialL1Drag =>
      'Ótimo! Agora deslize sem tirar o dedo para preencher o resto da linha.';

  @override
  String get tutorialL1Row =>
      'Esta linha também é [5]. Desta vez, deslize de ponta a ponta de uma vez.';

  @override
  String get tutorialL1AutoCross =>
      'Os [2] quadrados desta coluna foram achados, então os outros ganharam um X sozinhos. X quer dizer: vazio.';

  @override
  String get tutorialL1Column =>
      'Os números de cima são das colunas. Esta coluna é [5]: deslize de cima para baixo.';

  @override
  String get tutorialL1Count =>
      'Esta linha precisa de [3] quadrados. Os X são vazios, então sobram exatamente 3. Preencha todos!';

  @override
  String get tutorialL1Finish =>
      'Termine a última linha sozinho e revele a imagem!';

  @override
  String get tutorialL2Groups =>
      '[2 2]: dois grupos separados. 2 preenchidos, pelo menos 1 vazio, depois 2 preenchidos. 2 + 1 + 2 = 5: cabe certinho!';

  @override
  String get tutorialL2Cross =>
      'Então o quadrado do meio é vazio. Toque duas vezes nele para pôr um X.';

  @override
  String get tutorialL2Drag =>
      'Um X é só uma anotação; não custa nada. Agora deslize pela linha: o X é pulado.';

  @override
  String get tutorialL2CrossSelf =>
      'A linha de baixo também é [2 2]. Sua vez: primeiro toque duas vezes no quadrado vazio para pôr um X.';

  @override
  String get tutorialL2DragSelf => 'Agora deslize para preencher a linha.';

  @override
  String get tutorialL2Mistakes =>
      'Cuidado: preencher um quadrado errado vira um X vermelho e custa um coração. Na dúvida, ponha um X primeiro!';

  @override
  String get tutorialL2Finish =>
      'O resto é com você! Travou? Conte quantos quadrados ainda faltam numa linha.';

  @override
  String get tutorialL3Overlap =>
      'Esta coluna é [4] e cabem 5. O bloco de 4 fica lá em cima ou lá embaixo. Nos dois casos, os 3 do meio estão preenchidos!';

  @override
  String get tutorialL3OverlapFill =>
      'Preencha esses quadrados certos. Esse truque se chama sobreposição: o segredo dos quebra-cabeças grandes!';

  @override
  String get tutorialL3OverlapSelf =>
      'Esta coluna também é [4]. Encontre você os quadrados certos!';

  @override
  String get tutorialL3OverlapRow =>
      'E [3]? Encostado à esquerda ou à direita, o quadrado do meio está sempre preenchido. Preencha-o!';

  @override
  String get tutorialL3Finish =>
      'Ótimo! Você vai usar muito esse truque nos quebra-cabeças grandes. Agora termine a imagem!';

  @override
  String get tutorialL4Ones =>
      'As três linhas de cima são [1 1 1]: três quadrados sozinhos com espaços entre eles. 1 + 1 + 1 + 1 + 1 = 5: cabem certinho!';

  @override
  String get tutorialL4CrossDrag =>
      'Então os três quadrados de cima desta coluna são vazios. Toque duas vezes, mantenha o dedo no segundo toque e deslize para baixo: três X de uma vez!';

  @override
  String get tutorialL4CrossDragSelf =>
      'Sua vez: desenhe X de uma só vez nos três quadrados vazios desta coluna.';

  @override
  String get tutorialL4Erase =>
      'X errado? Toque duas vezes nele de novo para tirá-lo. Deslizando com toque duplo a partir de um X, você apaga os X do caminho.';

  @override
  String get tutorialL4Finish => 'Isso! Agora complete a imagem.';

  @override
  String get tutorialL5Sum =>
      'Última lição! Esta coluna é [3 1]: 3 + 1 + 1 = 5, então é certa. Resolva sozinho!';

  @override
  String get tutorialL5Hint =>
      'Travou? Toque em Dica: ela mostra o próximo passo e explica por quê.';

  @override
  String get tutorialL5Finish =>
      'Você está pronto! Nas grades grandes, linhas grossas separam a cada 5 quadrados para ajudar a contar. Termine a imagem!';
}
