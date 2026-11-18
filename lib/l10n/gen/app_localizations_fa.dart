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
  String get pickColor => 'رنگت را انتخاب کن';

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
  String get tutorialL1Fill =>
      'عددها نشان می‌دهند چند خانه در آن ردیف پر است. این ردیف می‌گوید 5، پس هر 5 خانه پر است! روی یک خانه ضربه بزن تا پر شود.';

  @override
  String get tutorialL1Drag =>
      'آفرین! حالا انگشتت را نگه دار و بکش تا بقیهٔ ردیف پر شود.';

  @override
  String get tutorialL1Column => 'این ستون هم می‌گوید 5: از بالا به پایین بکش.';

  @override
  String get tutorialL1Finish =>
      'وقتی یک ردیف یا ستون تمام شود، بقیهٔ خانه‌هایش خودبه‌خود X می‌گیرند. بقیهٔ تصویر را خودت تمام کن!';

  @override
  String get tutorialL2Cross =>
      '⁦2 2⁩ یعنی 2 خانهٔ پر، دست‌کم یک فاصله، بعد 2 خانهٔ پر دیگر. ⁦2 + فاصله + 2 = 5⁩، پس ردیف قطعی است! روی خانهٔ خالی دو ضربه بزن تا X بگذاری.';

  @override
  String get tutorialL2Drag =>
      'خانه‌هایی که X تو را دارند هنگام کشیدن رد می‌شوند. روی کل ردیف بکش تا پر شود.';

  @override
  String get tutorialL2Rules =>
      'پر کردن خانهٔ اشتباه 1 جان می‌گیرد؛ علامت X رایگان است. اگر گیر کردی، دکمهٔ راهنما دلیلش را هم توضیح می‌دهد. بقیه‌اش با خودت!';
}
