// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get appTitle => 'BlockPuzzle';

  @override
  String get whoIsPlaying => 'کون کھیل رہا ہے؟';

  @override
  String get newGame => 'نیا کھیل';

  @override
  String get emptySlot => 'خالی خانہ';

  @override
  String get yourName => 'آپ کا نام';

  @override
  String get namePlaceholder => 'مثلاً عائشہ';

  @override
  String get nameRequired => 'نام لکھیں';

  @override
  String get pickColor => 'اپنا رنگ چنیں';

  @override
  String get start => 'شروع کریں';

  @override
  String get cancel => 'منسوخ کریں';

  @override
  String deleteSlotTitle(String name) {
    return '$name کو حذف کریں؟';
  }

  @override
  String get deleteSlotBody =>
      'اس کھلاڑی کی ساری پیش رفت حذف ہو جائے گی۔ اسے واپس نہیں لایا جا سکتا۔';

  @override
  String get delete => 'حذف کریں';

  @override
  String levelLabel(int n) {
    return 'مرحلہ $n';
  }

  @override
  String hintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count اشارے',
      one: '1 اشارہ',
    );
    return '$_temp0';
  }

  @override
  String get tutorialTap => 'ٹیپ: بھریں';

  @override
  String get tutorialDoubleTap =>
      'ڈبل ٹیپ: X لگائیں (X پر دوبارہ ڈبل ٹیپ: ہٹائیں)';

  @override
  String get tutorialDrag =>
      'دبا کر رکھیں اور کھسکائیں تاکہ ایک ساتھ کئی خانے نشان زد ہوں۔ X سے ڈبل ٹیپ کر کے کھسکائیں تو X کے نشان مٹ جاتے ہیں۔';

  @override
  String get hint => 'اشارہ';

  @override
  String get noHintsTitle => 'اشارے ختم ہو گئے';

  @override
  String get noHintsBody => '1 اشارہ پانے کے لیے ایک مختصر اشتہار دیکھیں۔';

  @override
  String get watchAdForHint => 'اشتہار دیکھیں: +1 اشارہ';

  @override
  String get outOfLivesTitle => 'جانیں ختم ہو گئیں';

  @override
  String get outOfLivesBody =>
      'ایک اور جان پانے کے لیے اشتہار دیکھیں، یا مرحلہ دوبارہ شروع کریں۔';

  @override
  String get watchAdForLife => 'اشتہار دیکھیں: +1 جان';

  @override
  String get restart => 'دوبارہ شروع کریں';

  @override
  String get backToLevels => 'مراحل پر واپس';

  @override
  String get levelComplete => 'زبردست!';

  @override
  String nextLevel(int n) {
    return 'اگلا: مرحلہ $n';
  }

  @override
  String get ok => 'ٹھیک ہے';

  @override
  String get allDoneSoon => 'نئے مراحل جلد آ رہے ہیں';

  @override
  String get adLabel => 'اشتہار';

  @override
  String get adPlaceholder => 'یہاں ایک اشتہار دکھایا جائے گا';

  @override
  String get adClose => 'بند کریں';

  @override
  String adCountdown(int seconds) {
    return '$seconds سیکنڈ';
  }

  @override
  String get rulesTitle => 'کیسے کھیلیں؟';

  @override
  String get rulesClues =>
      'بائیں اور اوپر کے نمبر بتاتے ہیں کہ اس قطار اور کالم میں کتنے خانے بھرے ہوئے ہیں۔ اگر کئی نمبر ہوں تو گروپوں کے درمیان کم از کم ایک خالی خانہ ہوتا ہے۔';

  @override
  String get rulesMistakes =>
      'جو خانہ خالی ہونا چاہیے اسے بھرنے پر 1 جان جاتی ہے۔ X کے نشان مفت ہیں: جیسے چاہیں نوٹس لیں۔ X والا خانہ بھرنے کے لیے پہلے ڈبل ٹیپ سے X ہٹائیں۔';

  @override
  String get rulesScoring =>
      'ہر درست خانہ بھرنے پر پوائنٹس ملتے ہیں۔ مسلسل درست بھرنے سے ضرب بڑھتی ہے (x5 تک)۔ قطاریں اور کالم مکمل کرنے پر بونس پوائنٹس ملتے ہیں۔';

  @override
  String levelScore(int score) {
    return '$score پوائنٹس';
  }

  @override
  String totalScore(int total) {
    return 'کل: $total';
  }

  @override
  String get rulesGoal =>
      'تمام بھرے ہوئے خانے ڈھونڈیں، اور بلاک ایک چھپی ہوئی تصویر بن جائیں گے۔';

  @override
  String worldLabel(int n) {
    return 'نقشہ $n';
  }

  @override
  String get worldsTitle => 'نقشے';

  @override
  String get worldUnlocked => 'نیا نقشہ کھل گیا!';

  @override
  String get worldComplete => 'نقشہ مکمل!';

  @override
  String nextWorld(String name) {
    return 'اگلا نقشہ: $name';
  }

  @override
  String nextWorldLocked(String name) {
    return '$name کھولنے کے لیے یہ نقشہ مکمل کریں';
  }

  @override
  String nextWorldSoon(String name) {
    return '$name جلد آ رہا ہے';
  }

  @override
  String get worldLocked => 'پچھلا نقشہ مکمل کریں';

  @override
  String get worldSoon => 'جلد آ رہا ہے';

  @override
  String get youAreHere => 'آپ یہاں ہیں';

  @override
  String get mapStart => 'آغاز';

  @override
  String playLevel(int n) {
    return 'کھیلیں · مرحلہ $n';
  }

  @override
  String get tapToContinue => 'جاری رکھنے کے لیے ٹیپ کریں';

  @override
  String starCount(int have, int max) {
    return '$have/$max';
  }

  @override
  String get settings => 'ترتیبات';

  @override
  String get settingsSound => 'صوتی اثرات';

  @override
  String get settingsLanguage => 'زبان';

  @override
  String get settingsLanguageDevice => 'آلے کی زبان';

  @override
  String hintRow(int n) {
    return 'قطار $n';
  }

  @override
  String hintColumn(int n) {
    return 'کالم $n';
  }

  @override
  String hintFullLine(String line, String clue) {
    return '$line ($clue): گروپ اور ان کے درمیان ایک ایک خلا پوری لکیر بھر دیتے ہیں، اس لیے ہر خانہ طے ہے۔ یہ خانہ بھرا ہوا ہے!';
  }

  @override
  String hintOverlap(String line, String clue) {
    return '$line ($clue): گروپوں کو شروع یا آخر کی طرف دھکیلیں، یہ خانہ ہمیشہ کسی گروپ کے اندر رہتا ہے۔ لہٰذا اسے بھرنا ہوگا!';
  }

  @override
  String hintForcedFill(String line, String clue) {
    return '$line ($clue): آپ کے پاس پہلے سے موجود خانے اور X بتاتے ہیں کہ گروپ کہاں سما سکتے ہیں۔ ہر ممکن ترتیب میں یہ خانہ بھرا ہوا ہے!';
  }

  @override
  String hintForcedEmpty(String line, String clue) {
    return '$line ($clue): کوئی گروپ اس خانے تک نہیں پہنچ سکتا، اس لیے یہ خالی ہے۔ ہم نے یہاں X لگا دیا ہے۔';
  }

  @override
  String get hintFallback => 'یہ خانہ تصویر کا حصہ ہے۔';

  @override
  String get tutorialSkip => 'چھوڑیں';

  @override
  String get tutorialGotIt => 'سمجھ گیا';

  @override
  String get tutorialL1Fill =>
      'نمبر بتاتے ہیں کہ اس قطار میں کتنے خانے بھرے ہیں۔ یہ قطار 5 کہتی ہے، تو پانچوں خانے بھرے ہیں! خانہ بھرنے کے لیے اس پر ٹیپ کریں۔';

  @override
  String get tutorialL1Drag =>
      'شاباش! اب انگلی دبا کر رکھیں اور کھسکا کر باقی قطار بھریں۔';

  @override
  String get tutorialL1Column =>
      'یہ کالم بھی 5 کہتا ہے: اوپر سے نیچے کی طرف کھسکائیں۔';

  @override
  String get tutorialL1Finish =>
      'جب کوئی قطار یا کالم مکمل ہو جائے تو اس کے باقی خانوں پر خود بخود X لگ جاتا ہے۔ باقی تصویر خود مکمل کریں!';

  @override
  String get tutorialL2Cross =>
      '⁦2 2⁩ کا مطلب ہے 2 بھرے خانے، کم از کم ایک خلا، پھر مزید 2 بھرے خانے۔ ⁦2 + خلا + 2 = 5⁩، اس لیے قطار یقینی ہے! X لگانے کے لیے خالی خانے پر ڈبل ٹیپ کریں۔';

  @override
  String get tutorialL2Drag =>
      'کھسکاتے وقت آپ کے X والے خانے چھوڑ دیے جاتے ہیں۔ پوری قطار پر کھسکا کر اسے بھریں۔';

  @override
  String get tutorialL2Rules =>
      'غلط خانہ بھرنے پر 1 جان جاتی ہے؛ X کے نشان مفت ہیں۔ اگر اٹک جائیں تو اشارہ کا بٹن وجہ بھی بتاتا ہے۔ باقی آپ پر ہے!';
}
