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
  String get noHintsBodyNoAds => 'Използва всички подсказки.';

  @override
  String get watchAdForHint => 'Гледай реклама: +1 подсказка';

  @override
  String get outOfLivesTitle => 'Нямаш повече животи';

  @override
  String get outOfLivesBody =>
      'Гледай реклама за още 1 живот или започни нивото отначало.';

  @override
  String get outOfLivesBodyNoAds =>
      'Започни нивото отначало или се върни към нивата.';

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
  String tutorialLesson(int lesson, int count) {
    return 'Урок $lesson/$count';
  }

  @override
  String get tutorialStart => 'Да започваме!';

  @override
  String get tutorialSkipTitle => 'Пропускане на обучението?';

  @override
  String get tutorialSkipBody =>
      'Да пропуснеш само урока на това ниво или цялото обучение?';

  @override
  String get tutorialSkipLevel => 'Само това ниво';

  @override
  String get tutorialSkipAll => 'Пропусни всичко';

  @override
  String get tutorialWelcome =>
      'Здравей! Във всеки пъзел е скрита картинка. Чети числата, запълвай правилните квадратчета и я разкрий!';

  @override
  String get tutorialL1Fill =>
      '[5]: в този ред има 5 запълнени квадратчета. Редът е 5 квадратчета, значи всички са запълнени! Докосни едно.';

  @override
  String get tutorialL1Drag =>
      'Супер! Сега плъзни, без да вдигаш пръст, и запълни останалата част от реда.';

  @override
  String get tutorialL1Row =>
      'И този ред е [5]. Този път плъзни от край до край с едно движение.';

  @override
  String get tutorialL1AutoCross =>
      'Двете [2] квадратчета на тази колона са намерени, затова останалите получиха X сами. X значи: празно.';

  @override
  String get tutorialL1Column =>
      'Числата отгоре са за колоните. Тази колона е [5]: плъзни отгоре надолу.';

  @override
  String get tutorialL1Count =>
      'Този ред иска [3] квадратчета. Тези с X са празни, значи остават точно 3. Запълни ги всичките!';

  @override
  String get tutorialL1Finish =>
      'Довърши сам последния ред и разкрий картинката!';

  @override
  String get tutorialL2Groups =>
      '[2 2]: две отделни групи. 2 запълнени, поне 1 празно, после 2 запълнени. 2 + 1 + 2 = 5: пасва точно!';

  @override
  String get tutorialL2Cross =>
      'Значи средното квадратче е празно. Докосни го два пъти, за да сложиш X.';

  @override
  String get tutorialL2Drag =>
      'X е само бележка и не струва нищо. Сега плъзни по реда: X се прескача.';

  @override
  String get tutorialL2CrossSelf =>
      'Редът отдолу също е [2 2]. Твой ред е: първо сложи X на празното квадратче.';

  @override
  String get tutorialL2DragSelf => 'Сега плъзни, за да запълниш реда.';

  @override
  String get tutorialL2Mistakes =>
      'Внимание: запълнено грешно квадратче става червен X и струва едно сърце. Не си сигурен? Първо сложи X!';

  @override
  String get tutorialL2Finish =>
      'Останалото е твое! Заседна ли? Преброй колко квадратчета още липсват на една линия.';

  @override
  String get tutorialL3Overlap =>
      'Тази колона е [4], а мястото е 5. Блокът от 4 е или най-горе, или най-долу. И в двата случая средните 3 са запълнени!';

  @override
  String get tutorialL3OverlapFill =>
      'Запълни тези сигурни квадратчета. Този трик се казва застъпване: тайната на големите пъзели!';

  @override
  String get tutorialL3OverlapSelf =>
      'И тази колона е [4]. Намери сам сигурните квадратчета!';

  @override
  String get tutorialL3OverlapRow =>
      'А [3]? Наляво или надясно, средното квадратче винаги е запълнено. Запълни го!';

  @override
  String get tutorialL3Finish =>
      'Страхотно! Ще използваш този трик често в големите пъзели. Сега довърши картинката!';

  @override
  String get tutorialL4Ones =>
      'Горните два реда са [1 1 1]: три единични квадратчета с празно между тях. 1 + 1 + 1 + 1 + 1 = 5: пасват точно!';

  @override
  String get tutorialL4CrossDrag =>
      'Тези две квадратчета са празни. Докосни два пъти, задръж пръста при второто докосване и плъзни надолу: линия от X!';

  @override
  String get tutorialL4CrossDragSelf =>
      'Твой ред е: начертай X на двете празни квадратчета в тази колона.';

  @override
  String get tutorialL4Erase =>
      'Грешен X? Докосни го пак два пъти и изчезва. Ако плъзнеш с двойно докосване от X, триеш X-овете по пътя.';

  @override
  String get tutorialL4Finish => 'Супер! Сега довърши картинката.';

  @override
  String get tutorialL5Sum =>
      'Последен урок! Тази колона е [3 1]: 3 + 1 + 1 = 5, значи е сигурна. Реши я сам!';

  @override
  String get tutorialL5Hint =>
      'Заседна ли? Натисни Подсказка: тя показва следващата стъпка и обяснява защо.';

  @override
  String get tutorialL5Finish =>
      'Готов си! В големите мрежи дебели линии делят квадратчетата по 5, за да броиш лесно. Довърши картинката!';
}
