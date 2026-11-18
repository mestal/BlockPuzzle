// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appTitle => 'BlockPuzzle';

  @override
  String get whoIsPlaying => 'Хто грає?';

  @override
  String get newGame => 'Нова гра';

  @override
  String get emptySlot => 'Порожній слот';

  @override
  String get yourName => 'Твоє ім’я';

  @override
  String get namePlaceholder => 'Наприклад, Оксана';

  @override
  String get nameRequired => 'Введи ім’я';

  @override
  String get pickColor => 'Обери свій колір';

  @override
  String get start => 'Почати';

  @override
  String get cancel => 'Скасувати';

  @override
  String deleteSlotTitle(String name) {
    return 'Видалити $name?';
  }

  @override
  String get deleteSlotBody =>
      'Увесь прогрес цього гравця буде видалено. Цю дію не можна скасувати.';

  @override
  String get delete => 'Видалити';

  @override
  String levelLabel(int n) {
    return 'Рівень $n';
  }

  @override
  String hintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count підказки',
      many: '$count підказок',
      few: '$count підказки',
      one: '$count підказка',
    );
    return '$_temp0';
  }

  @override
  String get tutorialTap => 'Дотик: заповнити';

  @override
  String get tutorialDoubleTap =>
      'Подвійний дотик: поставити X (ще раз двічі торкнись X: прибрати)';

  @override
  String get tutorialDrag =>
      'Утримуй і веди пальцем, щоб позначити багато клітинок одразу. Двічі торкнись і веди від X, щоб стерти позначки X.';

  @override
  String get hint => 'Підказка';

  @override
  String get noHintsTitle => 'Підказки закінчилися';

  @override
  String get noHintsBody =>
      'Переглянь коротку рекламу, щоб отримати 1 підказку.';

  @override
  String get watchAdForHint => 'Реклама: +1 підказка';

  @override
  String get outOfLivesTitle => 'Життя закінчилися';

  @override
  String get outOfLivesBody =>
      'Переглянь рекламу, щоб отримати ще 1 життя, або почни рівень спочатку.';

  @override
  String get watchAdForLife => 'Реклама: +1 життя';

  @override
  String get restart => 'Почати спочатку';

  @override
  String get backToLevels => 'До рівнів';

  @override
  String get levelComplete => 'Чудово!';

  @override
  String nextLevel(int n) {
    return 'Далі: рівень $n';
  }

  @override
  String get ok => 'OK';

  @override
  String get allDoneSoon => 'Нові рівні незабаром';

  @override
  String get adLabel => 'Реклама';

  @override
  String get adPlaceholder => 'Тут буде показано рекламу';

  @override
  String get adClose => 'Закрити';

  @override
  String adCountdown(int seconds) {
    return '$seconds с';
  }

  @override
  String get rulesTitle => 'Як грати?';

  @override
  String get rulesClues =>
      'Числа ліворуч і вгорі показують, скільки заповнених клітинок у цьому рядку та стовпці. Якщо чисел кілька, між групами є щонайменше одна порожня клітинка.';

  @override
  String get rulesMistakes =>
      'Заповнення клітинки, яка має бути порожньою, коштує 1 життя. Позначки X безкоштовні: роби нотатки як завгодно. Щоб заповнити клітинку з X, спершу прибери X подвійним дотиком.';

  @override
  String get rulesScoring =>
      'Кожне правильне заповнення приносить очки. Правильні ходи поспіль збільшують множник (до x5). Завершені рядки та стовпці дають бонусні очки.';

  @override
  String levelScore(int score) {
    return '$score очок';
  }

  @override
  String totalScore(int total) {
    return 'Разом: $total';
  }

  @override
  String get rulesGoal =>
      'Знайди всі заповнені клітинки, і блоки перетворяться на приховану картинку.';

  @override
  String worldLabel(int n) {
    return 'Мапа $n';
  }

  @override
  String get worldsTitle => 'Мапи';

  @override
  String get worldUnlocked => 'Нову мапу відкрито!';

  @override
  String get worldComplete => 'Мапу пройдено!';

  @override
  String nextWorld(String name) {
    return 'Наступна мапа: $name';
  }

  @override
  String nextWorldLocked(String name) {
    return 'Пройди цю мапу, щоб відкрити $name';
  }

  @override
  String nextWorldSoon(String name) {
    return '$name незабаром';
  }

  @override
  String get worldLocked => 'Пройди попередню мапу';

  @override
  String get worldSoon => 'Незабаром';

  @override
  String get youAreHere => 'Ти тут';

  @override
  String get mapStart => 'Старт';

  @override
  String playLevel(int n) {
    return 'Грати · Рівень $n';
  }

  @override
  String get tapToContinue => 'Торкнись, щоб продовжити';

  @override
  String starCount(int have, int max) {
    return '$have/$max';
  }

  @override
  String get settings => 'Налаштування';

  @override
  String get settingsSound => 'Звукові ефекти';

  @override
  String get settingsLanguage => 'Мова';

  @override
  String get settingsLanguageDevice => 'Мова пристрою';

  @override
  String hintRow(int n) {
    return 'Рядок $n';
  }

  @override
  String hintColumn(int n) {
    return 'Стовпець $n';
  }

  @override
  String hintFullLine(String line, String clue) {
    return '$line ($clue): групи разом із проміжком між ними заповнюють увесь ряд, тож кожна клітинка визначена. Ця клітинка заповнена!';
  }

  @override
  String hintOverlap(String line, String clue) {
    return '$line ($clue): посунь групи на початок або в кінець — ця клітинка завжди всередині групи. Отже, вона заповнена!';
  }

  @override
  String hintForcedFill(String line, String clue) {
    return '$line ($clue): уже відомі клітинки та позначки X обмежують, де можуть стояти групи. За будь-якого розташування ця клітинка заповнена!';
  }

  @override
  String hintForcedEmpty(String line, String clue) {
    return '$line ($clue): жодна група не дістає до цієї клітинки, тож вона порожня. Ставимо тут X.';
  }

  @override
  String get hintFallback => 'Ця клітинка — частина картинки.';

  @override
  String get tutorialSkip => 'Пропустити';

  @override
  String get tutorialGotIt => 'Зрозуміло';

  @override
  String get tutorialL1Fill =>
      'Числа показують, скільки клітинок у рядку заповнено. Тут 5, отже заповнені всі 5 клітинок! Торкнись клітинки, щоб заповнити її.';

  @override
  String get tutorialL1Drag =>
      'Чудово! Тепер утримуй палець і веди, щоб заповнити решту рядка.';

  @override
  String get tutorialL1Column => 'У цьому стовпці теж 5: веди згори вниз.';

  @override
  String get tutorialL1Finish =>
      'Коли рядок чи стовпець завершено, інші клітинки отримують X самі. Решту картинки заверши сам!';

  @override
  String get tutorialL2Cross =>
      '2 2 означає 2 заповнені клітинки, щонайменше один проміжок і ще 2 заповнені клітинки. 2 + проміжок + 2 = 5, тож рядок визначений! Двічі торкнись порожньої клітинки, щоб поставити X.';

  @override
  String get tutorialL2Drag =>
      'Клітинки з твоїм X пропускаються, коли ведеш пальцем. Проведи вздовж усього рядка, щоб заповнити його.';

  @override
  String get tutorialL2Rules =>
      'Заповнення неправильної клітинки коштує 1 життя; позначки X безкоштовні. Якщо застряг, кнопка «Підказка» також пояснить чому. Далі — сам!';
}
