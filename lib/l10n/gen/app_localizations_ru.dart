// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Pixel Bloom';

  @override
  String get whoIsPlaying => 'Кто играет?';

  @override
  String get newGame => 'Новая игра';

  @override
  String get emptySlot => 'Пустой слот';

  @override
  String get yourName => 'Твоё имя';

  @override
  String get namePlaceholder => 'Например, Саша';

  @override
  String get nameRequired => 'Введи имя';

  @override
  String get pickColor => 'Выбери цвет';

  @override
  String get start => 'Начать';

  @override
  String get cancel => 'Отмена';

  @override
  String deleteSlotTitle(String name) {
    return 'Удалить $name?';
  }

  @override
  String get deleteSlotBody =>
      'Весь прогресс этого игрока будет удалён. Это нельзя отменить.';

  @override
  String get delete => 'Удалить';

  @override
  String levelLabel(int n) {
    return 'Уровень $n';
  }

  @override
  String hintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count подсказки',
      many: '$count подсказок',
      few: '$count подсказки',
      one: '$count подсказка',
    );
    return '$_temp0';
  }

  @override
  String get tutorialTap => 'Касание: закрасить';

  @override
  String get tutorialDoubleTap =>
      'Двойное касание: поставить X (ещё раз на X: убрать)';

  @override
  String get tutorialDrag =>
      'Зажми и проведи, чтобы отметить много клеток сразу. Двойное касание и проведение от X стирает крестики.';

  @override
  String get hint => 'Подсказка';

  @override
  String get noHintsTitle => 'Подсказки закончились';

  @override
  String get noHintsBody => 'Посмотри короткую рекламу и получи 1 подсказку.';

  @override
  String get noHintsBodyNoAds => 'Ты использовал все подсказки.';

  @override
  String get watchAdForHint => 'Реклама: +1 подсказка';

  @override
  String get outOfLivesTitle => 'Жизни закончились';

  @override
  String get outOfLivesBody =>
      'Посмотри рекламу, чтобы получить ещё 1 жизнь, или начни уровень заново.';

  @override
  String get outOfLivesBodyNoAds =>
      'Начни уровень заново или вернись к уровням.';

  @override
  String get watchAdForLife => 'Реклама: +1 жизнь';

  @override
  String get restart => 'Заново';

  @override
  String get backToLevels => 'К уровням';

  @override
  String get levelComplete => 'Отлично!';

  @override
  String nextLevel(int n) {
    return 'Далее: уровень $n';
  }

  @override
  String get ok => 'ОК';

  @override
  String get allDoneSoon => 'Новые уровни скоро';

  @override
  String get adLabel => 'Реклама';

  @override
  String get adPlaceholder => 'Здесь будет реклама';

  @override
  String get adClose => 'Закрыть';

  @override
  String adCountdown(int seconds) {
    return '$seconds с';
  }

  @override
  String get rulesTitle => 'Как играть?';

  @override
  String get rulesClues =>
      'Числа слева и сверху показывают, сколько клеток закрашено в этой строке и столбце. Если чисел несколько, между группами есть хотя бы одна пустая клетка.';

  @override
  String get rulesMistakes =>
      'Закрасишь клетку, которая должна быть пустой, — потеряешь 1 жизнь. Крестики ставить можно свободно: это твои заметки. Чтобы закрасить клетку с X, сначала убери X двойным касанием.';

  @override
  String get rulesScoring =>
      'Каждая верная клетка приносит очки. Чем дольше без ошибок, тем выше множитель (до x5). За готовые строки и столбцы — бонус.';

  @override
  String levelScore(int score) {
    return '$score очков';
  }

  @override
  String totalScore(int total) {
    return 'Всего: $total';
  }

  @override
  String get rulesGoal =>
      'Найди все закрашенные клетки, и блоки превратятся в скрытую картинку.';

  @override
  String worldLabel(int n) {
    return 'Карта $n';
  }

  @override
  String get worldsTitle => 'Карты';

  @override
  String get worldUnlocked => 'Новая карта открыта!';

  @override
  String get worldComplete => 'Карта пройдена!';

  @override
  String nextWorld(String name) {
    return 'Следующая карта: $name';
  }

  @override
  String nextWorldLocked(String name) {
    return 'Пройди эту карту, чтобы открыть «$name»';
  }

  @override
  String nextWorldSoon(String name) {
    return '«$name» скоро';
  }

  @override
  String get worldLocked => 'Пройди предыдущую карту';

  @override
  String get worldSoon => 'Скоро';

  @override
  String get youAreHere => 'Ты здесь';

  @override
  String get mapStart => 'Старт';

  @override
  String playLevel(int n) {
    return 'Играть · уровень $n';
  }

  @override
  String get tapToContinue => 'Коснись, чтобы продолжить';

  @override
  String starCount(int have, int max) {
    return '$have/$max';
  }

  @override
  String get settings => 'Настройки';

  @override
  String get settingsSound => 'Звуковые эффекты';

  @override
  String get settingsLanguage => 'Язык';

  @override
  String get settingsLanguageDevice => 'Язык устройства';

  @override
  String hintRow(int n) {
    return 'Строка $n';
  }

  @override
  String hintColumn(int n) {
    return 'Столбец $n';
  }

  @override
  String hintFullLine(String line, String clue) {
    return '$line ($clue): группы с промежутками заполняют всю линию, место каждой клетки известно. Эта клетка закрашена!';
  }

  @override
  String hintOverlap(String line, String clue) {
    return '$line ($clue): сдвинь группы хоть в начало, хоть в конец — эта клетка всегда внутри группы. Значит, она закрашена!';
  }

  @override
  String hintForcedFill(String line, String clue) {
    return '$line ($clue): уже открытые клетки и крестики сужают места для групп. При любом размещении эта клетка закрашена!';
  }

  @override
  String hintForcedEmpty(String line, String clue) {
    return '$line ($clue): ни одна группа не дотягивается до этой клетки, значит, она пустая. Мы поставили X.';
  }

  @override
  String get hintFallback => 'Эта клетка — часть картинки.';

  @override
  String get tutorialSkip => 'Пропустить';

  @override
  String get tutorialGotIt => 'Понятно';

  @override
  String get tutorialL1Fill =>
      'Числа показывают, сколько клеток в этой строке закрашено. Здесь 5 — значит, закрашены все 5 клеток! Коснись клетки, чтобы закрасить её.';

  @override
  String get tutorialL1Drag =>
      'Отлично! Теперь зажми палец и проведи, чтобы закрасить остаток строки.';

  @override
  String get tutorialL1Column => 'В этом столбце тоже 5: проведи сверху вниз.';

  @override
  String get tutorialL1Finish =>
      'Когда строка или столбец готовы, остальные клетки сами получают крестик. Закончи остальную картинку сам!';

  @override
  String get tutorialL2Cross =>
      '2 2 — это 2 закрашенные клетки, хотя бы один пропуск и ещё 2 закрашенные клетки. 2 + пропуск + 2 = 5, строка определена! Дважды коснись пустой клетки, чтобы поставить X.';

  @override
  String get tutorialL2Drag =>
      'Клетки с твоим X при проведении пропускаются. Проведи по всей строке, чтобы закрасить её.';

  @override
  String get tutorialL2Rules =>
      'Неверно закрашенная клетка стоит 1 жизнь; крестики ставить можно свободно. Если застрянешь, кнопка «Подсказка» объяснит и почему. Дальше — сам!';
}
