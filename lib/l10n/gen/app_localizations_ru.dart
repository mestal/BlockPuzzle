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
  String tutorialLesson(int lesson, int count) {
    return 'Урок $lesson/$count';
  }

  @override
  String get tutorialStart => 'Поехали!';

  @override
  String get tutorialSkipTitle => 'Пропустить обучение?';

  @override
  String get tutorialSkipBody =>
      'Пропустить только урок этого уровня или всё обучение?';

  @override
  String get tutorialSkipLevel => 'Только этот уровень';

  @override
  String get tutorialSkipAll => 'Пропустить всё';

  @override
  String get tutorialWelcome =>
      'Привет! В каждой головоломке спрятана картинка. Читай числа, закрашивай нужные клетки и открой её!';

  @override
  String get tutorialL1Fill =>
      '[5]: в этой строке 5 закрашенных клеток. В строке ровно 5 клеток, значит, закрашены все! Коснись одной.';

  @override
  String get tutorialL1Drag =>
      'Отлично! Теперь проведи, не отрывая пальца, и закрась остаток строки.';

  @override
  String get tutorialL1Row =>
      'Эта строка тоже [5]. На этот раз проведи от края до края одним движением.';

  @override
  String get tutorialL1AutoCross =>
      'Обе [2] клетки этого столбца найдены, и остальные сами получили X. X значит: пусто.';

  @override
  String get tutorialL1Column =>
      'Числа сверху — для столбцов. Этот столбец [5]: проведи сверху вниз.';

  @override
  String get tutorialL1Count =>
      'Этой строке нужно [3] клетки. Клетки с X пустые, значит, осталось ровно 3. Закрась их все!';

  @override
  String get tutorialL1Finish =>
      'Закончи последнюю строку сам и открой картинку!';

  @override
  String get tutorialL2Groups =>
      '[2 2]: две отдельные группы. 2 закрашены, минимум 1 пустая, затем 2 закрашены. 2 + 1 + 2 = 5: ровно помещается!';

  @override
  String get tutorialL2Cross =>
      'Значит, средняя клетка пустая. Коснись её дважды, чтобы поставить X.';

  @override
  String get tutorialL2Drag =>
      'X — это просто заметка, она ничего не стоит. Теперь проведи по строке: X пропускается.';

  @override
  String get tutorialL2CrossSelf =>
      'Строка ниже тоже [2 2]. Твоя очередь: сначала коснись пустой клетки дважды, чтобы поставить X.';

  @override
  String get tutorialL2DragSelf => 'Теперь проведи, чтобы закрасить строку.';

  @override
  String get tutorialL2Mistakes =>
      'Осторожно: неверно закрашенная клетка становится красным X и стоит одно сердце. Не уверен? Сначала поставь X!';

  @override
  String get tutorialL2Finish =>
      'Дальше сам! Застрял? Посчитай, скольких клеток не хватает линии.';

  @override
  String get tutorialL3Overlap =>
      'Этот столбец [4], а места на 5. Блок из 4 стоит либо в самом верху, либо в самом низу. В обоих случаях средние 3 закрашены!';

  @override
  String get tutorialL3OverlapFill =>
      'Закрась эти точные клетки. Этот приём называется наложением: секрет больших головоломок!';

  @override
  String get tutorialL3OverlapSelf =>
      'Этот столбец тоже [4]. Найди точные клетки сам!';

  @override
  String get tutorialL3OverlapRow =>
      'А [3]? Хоть влево, хоть вправо — средняя клетка всегда закрашена. Закрась её!';

  @override
  String get tutorialL3Finish =>
      'Здорово! Этот приём часто пригодится в больших головоломках. Теперь закончи картинку!';

  @override
  String get tutorialL4Ones =>
      'Три верхние строки — [1 1 1]: три одиночные клетки с промежутками. 1 + 1 + 1 + 1 + 1 = 5: помещаются ровно!';

  @override
  String get tutorialL4CrossDrag =>
      'Значит, три верхние клетки этого столбца пустые. Коснись дважды, на втором касании не отрывай палец и проведи вниз: сразу три X!';

  @override
  String get tutorialL4CrossDragSelf =>
      'Твоя очередь: одним движением нарисуй X на трёх пустых клетках этого столбца.';

  @override
  String get tutorialL4Erase =>
      'Ошибся с X? Коснись его снова дважды, и он исчезнет. Если провести двойным касанием от X, стираются X на пути.';

  @override
  String get tutorialL4Finish => 'Супер! Теперь закончи картинку.';

  @override
  String get tutorialL5Sum =>
      'Последний урок! Этот столбец [3 1]: 3 + 1 + 1 = 5, значит, он точно известен. Реши его сам!';

  @override
  String get tutorialL5Hint =>
      'Застрял? Нажми «Подсказка»: она покажет следующий шаг и объяснит почему.';

  @override
  String get tutorialL5Finish =>
      'Ты готов! В больших сетках толстые линии делят клетки по 5, чтобы было легче считать. Закончи картинку!';
}
