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
  String get pickColor => 'তোমার রং বেছে নাও';

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
  String get tutorialL1Fill =>
      'সংখ্যাগুলো বলে দেয় সেই সারিতে কতগুলো ঘর ভরাট। এই সারি বলছে 5, তাই 5টি ঘরই ভরাট! ঘর ভরাট করতে তাতে ট্যাপ করো।';

  @override
  String get tutorialL1Drag =>
      'দারুণ! এবার আঙুল চেপে ধরে টেনে সারির বাকিটা ভরাট করো।';

  @override
  String get tutorialL1Column => 'এই কলামও বলছে 5: ওপর থেকে নিচে টেনে নাও।';

  @override
  String get tutorialL1Finish =>
      'কোনো সারি বা কলাম শেষ হলে তার বাকি ঘরগুলোতে নিজে থেকেই X পড়ে যায়। ছবির বাকিটা নিজেই শেষ করো!';

  @override
  String get tutorialL2Cross =>
      '2 2 মানে 2টি ভরাট ঘর, অন্তত একটি ফাঁক, তারপর আরও 2টি ভরাট ঘর। 2 + ফাঁক + 2 = 5, তাই সারিটি নিশ্চিত! X দিতে খালি ঘরে ডাবল ট্যাপ করো।';

  @override
  String get tutorialL2Drag =>
      'টানার সময় তোমার X দেওয়া ঘরগুলো বাদ পড়ে। পুরো সারি বরাবর টেনে সেটি ভরাট করো।';

  @override
  String get tutorialL2Rules =>
      'ভুল ঘর ভরাট করলে 1টি জীবন যায়; X চিহ্ন বিনামূল্যে। আটকে গেলে সংকেত বোতাম কারণটাও বুঝিয়ে দেয়। বাকিটা তোমার হাতে!';
}
