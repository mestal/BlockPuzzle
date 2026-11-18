// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'Pixel Bloom';

  @override
  String get whoIsPlaying => 'من يلعب؟';

  @override
  String get newGame => 'لعبة جديدة';

  @override
  String get emptySlot => 'خانة فارغة';

  @override
  String get yourName => 'اسمك';

  @override
  String get namePlaceholder => 'مثلًا سارة';

  @override
  String get nameRequired => 'اكتب اسمًا';

  @override
  String get pickColor => 'اختر لونك';

  @override
  String get start => 'ابدأ';

  @override
  String get cancel => 'إلغاء';

  @override
  String deleteSlotTitle(String name) {
    return 'حذف $name؟';
  }

  @override
  String get deleteSlotBody =>
      'سيُحذف كل تقدّم هذا اللاعب. لا يمكن التراجع عن ذلك.';

  @override
  String get delete => 'حذف';

  @override
  String levelLabel(int n) {
    return 'المرحلة $n';
  }

  @override
  String hintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count تلميح',
      many: '$count تلميحًا',
      few: '$count تلميحات',
      two: 'تلميحان',
      one: 'تلميح واحد',
      zero: 'لا تلميحات',
    );
    return '$_temp0';
  }

  @override
  String get tutorialTap => 'نقرة: املأ';

  @override
  String get tutorialDoubleTap =>
      'نقرتان: ضع X (نقرتان على X مرة أخرى: احذفها)';

  @override
  String get tutorialDrag =>
      'اضغط واسحب لتحدد مربعات كثيرة دفعة واحدة. انقر مرتين واسحب من X لتمسح علامات X.';

  @override
  String get hint => 'تلميح';

  @override
  String get noHintsTitle => 'نفدت التلميحات';

  @override
  String get noHintsBody => 'شاهد إعلانًا قصيرًا لتحصل على تلميح واحد.';

  @override
  String get watchAdForHint => 'شاهد إعلانًا: +1 تلميح';

  @override
  String get outOfLivesTitle => 'نفدت المحاولات';

  @override
  String get outOfLivesBody =>
      'شاهد إعلانًا لتحصل على محاولة إضافية، أو ابدأ المرحلة من جديد.';

  @override
  String get watchAdForLife => 'شاهد إعلانًا: +1 محاولة';

  @override
  String get restart => 'ابدأ من جديد';

  @override
  String get backToLevels => 'العودة إلى المراحل';

  @override
  String get levelComplete => 'رائع!';

  @override
  String nextLevel(int n) {
    return 'التالي: المرحلة $n';
  }

  @override
  String get ok => 'حسنًا';

  @override
  String get allDoneSoon => 'مراحل جديدة قريبًا';

  @override
  String get adLabel => 'إعلان';

  @override
  String get adPlaceholder => 'سيظهر إعلان هنا';

  @override
  String get adClose => 'إغلاق';

  @override
  String adCountdown(int seconds) {
    return '$seconds ث';
  }

  @override
  String get rulesTitle => 'كيف ألعب؟';

  @override
  String get rulesClues =>
      'تُظهر الأرقام على اليسار وفي الأعلى عدد المربعات المملوءة في ذلك الصف والعمود. إذا كان هناك أكثر من رقم، فبين المجموعات فراغ واحد على الأقل.';

  @override
  String get rulesMistakes =>
      'ملء مربع يجب أن يبقى فارغًا يكلفك محاولة واحدة. علامات X مجانية: دوّن ملاحظاتك كما تشاء. لملء مربع عليه X، احذف X أولًا بنقرتين.';

  @override
  String get rulesScoring =>
      'كل مربع صحيح يمنحك نقاطًا. كلما ملأت بلا أخطاء زاد المضاعف (حتى x5). إكمال الصفوف والأعمدة يمنحك نقاطًا إضافية.';

  @override
  String levelScore(int score) {
    return '$score نقطة';
  }

  @override
  String totalScore(int total) {
    return 'المجموع: $total';
  }

  @override
  String get rulesGoal =>
      'اعثر على كل المربعات المملوءة لتتحول المكعبات إلى صورة مخفية.';

  @override
  String worldLabel(int n) {
    return 'الخريطة $n';
  }

  @override
  String get worldsTitle => 'الخرائط';

  @override
  String get worldUnlocked => 'فُتحت خريطة جديدة!';

  @override
  String get worldComplete => 'اكتملت الخريطة!';

  @override
  String nextWorld(String name) {
    return 'الخريطة التالية: $name';
  }

  @override
  String nextWorldLocked(String name) {
    return 'أكمل هذه الخريطة لتفتح $name';
  }

  @override
  String nextWorldSoon(String name) {
    return '$name قريبًا';
  }

  @override
  String get worldLocked => 'أكمل الخريطة السابقة';

  @override
  String get worldSoon => 'قريبًا';

  @override
  String get youAreHere => 'أنت هنا';

  @override
  String get mapStart => 'البداية';

  @override
  String playLevel(int n) {
    return 'العب · المرحلة $n';
  }

  @override
  String get tapToContinue => 'انقر للمتابعة';

  @override
  String starCount(int have, int max) {
    return '$have/$max';
  }

  @override
  String get settings => 'الإعدادات';

  @override
  String get settingsSound => 'المؤثرات الصوتية';

  @override
  String get settingsLanguage => 'اللغة';

  @override
  String get settingsLanguageDevice => 'لغة الجهاز';

  @override
  String hintRow(int n) {
    return 'الصف $n';
  }

  @override
  String hintColumn(int n) {
    return 'العمود $n';
  }

  @override
  String hintFullLine(String line, String clue) {
    return '$line ($clue): المجموعات مع فراغ بين كل منها تملأ الخط كله، فمكان كل مربع معروف. هذا المربع مملوء!';
  }

  @override
  String hintOverlap(String line, String clue) {
    return '$line ($clue): سواء دفعت المجموعات إلى البداية أو إلى النهاية، يبقى هذا المربع داخل مجموعة. إذن هو مملوء!';
  }

  @override
  String hintForcedFill(String line, String clue) {
    return '$line ($clue): المربعات وعلامات X التي لديك تضيّق أماكن المجموعات. في كل ترتيب ممكن هذا المربع مملوء!';
  }

  @override
  String hintForcedEmpty(String line, String clue) {
    return '$line ($clue): لا تصل أي مجموعة إلى هذا المربع، فهو فارغ. وضعنا X هنا.';
  }

  @override
  String get hintFallback => 'هذا المربع جزء من الصورة.';

  @override
  String get tutorialSkip => 'تخطَّ';

  @override
  String get tutorialGotIt => 'فهمت';

  @override
  String get tutorialL1Fill =>
      'تخبرك الأرقام بعدد المربعات المملوءة في هذا الصف. هنا الرقم 5، إذن كل المربعات الخمسة مملوءة! انقر على مربع لتملأه.';

  @override
  String get tutorialL1Drag => 'رائع! الآن اضغط بإصبعك واسحب لتملأ باقي الصف.';

  @override
  String get tutorialL1Column =>
      'هذا العمود أيضًا 5: اسحب من الأعلى إلى الأسفل.';

  @override
  String get tutorialL1Finish =>
      'عندما يكتمل صف أو عمود، تحصل بقية مربعاته على X تلقائيًا. أكمل باقي الصورة بنفسك!';

  @override
  String get tutorialL2Cross =>
      '⁦2 2⁩ تعني مربعين مملوءين، ثم فراغًا واحدًا على الأقل، ثم مربعين مملوءين آخرين. 2 + فراغ + 2 = 5، إذن الصف محدد! انقر مرتين على المربع الفارغ لتضع X.';

  @override
  String get tutorialL2Drag =>
      'يتم تخطي المربعات التي عليها X عند السحب. اسحب على الصف كله لتملأه.';

  @override
  String get tutorialL2Rules =>
      'ملء مربع خاطئ يكلفك محاولة واحدة؛ أما علامات X فمجانية. إذا علقت، فزر التلميح يشرح لك السبب أيضًا. الباقي عليك!';
}
