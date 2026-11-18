// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appTitle => 'Pixel Bloom';

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
  String get noHintsBodyNoAds => 'Ти використав усі підказки.';

  @override
  String get watchAdForHint => 'Реклама: +1 підказка';

  @override
  String get outOfLivesTitle => 'Життя закінчилися';

  @override
  String get outOfLivesBody =>
      'Переглянь рекламу, щоб отримати ще 1 життя, або почни рівень спочатку.';

  @override
  String get outOfLivesBodyNoAds =>
      'Почни рівень спочатку або повернися до рівнів.';

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
  String tutorialLesson(int lesson, int count) {
    return 'Урок $lesson/$count';
  }

  @override
  String get tutorialStart => 'Почнімо!';

  @override
  String get tutorialSkipTitle => 'Пропустити навчання?';

  @override
  String get tutorialSkipBody =>
      'Пропустити лише урок цього рівня чи все навчання?';

  @override
  String get tutorialSkipLevel => 'Лише цей рівень';

  @override
  String get tutorialSkipAll => 'Пропустити все';

  @override
  String get tutorialWelcome =>
      'Привіт! У кожній головоломці захована картинка. Читай числа, заповнюй потрібні клітинки й відкрий її!';

  @override
  String get tutorialL1Fill =>
      '[5]: у цьому рядку 5 заповнених клітинок. У рядку рівно 5 клітинок, отже, заповнені всі! Торкнись однієї.';

  @override
  String get tutorialL1Drag =>
      'Чудово! Тепер веди, не відриваючи пальця, і заповни решту рядка.';

  @override
  String get tutorialL1Row =>
      'Цей рядок теж [5]. Цього разу веди від краю до краю одним рухом.';

  @override
  String get tutorialL1AutoCross =>
      'Обидві [2] клітинки цього стовпця знайдено, тож решта сама отримала X. X означає: порожньо.';

  @override
  String get tutorialL1Column =>
      'Числа зверху — для стовпців. Цей стовпець [5]: веди згори вниз.';

  @override
  String get tutorialL1Count =>
      'Цьому рядку треба [3] клітинки. Клітинки з X порожні, тож лишилося рівно 3. Заповни їх усі!';

  @override
  String get tutorialL1Finish =>
      'Заверши останній рядок сам і відкрий картинку!';

  @override
  String get tutorialL2Groups =>
      '[2 2]: дві окремі групи. 2 заповнені, щонайменше 1 порожня, потім 2 заповнені. 2 + 1 + 2 = 5: якраз уміщається!';

  @override
  String get tutorialL2Cross =>
      'Отже, середня клітинка порожня. Торкнись її двічі, щоб поставити X.';

  @override
  String get tutorialL2Drag =>
      'X — лише нотатка, вона нічого не коштує. Тепер веди по рядку: X пропускається.';

  @override
  String get tutorialL2CrossSelf =>
      'Рядок нижче теж [2 2]. Твоя черга: спершу постав X на порожню клітинку.';

  @override
  String get tutorialL2DragSelf => 'Тепер веди, щоб заповнити рядок.';

  @override
  String get tutorialL2Mistakes =>
      'Обережно: хибно заповнена клітинка стає червоним X і коштує одне серце. Не певен? Спершу постав X!';

  @override
  String get tutorialL2Finish =>
      'Далі сам! Застряг? Порахуй, скільки клітинок бракує лінії.';

  @override
  String get tutorialL3Overlap =>
      'Цей стовпець [4], а місця на 5. Блок із 4 стоїть або на самому верху, або в самому низу. В обох випадках середні 3 заповнені!';

  @override
  String get tutorialL3OverlapFill =>
      'Заповни ці певні клітинки. Цей прийом зветься накладанням: секрет великих головоломок!';

  @override
  String get tutorialL3OverlapSelf =>
      'Цей стовпець теж [4]. Знайди певні клітинки сам!';

  @override
  String get tutorialL3OverlapRow =>
      'А [3]? Хоч ліворуч, хоч праворуч — середня клітинка завжди заповнена. Заповни її!';

  @override
  String get tutorialL3Finish =>
      'Клас! Цей прийом часто знадобиться у великих головоломках. Тепер заверши картинку!';

  @override
  String get tutorialL4Ones =>
      'Два верхні рядки — [1 1 1]: три поодинокі клітинки з проміжками. 1 + 1 + 1 + 1 + 1 = 5: уміщаються якраз!';

  @override
  String get tutorialL4CrossDrag =>
      'Ці дві клітинки порожні. Торкнись двічі, на другому дотику не відривай пальця й веди вниз: лінія з X!';

  @override
  String get tutorialL4CrossDragSelf =>
      'Твоя черга: намалюй X на двох порожніх клітинках цього стовпця.';

  @override
  String get tutorialL4Erase =>
      'Хибний X? Торкнись його знову двічі, і він зникне. Якщо вести подвійним дотиком від X, стираються X на шляху.';

  @override
  String get tutorialL4Finish => 'Супер! Тепер заверши картинку.';

  @override
  String get tutorialL5Sum =>
      'Останній урок! Цей стовпець [3 1]: 3 + 1 + 1 = 5, отже, він точно відомий. Розв’яжи його сам!';

  @override
  String get tutorialL5Hint =>
      'Застряг? Натисни «Підказка»: вона покаже наступний крок і пояснить чому.';

  @override
  String get tutorialL5Finish =>
      'Ти готовий! У великих сітках товсті лінії ділять клітинки по 5, щоб легше рахувати. Заверши картинку!';
}
