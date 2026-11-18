// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bulgarian (`bg`).
class AppLocalizationsBg extends AppLocalizations {
  AppLocalizationsBg([String locale = 'bg']) : super(locale);

  @override
  String get appTitle => 'Pixel Bloom';

  @override
  String get whoIsPlaying => 'Кой играе?';

  @override
  String get newGame => 'Нова игра';

  @override
  String get emptySlot => 'Празно място';

  @override
  String get yourName => 'Твоето име';

  @override
  String get namePlaceholder => 'Например Иван';

  @override
  String get nameRequired => 'Въведи име';

  @override
  String get pickColor => 'Избери цвят';

  @override
  String get start => 'Старт';

  @override
  String get cancel => 'Отказ';

  @override
  String deleteSlotTitle(String name) {
    return 'Да се изтрие ли $name?';
  }

  @override
  String get deleteSlotBody =>
      'Целият напредък на този играч ще бъде изтрит. Това не може да се отмени.';

  @override
  String get delete => 'Изтрий';

  @override
  String levelLabel(int n) {
    return 'Ниво $n';
  }

  @override
  String hintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count подсказки',
      one: '1 подсказка',
    );
    return '$_temp0';
  }

  @override
  String get tutorialTap => 'Докосване: запълване';

  @override
  String get tutorialDoubleTap =>
      'Двойно докосване: поставя X (двойно докосване на X: премахва го)';

  @override
  String get tutorialDrag =>
      'Задръж и плъзни, за да маркираш много квадратчета наведнъж. Двойно докосване и плъзгане от X изтрива знаците X.';

  @override
  String get hint => 'Подсказка';

  @override
  String get noHintsTitle => 'Нямаш подсказки';

  @override
  String get noHintsBody => 'Гледай кратка реклама, за да получиш 1 подсказка.';

  @override
  String get watchAdForHint => 'Гледай реклама: +1 подсказка';

  @override
  String get outOfLivesTitle => 'Нямаш повече животи';

  @override
  String get outOfLivesBody =>
      'Гледай реклама за още 1 живот или започни нивото отначало.';

  @override
  String get watchAdForLife => 'Гледай реклама: +1 живот';

  @override
  String get restart => 'Отначало';

  @override
  String get backToLevels => 'Към нивата';

  @override
  String get levelComplete => 'Браво!';

  @override
  String nextLevel(int n) {
    return 'Следва: Ниво $n';
  }

  @override
  String get ok => 'ОК';

  @override
  String get allDoneSoon => 'Скоро нови нива';

  @override
  String get adLabel => 'Реклама';

  @override
  String get adPlaceholder => 'Тук ще се покаже реклама';

  @override
  String get adClose => 'Затвори';

  @override
  String adCountdown(int seconds) {
    return '$seconds с';
  }

  @override
  String get rulesTitle => 'Как се играе?';

  @override
  String get rulesClues =>
      'Числата отляво и отгоре показват колко запълнени квадратчета има в съответния ред и колона. Ако числата са няколко, между групите има поне едно празно квадратче.';

  @override
  String get rulesMistakes =>
      'Запълването на квадратче, което трябва да е празно, струва 1 живот. Знаците X са безплатни: води си бележки, както искаш. За да запълниш квадратче с X, първо премахни X с двойно докосване.';

  @override
  String get rulesScoring =>
      'Всяко правилно запълване носи точки. Поредните правилни запълвания увеличават множителя (до x5). Завършените редове и колони дават бонус точки.';

  @override
  String levelScore(int score) {
    return '$score точки';
  }

  @override
  String totalScore(int total) {
    return 'Общо: $total';
  }

  @override
  String get rulesGoal =>
      'Намери всички запълнени квадратчета и блокчетата ще се превърнат в скрита картинка.';

  @override
  String worldLabel(int n) {
    return 'Карта $n';
  }

  @override
  String get worldsTitle => 'Карти';

  @override
  String get worldUnlocked => 'Отключена е нова карта!';

  @override
  String get worldComplete => 'Картата е завършена!';

  @override
  String nextWorld(String name) {
    return 'Следваща карта: $name';
  }

  @override
  String nextWorldLocked(String name) {
    return 'Завърши тази карта, за да отключиш $name';
  }

  @override
  String nextWorldSoon(String name) {
    return '$name идва скоро';
  }

  @override
  String get worldLocked => 'Завърши предишната карта';

  @override
  String get worldSoon => 'Скоро';

  @override
  String get youAreHere => 'Ти си тук';

  @override
  String get mapStart => 'Старт';

  @override
  String playLevel(int n) {
    return 'Играй · Ниво $n';
  }

  @override
  String get tapToContinue => 'Докосни, за да продължиш';

  @override
  String starCount(int have, int max) {
    return '$have/$max';
  }

  @override
  String get settings => 'Настройки';

  @override
  String get settingsSound => 'Звукови ефекти';

  @override
  String get settingsLanguage => 'Език';

  @override
  String get settingsLanguageDevice => 'Езикът на устройството';

  @override
  String hintRow(int n) {
    return 'Ред $n';
  }

  @override
  String hintColumn(int n) {
    return 'Колона $n';
  }

  @override
  String hintFullLine(String line, String clue) {
    return '$line ($clue): групите заедно с по едно празно място между тях запълват цялата линия, така че всяко квадратче е сигурно. Това квадратче е запълнено!';
  }

  @override
  String hintOverlap(String line, String clue) {
    return '$line ($clue): избутай групите в началото или в края – това квадратче винаги е вътре в група. Значи трябва да е запълнено!';
  }

  @override
  String hintForcedFill(String line, String clue) {
    return '$line ($clue): квадратчетата и знаците X, които вече имаш, ограничават къде могат да се поберат групите. При всяко възможно подреждане това квадратче е запълнено!';
  }

  @override
  String hintForcedEmpty(String line, String clue) {
    return '$line ($clue): нито една група не достига това квадратче, така че то е празно. Слагаме тук X.';
  }

  @override
  String get hintFallback => 'Това квадратче е част от картинката.';

  @override
  String get tutorialSkip => 'Пропусни';

  @override
  String get tutorialGotIt => 'Разбрах';

  @override
  String get tutorialL1Fill =>
      'Числата показват колко квадратчета в реда са запълнени. Този ред казва 5, значи всичките 5 квадратчета са запълнени! Докосни квадратче, за да го запълниш.';

  @override
  String get tutorialL1Drag =>
      'Чудесно! Сега задръж пръста си и плъзни, за да запълниш останалата част от реда.';

  @override
  String get tutorialL1Column =>
      'Тази колона също казва 5: плъзни отгоре надолу.';

  @override
  String get tutorialL1Finish =>
      'Когато ред или колона е готова, останалите ѝ квадратчета получават X сами. Довърши останалата част от картинката!';

  @override
  String get tutorialL2Cross =>
      '2 2 означава 2 запълнени квадратчета, поне едно празно и после още 2 запълнени. 2 + празно + 2 = 5, значи редът е сигурен! Докосни два пъти празното квадратче, за да поставиш X.';

  @override
  String get tutorialL2Drag =>
      'Квадратчетата с твоя X се пропускат при плъзгане. Плъзни по целия ред, за да го запълниш.';

  @override
  String get tutorialL2Rules =>
      'Запълването на грешно квадратче струва 1 живот; знаците X са безплатни. Ако се затрудниш, бутонът Подсказка обяснява и защо. Останалото е в твои ръце!';
}
