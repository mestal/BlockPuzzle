// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get appTitle => 'Pixel Bloom';

  @override
  String get whoIsPlaying => 'چه کسی بازی می‌کند؟';

  @override
  String get newGame => 'بازی جدید';

  @override
  String get emptySlot => 'جایگاه خالی';

  @override
  String get yourName => 'نام تو';

  @override
  String get namePlaceholder => 'مثلاً سارا';

  @override
  String get nameRequired => 'یک نام بنویس';

  @override
  String get start => 'شروع';

  @override
  String get cancel => 'لغو';

  @override
  String deleteSlotTitle(String name) {
    return '$name حذف شود؟';
  }

  @override
  String get deleteSlotBody =>
      'همهٔ پیشرفت این بازیکن حذف می‌شود. این کار برگشت‌پذیر نیست.';

  @override
  String get delete => 'حذف';

  @override
  String levelLabel(int n) {
    return 'مرحلهٔ $n';
  }

  @override
  String hintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count راهنما',
    );
    return '$_temp0';
  }

  @override
  String get tutorialTap => 'ضربه: پر کردن';

  @override
  String get tutorialDoubleTap =>
      'دو ضربه: گذاشتن X (دوباره دو ضربه روی X: برداشتن آن)';

  @override
  String get tutorialDrag =>
      'نگه دار و بکش تا چند خانه را یک‌جا علامت بزنی. دو ضربه بزن و از روی یک X بکش تا علامت‌های X پاک شوند.';

  @override
  String get hint => 'راهنما';

  @override
  String get noHintsTitle => 'راهنما تمام شد';

  @override
  String get noHintsBody => 'یک تبلیغ کوتاه ببین تا 1 راهنما بگیری.';

  @override
  String get noHintsBodyNoAds => 'همهٔ راهنماهایت را استفاده کرده‌ای.';

  @override
  String get watchAdForHint => 'تماشای تبلیغ: +1 راهنما';

  @override
  String get outOfLivesTitle => 'جان‌ها تمام شد';

  @override
  String get outOfLivesBody =>
      'یک تبلیغ ببین تا 1 جان دیگر بگیری، یا مرحله را از اول شروع کن.';

  @override
  String get outOfLivesBodyNoAds =>
      'مرحله را از اول شروع کن یا به مرحله‌ها برگرد.';

  @override
  String get watchAdForLife => 'تماشای تبلیغ: +1 جان';

  @override
  String get restart => 'شروع دوباره';

  @override
  String get backToLevels => 'بازگشت به مرحله‌ها';

  @override
  String get levelComplete => 'عالی!';

  @override
  String nextLevel(int n) {
    return 'بعدی: مرحلهٔ $n';
  }

  @override
  String get ok => 'باشه';

  @override
  String get allDoneSoon => 'مرحله‌های جدید به‌زودی';

  @override
  String get adLabel => 'تبلیغ';

  @override
  String get adPlaceholder => 'اینجا یک تبلیغ نمایش داده می‌شود';

  @override
  String get adClose => 'بستن';

  @override
  String adCountdown(int seconds) {
    return '$seconds ثانیه';
  }

  @override
  String get rulesTitle => 'چطور بازی کنیم؟';

  @override
  String get rulesClues =>
      'عددهای سمت چپ و بالا نشان می‌دهند در آن ردیف و ستون چند خانهٔ پر هست. اگر چند عدد باشد، بین گروه‌ها دست‌کم یک خانهٔ خالی هست.';

  @override
  String get rulesMistakes =>
      'پر کردن خانه‌ای که باید خالی بماند 1 جان می‌گیرد. علامت X رایگان است: هر طور دوست داری یادداشت کن. برای پر کردن خانه‌ای که X دارد، اول با دو ضربه X را بردار.';

  @override
  String get rulesScoring =>
      'هر پر کردن درست امتیاز دارد. پر کردن‌های درست پشت سر هم ضریب را بالا می‌برد (تا x5). تمام کردن ردیف‌ها و ستون‌ها امتیاز اضافه دارد.';

  @override
  String levelScore(int score) {
    return '$score امتیاز';
  }

  @override
  String totalScore(int total) {
    return 'مجموع: $total';
  }

  @override
  String get rulesGoal =>
      'همهٔ خانه‌های پر را پیدا کن تا بلوک‌ها به یک تصویر پنهان تبدیل شوند.';

  @override
  String worldLabel(int n) {
    return 'نقشهٔ $n';
  }

  @override
  String get worldsTitle => 'نقشه‌ها';

  @override
  String get worldUnlocked => 'نقشهٔ جدید باز شد!';

  @override
  String get worldComplete => 'نقشه تمام شد!';

  @override
  String nextWorld(String name) {
    return 'نقشهٔ بعدی: $name';
  }

  @override
  String nextWorldLocked(String name) {
    return 'این نقشه را تمام کن تا $name باز شود';
  }

  @override
  String nextWorldSoon(String name) {
    return '$name به‌زودی';
  }

  @override
  String get worldLocked => 'نقشهٔ قبلی را تمام کن';

  @override
  String get worldSoon => 'به‌زودی';

  @override
  String get youAreHere => 'اینجا هستی';

  @override
  String get mapStart => 'شروع';

  @override
  String playLevel(int n) {
    return 'بازی · مرحلهٔ $n';
  }

  @override
  String get tapToContinue => 'برای ادامه ضربه بزن';

  @override
  String starCount(int have, int max) {
    return '$have/$max';
  }

  @override
  String get settings => 'تنظیمات';

  @override
  String get settingsSound => 'جلوه‌های صوتی';

  @override
  String get settingsLanguage => 'زبان';

  @override
  String get settingsLanguageDevice => 'زبان دستگاه';

  @override
  String hintRow(int n) {
    return 'ردیف $n';
  }

  @override
  String hintColumn(int n) {
    return 'ستون $n';
  }

  @override
  String hintFullLine(String line, String clue) {
    return '$line ($clue): گروه‌ها با یک فاصله بین هرکدام کل خط را پر می‌کنند، پس هر خانه مشخص است. این خانه پر است!';
  }

  @override
  String hintOverlap(String line, String clue) {
    return '$line ($clue): گروه‌ها را به ابتدا یا انتها هل بده؛ این خانه همیشه داخل یک گروه است. پس باید پر باشد!';
  }

  @override
  String hintForcedFill(String line, String clue) {
    return '$line ($clue): خانه‌ها و Xهایی که از قبل داری جای گروه‌ها را محدود می‌کنند. در هر چینش ممکن، این خانه پر است!';
  }

  @override
  String hintForcedEmpty(String line, String clue) {
    return '$line ($clue): هیچ گروهی به این خانه نمی‌رسد، پس خالی است. اینجا یک X گذاشتیم.';
  }

  @override
  String get hintFallback => 'این خانه بخشی از تصویر است.';

  @override
  String get tutorialSkip => 'رد شدن';

  @override
  String get tutorialGotIt => 'فهمیدم';

  @override
  String tutorialLesson(int lesson, int count) {
    return 'درس $lesson/$count';
  }

  @override
  String get tutorialStart => 'بزن بریم!';

  @override
  String get tutorialSkipTitle => 'آموزش رد شود؟';

  @override
  String get tutorialSkipBody => 'فقط درس این مرحله رد شود یا کل آموزش؟';

  @override
  String get tutorialSkipLevel => 'فقط این مرحله';

  @override
  String get tutorialSkipAll => 'رد کردن همه';

  @override
  String get tutorialWelcome =>
      'سلام! در هر پازل یک تصویر پنهان است. عددها را بخوان، خانه‌های درست را پر کن و آن را آشکار کن!';

  @override
  String get tutorialL1Fill =>
      '[5]: این ردیف 5 خانهٔ پر دارد. ردیف هم 5 خانه است، پس همه پرند! روی یکی ضربه بزن.';

  @override
  String get tutorialL1Drag =>
      'عالی! حالا بدون برداشتن انگشت بکش و بقیهٔ ردیف را پر کن.';

  @override
  String get tutorialL1Row =>
      'این ردیف هم [5] است. این بار یک‌سره از این سر تا آن سر بکش.';

  @override
  String get tutorialL1AutoCross =>
      'دو خانهٔ [2] این ستون پیدا شد، پس بقیه خودبه‌خود X گرفتند. X یعنی: خالی.';

  @override
  String get tutorialL1Column =>
      'عددهای بالا برای ستون‌ها هستند. این ستون [5] است: از بالا به پایین بکش.';

  @override
  String get tutorialL1Count =>
      'این ردیف [3] خانه لازم دارد. خانه‌های X خالی‌اند، پس دقیقاً 3 خانه مانده. همه را پر کن!';

  @override
  String get tutorialL1Finish =>
      'ردیف آخر را خودت تمام کن و تصویر را آشکار کن!';

  @override
  String get tutorialL2Groups =>
      '[2 2]: دو گروه جدا. 2 پر، دست‌کم 1 خالی، بعد 2 پر. 2 + 1 + 2 = 5: دقیقاً جا می‌شود!';

  @override
  String get tutorialL2Cross =>
      'پس خانهٔ وسط خالی است. با دو ضربه رویش X بگذار.';

  @override
  String get tutorialL2Drag =>
      'X فقط یک یادداشت است و هزینه‌ای ندارد. حالا روی ردیف بکش: X رد می‌شود.';

  @override
  String get tutorialL2CrossSelf =>
      'ردیف پایینی هم [2 2] است. نوبت توست: اول با دو ضربه روی خانهٔ خالی X بگذار.';

  @override
  String get tutorialL2DragSelf => 'حالا بکش تا ردیف پر شود.';

  @override
  String get tutorialL2Mistakes =>
      'مراقب باش: پر کردن خانهٔ اشتباه آن را X قرمز می‌کند و یک قلب می‌گیرد. مطمئن نیستی؟ اول X بگذار!';

  @override
  String get tutorialL2Finish =>
      'بقیه‌اش با تو! گیر کردی؟ بشمار یک خط هنوز چند خانه کم دارد.';

  @override
  String get tutorialL3Overlap =>
      'این ستون [4] است و جا 5 خانه. بلوک 4تایی یا بالای بالا است یا پایین پایین. در هر دو حالت 3 خانهٔ وسط پرند!';

  @override
  String get tutorialL3OverlapFill =>
      'این خانه‌های قطعی را پر کن. اسم این ترفند هم‌پوشانی است: راز پازل‌های بزرگ!';

  @override
  String get tutorialL3OverlapSelf =>
      'این ستون هم [4] است. خانه‌های قطعی را خودت پیدا کن!';

  @override
  String get tutorialL3OverlapRow =>
      'و [3]؟ چه به چپ بچسبد چه به راست، خانهٔ وسط همیشه پر است. پرش کن!';

  @override
  String get tutorialL3Finish =>
      'عالی! این ترفند را در پازل‌های بزرگ زیاد به کار می‌بری. حالا تصویر را تمام کن!';

  @override
  String get tutorialL4Ones =>
      'سه ردیف بالا [1 1 1] هستند: سه خانهٔ تکی با فاصله بینشان. 1 + 1 + 1 + 1 + 1 = 5: دقیقاً جا می‌شوند!';

  @override
  String get tutorialL4CrossDrag =>
      'پس سه خانهٔ بالای این ستون خالی‌اند. دو ضربه بزن، در ضربهٔ دوم انگشتت را نگه دار و به پایین بکش: سه X یک‌جا!';

  @override
  String get tutorialL4CrossDragSelf =>
      'نوبت توست: با یک کشیدن روی سه خانهٔ خالی این ستون X بکش.';

  @override
  String get tutorialL4Erase =>
      'X اشتباه گذاشتی؟ دوباره دو ضربه بزن تا پاک شود. اگر با دو ضربه از روی یک X بکشی، X‌های سر راه پاک می‌شوند.';

  @override
  String get tutorialL4Finish => 'عالی! حالا تصویر را کامل کن.';

  @override
  String get tutorialL5Sum =>
      'درس آخر! این ستون [3 1] است: 3 + 1 + 1 = 5، پس قطعی است. خودت حلش کن!';

  @override
  String get tutorialL5Hint =>
      'گیر کردی؟ راهنما را بزن: قدم بعدی و دلیلش را نشان می‌دهد.';

  @override
  String get tutorialL5Finish =>
      'آماده‌ای! در جدول‌های بزرگ، خط‌های ضخیم هر 5 خانه را جدا می‌کنند تا شمردن آسان شود. تصویر را تمام کن!';
}
