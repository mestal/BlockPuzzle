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
  String get noHintsBodyNoAds => 'لقد استخدمت كل تلميحاتك.';

  @override
  String get watchAdForHint => 'شاهد إعلانًا: +1 تلميح';

  @override
  String get outOfLivesTitle => 'نفدت المحاولات';

  @override
  String get outOfLivesBody =>
      'شاهد إعلانًا لتحصل على محاولة إضافية، أو ابدأ المرحلة من جديد.';

  @override
  String get outOfLivesBodyNoAds => 'ابدأ المرحلة من جديد أو عُد إلى المراحل.';

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
  String tutorialLesson(int lesson, int count) {
    return 'الدرس $lesson/$count';
  }

  @override
  String get tutorialStart => 'هيا بنا!';

  @override
  String get tutorialSkipTitle => 'تخطي الشرح؟';

  @override
  String get tutorialSkipBody =>
      'هل تريد تخطي درس هذه المرحلة فقط أم الشرح كله؟';

  @override
  String get tutorialSkipLevel => 'هذه المرحلة فقط';

  @override
  String get tutorialSkipAll => 'تخطَّ الكل';

  @override
  String get tutorialWelcome =>
      'مرحبًا! في كل لغز صورة مخفية. اقرأ الأرقام، واملأ المربعات الصحيحة، واكشفها!';

  @override
  String get tutorialL1Fill =>
      '[5]: في هذا الصف 5 مربعات مملوءة. والصف طوله 5 مربعات، إذن كلها مملوءة! انقر على واحد.';

  @override
  String get tutorialL1Drag =>
      'رائع! الآن اسحب دون أن ترفع إصبعك لتملأ بقية الصف.';

  @override
  String get tutorialL1Row =>
      'هذا الصف أيضًا [5]. هذه المرة اسحب من طرف إلى طرف دفعة واحدة.';

  @override
  String get tutorialL1AutoCross =>
      'وُجد مربعا هذا العمود [2]، فحصلت البقية على X تلقائيًا. علامة X تعني: فارغ.';

  @override
  String get tutorialL1Column =>
      'الأرقام في الأعلى للأعمدة. هذا العمود [5]: اسحب من الأعلى إلى الأسفل.';

  @override
  String get tutorialL1Count =>
      'يحتاج هذا الصف إلى [3] مربعات. مربعات X فارغة، فبقيت 3 مربعات بالضبط. املأها كلها!';

  @override
  String get tutorialL1Finish => 'أكمل الصف الأخير بنفسك واكشف الصورة!';

  @override
  String get tutorialL2Groups =>
      '[2 2]: مجموعتان منفصلتان. 2 مملوءان، ثم فراغ واحد على الأقل، ثم 2 مملوءان. 2 + 1 + 2 = 5: يتسع تمامًا!';

  @override
  String get tutorialL2Cross =>
      'إذن المربع الأوسط فارغ. انقر عليه مرتين لتضع X.';

  @override
  String get tutorialL2Drag =>
      'علامة X مجرد ملاحظة ولا تكلف شيئًا. الآن اسحب على الصف: سيتم تخطي X.';

  @override
  String get tutorialL2CrossSelf =>
      'الصف الذي في الأسفل أيضًا [2 2]. دورك: انقر مرتين على المربع الفارغ لتضع X أولًا.';

  @override
  String get tutorialL2DragSelf => 'الآن اسحب لتملأ الصف.';

  @override
  String get tutorialL2Mistakes =>
      'انتبه: ملء مربع خاطئ يحوله إلى X حمراء ويكلفك قلبًا. لست متأكدًا؟ ضع X أولًا!';

  @override
  String get tutorialL2Finish =>
      'الباقي عليك! علقت؟ احسب كم مربعًا ما زال ينقص الخط.';

  @override
  String get tutorialL3Overlap =>
      'هذا العمود [4] والمكان 5. كتلة الأربعة إما في الأعلى تمامًا أو في الأسفل تمامًا. في الحالتين المربعات الثلاثة الوسطى مملوءة!';

  @override
  String get tutorialL3OverlapFill =>
      'املأ هذه المربعات المؤكدة. اسم هذه الحيلة التداخل: سر الألغاز الكبيرة!';

  @override
  String get tutorialL3OverlapSelf =>
      'هذا العمود أيضًا [4]. جد المربعات المؤكدة بنفسك!';

  @override
  String get tutorialL3OverlapRow =>
      'وماذا عن [3]؟ سواء دُفعت يسارًا أو يمينًا، المربع الأوسط مملوء دائمًا. املأه!';

  @override
  String get tutorialL3Finish =>
      'رائع! ستستخدم هذه الحيلة كثيرًا في الألغاز الكبيرة. الآن أكمل الصورة!';

  @override
  String get tutorialL4Ones =>
      'الصفوف الثلاثة العلوية [1 1 1]: ثلاثة مربعات منفردة بينها فراغات. 1 + 1 + 1 + 1 + 1 = 5: تتسع تمامًا!';

  @override
  String get tutorialL4CrossDrag =>
      'إذن المربعات الثلاثة العلوية في هذا العمود فارغة. انقر مرتين، وأبقِ إصبعك في النقرة الثانية واسحب للأسفل: ثلاث علامات X دفعة واحدة!';

  @override
  String get tutorialL4CrossDragSelf =>
      'دورك: ارسم X بسحبة واحدة على المربعات الثلاثة الفارغة في هذا العمود.';

  @override
  String get tutorialL4Erase =>
      'وضعت X خاطئة؟ انقر عليها مرتين مجددًا لتزول. وإن سحبت بنقرتين بدءًا من X، تمحو علامات X في طريقك.';

  @override
  String get tutorialL4Finish => 'ممتاز! الآن أكمل الصورة.';

  @override
  String get tutorialL5Gaps =>
      'الدرس الأخير: الحل بعلامات X! الأعمدة الأربعة الخارجية [2 2]: 2 + 1 + 2 = 5. وكل فراغاتها تقع في الصف الأوسط.';

  @override
  String get tutorialL5CrossDrag =>
      'ضع X على هذه المربعات الفارغة: انقر مرتين، وأبقِ إصبعك في النقرة الثانية واسحب جانبًا: علامتا X دفعة واحدة!';

  @override
  String get tutorialL5CrossDragSelf =>
      'دورك: ارسم X بسحبة واحدة على المربعين الفارغين في اليمين.';

  @override
  String get tutorialL5Count =>
      'هذا الصف [1]، وبعد علامات X بقي مربع واحد فقط. علامات X تسهّل العد: املأه!';

  @override
  String get tutorialL5Hint =>
      'علقت؟ اضغط تلميح: يريك الخطوة التالية ويشرح السبب.';

  @override
  String get tutorialL5Finish =>
      'أنت جاهز! في الشبكات الكبيرة تفصل خطوط سميكة كل 5 مربعات لتسهّل العد. أكمل الصورة!';
}
