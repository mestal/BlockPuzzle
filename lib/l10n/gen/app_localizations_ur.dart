// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get appTitle => 'Pixel Bloom';

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
  String get noHintsBodyNoAds => 'آپ اپنے سارے اشارے استعمال کر چکے ہیں۔';

  @override
  String get watchAdForHint => 'اشتہار دیکھیں: +1 اشارہ';

  @override
  String get outOfLivesTitle => 'جانیں ختم ہو گئیں';

  @override
  String get outOfLivesBody =>
      'ایک اور جان پانے کے لیے اشتہار دیکھیں، یا مرحلہ دوبارہ شروع کریں۔';

  @override
  String get outOfLivesBodyNoAds =>
      'مرحلہ دوبارہ شروع کریں، یا مراحل پر واپس جائیں۔';

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
  String tutorialLesson(int lesson, int count) {
    return 'سبق $lesson/$count';
  }

  @override
  String get tutorialStart => 'چلیں شروع کریں!';

  @override
  String get tutorialSkipTitle => 'تربیت چھوڑ دیں؟';

  @override
  String get tutorialSkipBody => 'صرف اس مرحلے کا سبق چھوڑیں یا پوری تربیت؟';

  @override
  String get tutorialSkipLevel => 'صرف یہ مرحلہ';

  @override
  String get tutorialSkipAll => 'سب چھوڑ دیں';

  @override
  String get tutorialWelcome =>
      'السلام علیکم! ہر پہیلی میں ایک تصویر چھپی ہے۔ نمبر پڑھیں، صحیح خانے بھریں اور اسے ظاہر کریں!';

  @override
  String get tutorialL1Fill =>
      '[5]: اس قطار میں 5 بھرے خانے ہیں۔ قطار بھی 5 خانوں کی ہے، یعنی سب بھرے ہیں! کسی ایک پر ٹیپ کریں۔';

  @override
  String get tutorialL1Drag =>
      'زبردست! اب انگلی اٹھائے بغیر کھسکائیں اور باقی قطار بھر دیں۔';

  @override
  String get tutorialL1Row =>
      'یہ قطار بھی [5] ہے۔ اس بار ایک ہی بار میں ایک سرے سے دوسرے سرے تک کھسکائیں۔';

  @override
  String get tutorialL1AutoCross =>
      'اس کالم کے [2] خانے مل گئے، اس لیے باقی پر خود بخود X لگ گیا۔ X کا مطلب ہے: خالی۔';

  @override
  String get tutorialL1Column =>
      'اوپر والے نمبر کالموں کے لیے ہیں۔ یہ کالم [5] ہے: اوپر سے نیچے کھسکائیں۔';

  @override
  String get tutorialL1Count =>
      'اس قطار کو [3] خانے چاہییں۔ X والے خانے خالی ہیں، تو ٹھیک 3 خانے بچے ہیں۔ سب بھر دیں!';

  @override
  String get tutorialL1Finish => 'آخری قطار خود مکمل کریں اور تصویر ظاہر کریں!';

  @override
  String get tutorialL2Groups =>
      '[2 2]: دو الگ گروہ۔ 2 بھرے، کم از کم 1 خالی، پھر 2 بھرے۔ 2 + 1 + 2 = 5: بالکل پورا آتا ہے!';

  @override
  String get tutorialL2Cross =>
      'یعنی درمیانی خانہ خالی ہے۔ اس پر ڈبل ٹیپ کر کے X لگائیں۔';

  @override
  String get tutorialL2Drag =>
      'X صرف ایک نوٹ ہے، اس کی کوئی قیمت نہیں۔ اب قطار پر کھسکائیں: X والا خانہ چھوڑ دیا جاتا ہے۔';

  @override
  String get tutorialL2CrossSelf =>
      'نیچے والی قطار بھی [2 2] ہے۔ آپ کی باری: پہلے خالی خانے پر ڈبل ٹیپ کر کے X لگائیں۔';

  @override
  String get tutorialL2DragSelf => 'اب کھسکا کر قطار بھریں۔';

  @override
  String get tutorialL2Mistakes =>
      'دھیان دیں: غلط خانہ بھرنے پر وہ سرخ X بن جاتا ہے اور ایک دل جاتا ہے۔ یقین نہیں؟ پہلے X لگائیں!';

  @override
  String get tutorialL2Finish =>
      'باقی آپ کا! اٹک گئے؟ گنیں کہ ایک لکیر میں ابھی کتنے خانے کم ہیں۔';

  @override
  String get tutorialL3Overlap =>
      'یہ کالم [4] ہے اور جگہ 5 خانوں کی۔ 4 کا بلاک یا بالکل اوپر ہے یا بالکل نیچے۔ دونوں صورتوں میں درمیان کے 3 بھرے ہیں!';

  @override
  String get tutorialL3OverlapFill =>
      'یہ یقینی خانے بھریں۔ اس ترکیب کا نام اوورلیپ ہے: بڑی پہیلیوں کا راز!';

  @override
  String get tutorialL3OverlapSelf =>
      'یہ کالم بھی [4] ہے۔ یقینی خانے خود ڈھونڈیں!';

  @override
  String get tutorialL3OverlapRow =>
      'اور [3]؟ بائیں رکھیں یا دائیں، درمیانی خانہ ہمیشہ بھرا ہوتا ہے۔ اسے بھریں!';

  @override
  String get tutorialL3Finish =>
      'شاندار! یہ ترکیب بڑی پہیلیوں میں بہت کام آئے گی۔ اب تصویر مکمل کریں!';

  @override
  String get tutorialL4Ones =>
      'اوپر کی تین قطاریں [1 1 1] ہیں: تین اکیلے خانے، بیچ میں خالی جگہ۔ 1 + 1 + 1 + 1 + 1 = 5: بالکل پورے آتے ہیں!';

  @override
  String get tutorialL4CrossDrag =>
      'یعنی اس کالم کے اوپر کے تین خانے خالی ہیں۔ ڈبل ٹیپ کریں، دوسرے ٹیپ پر انگلی دبائے رکھیں اور نیچے کھسکائیں: ایک ساتھ تین X!';

  @override
  String get tutorialL4CrossDragSelf =>
      'آپ کی باری: ایک ہی بار کھسکا کر اس کالم کے تین خالی خانوں پر X بنائیں۔';

  @override
  String get tutorialL4Erase =>
      'غلط X لگ گیا؟ اس پر دوبارہ ڈبل ٹیپ کریں، ہٹ جائے گا۔ X سے ڈبل ٹیپ کر کے کھسکائیں تو راستے کے X مٹ جاتے ہیں۔';

  @override
  String get tutorialL4Finish => 'بہت خوب! اب تصویر مکمل کریں۔';

  @override
  String get tutorialL5Gaps =>
      'آخری سبق: X سے حل کرنا! کنارے کے چاروں کالم [2 2] ہیں: 2 + 1 + 2 = 5۔ ان سب کے خالی خانے درمیانی قطار میں آتے ہیں۔';

  @override
  String get tutorialL5CrossDrag =>
      'ان خالی خانوں پر X لگائیں: ڈبل ٹیپ کریں، دوسرے ٹیپ پر انگلی دبائے رکھیں اور ایک طرف کھسکائیں: ایک ساتھ دو X!';

  @override
  String get tutorialL5CrossDragSelf =>
      'آپ کی باری: ایک ہی بار کھسکا کر دائیں طرف کے دو خالی خانوں پر X بنائیں۔';

  @override
  String get tutorialL5Count =>
      'یہ قطار [1] ہے، اور X کے بعد صرف ایک خانہ بچا۔ X سے گننا آسان ہو جاتا ہے: اسے بھریں!';

  @override
  String get tutorialL5Hint =>
      'اٹک گئے؟ اشارہ دبائیں: یہ اگلا قدم اور اس کی وجہ دکھاتا ہے۔';

  @override
  String get tutorialL5Finish =>
      'آپ تیار ہیں! بڑے جال میں موٹی لکیریں ہر 5 خانوں کو الگ کرتی ہیں تاکہ گننا آسان ہو۔ تصویر مکمل کریں!';
}
