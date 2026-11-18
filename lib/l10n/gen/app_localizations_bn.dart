// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appTitle => 'Pixel Bloom';

  @override
  String get whoIsPlaying => 'কে খেলছে?';

  @override
  String get newGame => 'নতুন খেলা';

  @override
  String get emptySlot => 'খালি স্লট';

  @override
  String get yourName => 'তোমার নাম';

  @override
  String get namePlaceholder => 'যেমন রিয়া';

  @override
  String get nameRequired => 'একটি নাম লেখো';

  @override
  String get start => 'শুরু করো';

  @override
  String get cancel => 'বাতিল';

  @override
  String deleteSlotTitle(String name) {
    return '$name মুছে ফেলবে?';
  }

  @override
  String get deleteSlotBody =>
      'এই খেলোয়াড়ের সব অগ্রগতি মুছে যাবে। এটি আর ফেরানো যাবে না।';

  @override
  String get delete => 'মুছে ফেলো';

  @override
  String levelLabel(int n) {
    return 'লেভেল $n';
  }

  @override
  String hintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি সংকেত',
      one: '1টি সংকেত',
    );
    return '$_temp0';
  }

  @override
  String get tutorialTap => 'ট্যাপ: ভরাট করো';

  @override
  String get tutorialDoubleTap =>
      'ডাবল ট্যাপ: X দাও (X-এ আবার ডাবল ট্যাপ: সরিয়ে দাও)';

  @override
  String get tutorialDrag =>
      'চেপে ধরে টেনে নিয়ে একসাথে অনেক ঘর চিহ্নিত করো। X মুছতে ডাবল ট্যাপ করে কোনো X থেকে টেনে নাও।';

  @override
  String get hint => 'সংকেত';

  @override
  String get noHintsTitle => 'আর কোনো সংকেত নেই';

  @override
  String get noHintsBody => '1টি সংকেত পেতে একটি ছোট বিজ্ঞাপন দেখো।';

  @override
  String get noHintsBodyNoAds => 'তুমি সব সংকেত ব্যবহার করে ফেলেছ।';

  @override
  String get watchAdForHint => 'বিজ্ঞাপন দেখো: +1 সংকেত';

  @override
  String get outOfLivesTitle => 'জীবন শেষ';

  @override
  String get outOfLivesBody =>
      'আরও 1টি জীবন পেতে একটি বিজ্ঞাপন দেখো, অথবা লেভেলটি আবার শুরু করো।';

  @override
  String get outOfLivesBodyNoAds =>
      'লেভেলটি আবার শুরু করো, অথবা লেভেলে ফিরে যাও।';

  @override
  String get watchAdForLife => 'বিজ্ঞাপন দেখো: +1 জীবন';

  @override
  String get restart => 'আবার শুরু করো';

  @override
  String get backToLevels => 'লেভেলে ফিরে যাও';

  @override
  String get levelComplete => 'দারুণ!';

  @override
  String nextLevel(int n) {
    return 'পরবর্তী: লেভেল $n';
  }

  @override
  String get ok => 'ঠিক আছে';

  @override
  String get allDoneSoon => 'শিগগিরই নতুন লেভেল আসছে';

  @override
  String get adLabel => 'বিজ্ঞাপন';

  @override
  String get adPlaceholder => 'এখানে একটি বিজ্ঞাপন দেখানো হবে';

  @override
  String get adClose => 'বন্ধ করো';

  @override
  String adCountdown(int seconds) {
    return '$seconds সে.';
  }

  @override
  String get rulesTitle => 'কীভাবে খেলবে?';

  @override
  String get rulesClues =>
      'বাঁ দিকের ও ওপরের সংখ্যাগুলো বলে দেয় সেই সারি ও কলামে কতগুলো ভরাট ঘর আছে। একাধিক সংখ্যা থাকলে দলগুলোর মাঝে অন্তত একটি খালি ঘর থাকে।';

  @override
  String get rulesMistakes =>
      'যে ঘর খালি থাকার কথা সেটি ভরাট করলে 1টি জীবন যায়। X চিহ্ন বিনামূল্যে: যেমন খুশি নোট রাখো। X দেওয়া ঘর ভরাট করতে আগে ডাবল ট্যাপ করে X সরাও।';

  @override
  String get rulesScoring =>
      'প্রতিটি সঠিক ভরাটে পয়েন্ট মেলে। পরপর সঠিক ভরাটে গুণক বাড়ে (x5 পর্যন্ত)। সারি ও কলাম শেষ করলে বোনাস পয়েন্ট মেলে।';

  @override
  String levelScore(int score) {
    return '$score পয়েন্ট';
  }

  @override
  String totalScore(int total) {
    return 'মোট: $total';
  }

  @override
  String get rulesGoal =>
      'সব ভরাট ঘর খুঁজে বের করো, ব্লকগুলো একটি লুকানো ছবিতে বদলে যাবে।';

  @override
  String worldLabel(int n) {
    return 'মানচিত্র $n';
  }

  @override
  String get worldsTitle => 'মানচিত্র';

  @override
  String get worldUnlocked => 'নতুন মানচিত্র খুলে গেছে!';

  @override
  String get worldComplete => 'মানচিত্র সম্পূর্ণ!';

  @override
  String nextWorld(String name) {
    return 'পরবর্তী মানচিত্র: $name';
  }

  @override
  String nextWorldLocked(String name) {
    return '$name খুলতে এই মানচিত্রটি শেষ করো';
  }

  @override
  String nextWorldSoon(String name) {
    return '$name শিগগিরই আসছে';
  }

  @override
  String get worldLocked => 'আগের মানচিত্রটি শেষ করো';

  @override
  String get worldSoon => 'শিগগিরই আসছে';

  @override
  String get youAreHere => 'তুমি এখানে';

  @override
  String get mapStart => 'শুরু';

  @override
  String playLevel(int n) {
    return 'খেলো · লেভেল $n';
  }

  @override
  String get tapToContinue => 'চালিয়ে যেতে ট্যাপ করো';

  @override
  String starCount(int have, int max) {
    return '$have/$max';
  }

  @override
  String get settings => 'সেটিংস';

  @override
  String get settingsSound => 'সাউন্ড ইফেক্ট';

  @override
  String get settingsLanguage => 'ভাষা';

  @override
  String get settingsLanguageDevice => 'ডিভাইসের ভাষা';

  @override
  String hintRow(int n) {
    return 'সারি $n';
  }

  @override
  String hintColumn(int n) {
    return 'কলাম $n';
  }

  @override
  String hintFullLine(String line, String clue) {
    return '$line ($clue): দলগুলো আর প্রতিটির মাঝে একটি করে ফাঁক মিলে পুরো লাইন ভরে যায়, তাই প্রতিটি ঘর নিশ্চিত। এই ঘরটি ভরাট!';
  }

  @override
  String hintOverlap(String line, String clue) {
    return '$line ($clue): দলগুলোকে শুরুতে বা শেষে ঠেলে দাও, এই ঘরটি সবসময় কোনো দলের ভেতরে থাকে। তাই এটি ভরাট হতেই হবে!';
  }

  @override
  String hintForcedFill(String line, String clue) {
    return '$line ($clue): তোমার আগে থেকে থাকা ঘর আর X মিলে দলগুলো কোথায় বসতে পারে তা সীমিত করে। প্রতিটি সম্ভাব্য বিন্যাসে এই ঘরটি ভরাট!';
  }

  @override
  String hintForcedEmpty(String line, String clue) {
    return '$line ($clue): কোনো দলই এই ঘরে পৌঁছাতে পারে না, তাই এটি খালি। এখানে একটি X দিলাম।';
  }

  @override
  String get hintFallback => 'এই ঘরটি ছবির অংশ।';

  @override
  String get tutorialSkip => 'এড়িয়ে যাও';

  @override
  String get tutorialGotIt => 'বুঝেছি';

  @override
  String tutorialLesson(int lesson, int count) {
    return 'পাঠ $lesson/$count';
  }

  @override
  String get tutorialStart => 'চলো শুরু করি!';

  @override
  String get tutorialSkipTitle => 'টিউটোরিয়াল এড়িয়ে যাবে?';

  @override
  String get tutorialSkipBody =>
      'শুধু এই লেভেলের পাঠ এড়াবে, নাকি পুরো টিউটোরিয়াল?';

  @override
  String get tutorialSkipLevel => 'শুধু এই লেভেল';

  @override
  String get tutorialSkipAll => 'সব এড়িয়ে যাও';

  @override
  String get tutorialWelcome =>
      'হ্যালো! প্রতিটি ধাঁধায় একটি ছবি লুকিয়ে আছে। সংখ্যা পড়ো, সঠিক ঘর ভরাট করো আর ছবিটা বের করো!';

  @override
  String get tutorialL1Fill =>
      '[5]: এই সারিতে 5টি ভরাট ঘর। সারিটাও 5 ঘরের, তাই সবগুলোই ভরাট! একটিতে ট্যাপ করো।';

  @override
  String get tutorialL1Drag =>
      'দারুণ! এবার আঙুল না তুলে টেনে বাকি সারিটা ভরাট করো।';

  @override
  String get tutorialL1Row =>
      'এই সারিটাও [5]। এবার এক টানে এক মাথা থেকে অন্য মাথা পর্যন্ত টানো।';

  @override
  String get tutorialL1AutoCross =>
      'এই কলামের [2]টি ঘর পাওয়া গেছে, তাই বাকিগুলোতে নিজে থেকেই X পড়েছে। X মানে: খালি।';

  @override
  String get tutorialL1Column =>
      'ওপরের সংখ্যাগুলো কলামের জন্য। এই কলাম [5]: ওপর থেকে নিচে টানো।';

  @override
  String get tutorialL1Count =>
      'এই সারিতে [3]টি ঘর দরকার। X দেওয়া ঘরগুলো খালি, তাই ঠিক 3টি ঘর বাকি। সবগুলো ভরাট করো!';

  @override
  String get tutorialL1Finish => 'শেষ সারিটা নিজেই শেষ করো আর ছবিটা বের করো!';

  @override
  String get tutorialL2Groups =>
      '[2 2]: দুটি আলাদা দল। 2টি ভরাট, অন্তত 1টি খালি, তারপর 2টি ভরাট। 2 + 1 + 2 = 5: একদম মাপে মাপে!';

  @override
  String get tutorialL2Cross =>
      'তাহলে মাঝের ঘরটি খালি। ওতে ডাবল ট্যাপ করে X দাও।';

  @override
  String get tutorialL2Drag =>
      'X শুধু একটা নোট, এর কোনো খরচ নেই। এবার সারি বরাবর টানো: X দেওয়া ঘর বাদ পড়ে।';

  @override
  String get tutorialL2CrossSelf =>
      'নিচের সারিটাও [2 2]। তোমার পালা: আগে খালি ঘরে ডাবল ট্যাপ করে X দাও।';

  @override
  String get tutorialL2DragSelf => 'এবার টেনে সারিটা ভরাট করো।';

  @override
  String get tutorialL2Mistakes =>
      'সাবধান: ভুল ঘর ভরাট করলে সেটি লাল X হয়ে যায় আর একটি হৃদয় যায়। নিশ্চিত নও? আগে X দাও!';

  @override
  String get tutorialL2Finish =>
      'বাকিটা তোমার! আটকে গেলে গুনে দেখো একটা লাইনে আর কত ঘর বাকি।';

  @override
  String get tutorialL3Overlap =>
      'এই কলাম [4], জায়গা 5 ঘরের। 4-এর ব্লকটি হয় একদম ওপরে, নয়তো একদম নিচে। দুই ক্ষেত্রেই মাঝের 3টি ঘর ভরাট!';

  @override
  String get tutorialL3OverlapFill =>
      'এই নিশ্চিত ঘরগুলো ভরাট করো। এই কৌশলের নাম ওভারল্যাপ: বড় ধাঁধার রহস্য!';

  @override
  String get tutorialL3OverlapSelf =>
      'এই কলামও [4]। নিশ্চিত ঘরগুলো নিজেই খোঁজো!';

  @override
  String get tutorialL3OverlapRow =>
      'আর [3]? বাঁয়ে সরুক বা ডানে, মাঝের ঘরটি সবসময় ভরাট। ওটা ভরাট করো!';

  @override
  String get tutorialL3Finish =>
      'চমৎকার! বড় ধাঁধায় এই কৌশল অনেক কাজে লাগবে। এবার ছবিটা শেষ করো!';

  @override
  String get tutorialL4Ones =>
      'ওপরের দুই সারি [1 1 1]: তিনটি একক ঘর, মাঝে ফাঁক। 1 + 1 + 1 + 1 + 1 = 5: একদম মাপে মাপে!';

  @override
  String get tutorialL4CrossDrag =>
      'এই দুটি ঘর খালি। ডাবল ট্যাপ করো, দ্বিতীয় ট্যাপে আঙুল চেপে রেখে নিচে টানো: X-এর লাইন!';

  @override
  String get tutorialL4CrossDragSelf =>
      'তোমার পালা: এই কলামের দুটি খালি ঘরে X আঁকো।';

  @override
  String get tutorialL4Erase =>
      'ভুল X দিয়েছ? ওতে আবার ডাবল ট্যাপ করো, মুছে যাবে। X থেকে ডাবল ট্যাপ করে টানলে পথের X-গুলো মুছে যায়।';

  @override
  String get tutorialL4Finish => 'দারুণ! এবার ছবিটা শেষ করো।';

  @override
  String get tutorialL5Sum =>
      'শেষ পাঠ! এই কলাম [3 1]: 3 + 1 + 1 = 5, তাই নিশ্চিত। নিজেই সমাধান করো!';

  @override
  String get tutorialL5Hint =>
      'আটকে গেলে সংকেত চাপো: এটি পরের ধাপ আর তার কারণ দেখায়।';

  @override
  String get tutorialL5Finish =>
      'তুমি তৈরি! বড় গ্রিডে মোটা রেখা প্রতি 5 ঘর আলাদা করে, তাই গোনা সহজ। ছবিটা শেষ করো!';
}
