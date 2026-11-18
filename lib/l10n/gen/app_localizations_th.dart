// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appTitle => 'Pixel Bloom';

  @override
  String get whoIsPlaying => 'ใครจะเล่น?';

  @override
  String get newGame => 'เกมใหม่';

  @override
  String get emptySlot => 'ช่องว่าง';

  @override
  String get yourName => 'ชื่อของคุณ';

  @override
  String get namePlaceholder => 'เช่น มะลิ';

  @override
  String get nameRequired => 'กรุณาใส่ชื่อ';

  @override
  String get start => 'เริ่ม';

  @override
  String get cancel => 'ยกเลิก';

  @override
  String deleteSlotTitle(String name) {
    return 'ลบ $name ไหม?';
  }

  @override
  String get deleteSlotBody =>
      'ความคืบหน้าทั้งหมดของผู้เล่นนี้จะถูกลบ และไม่สามารถย้อนกลับได้';

  @override
  String get delete => 'ลบ';

  @override
  String levelLabel(int n) {
    return 'ด่าน $n';
  }

  @override
  String hintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'คำใบ้ $count ครั้ง',
    );
    return '$_temp0';
  }

  @override
  String get tutorialTap => 'แตะ: เติมช่อง';

  @override
  String get tutorialDoubleTap =>
      'แตะสองครั้ง: ใส่ X (แตะ X สองครั้งอีกครั้ง: ลบออก)';

  @override
  String get tutorialDrag =>
      'กดค้างแล้วลากเพื่อทำเครื่องหมายหลายช่องพร้อมกัน แตะสองครั้งแล้วลากจาก X เพื่อลบเครื่องหมาย X';

  @override
  String get hint => 'คำใบ้';

  @override
  String get noHintsTitle => 'คำใบ้หมดแล้ว';

  @override
  String get noHintsBody => 'ดูโฆษณาสั้น ๆ เพื่อรับคำใบ้ 1 ครั้ง';

  @override
  String get noHintsBodyNoAds => 'คุณใช้คำใบ้หมดแล้ว';

  @override
  String get watchAdForHint => 'ดูโฆษณา: +1 คำใบ้';

  @override
  String get outOfLivesTitle => 'ชีวิตหมดแล้ว';

  @override
  String get outOfLivesBody =>
      'ดูโฆษณาเพื่อรับชีวิตเพิ่ม 1 ชีวิต หรือเริ่มด่านใหม่';

  @override
  String get outOfLivesBodyNoAds => 'เริ่มด่านนี้ใหม่ หรือกลับไปที่รายการด่าน';

  @override
  String get watchAdForLife => 'ดูโฆษณา: +1 ชีวิต';

  @override
  String get restart => 'เริ่มใหม่';

  @override
  String get backToLevels => 'กลับไปที่ด่าน';

  @override
  String get levelComplete => 'เยี่ยมมาก!';

  @override
  String nextLevel(int n) {
    return 'ถัดไป: ด่าน $n';
  }

  @override
  String get ok => 'ตกลง';

  @override
  String get allDoneSoon => 'ด่านใหม่เร็ว ๆ นี้';

  @override
  String get adLabel => 'โฆษณา';

  @override
  String get adPlaceholder => 'โฆษณาจะแสดงที่นี่';

  @override
  String get adClose => 'ปิด';

  @override
  String adCountdown(int seconds) {
    return '$seconds วิ';
  }

  @override
  String get rulesTitle => 'เล่นอย่างไร?';

  @override
  String get rulesClues =>
      'ตัวเลขด้านซ้ายและด้านบนบอกว่าแถวและคอลัมน์นั้นมีช่องที่ถูกเติมกี่ช่อง ถ้ามีหลายตัวเลข แต่ละกลุ่มจะมีช่องว่างคั่นอย่างน้อยหนึ่งช่อง';

  @override
  String get rulesMistakes =>
      'การเติมช่องที่ควรว่างจะเสีย 1 ชีวิต เครื่องหมาย X ใช้ได้ฟรี จดบันทึกได้ตามใจ ถ้าจะเติมช่องที่มี X ให้แตะสองครั้งเพื่อลบ X ก่อน';

  @override
  String get rulesScoring =>
      'เติมถูกแต่ละช่องได้คะแนน เติมถูกต่อเนื่องจะเพิ่มตัวคูณ (สูงสุด x5) ทำแถวและคอลัมน์ครบจะได้คะแนนโบนัส';

  @override
  String levelScore(int score) {
    return '$score คะแนน';
  }

  @override
  String totalScore(int total) {
    return 'รวม: $total';
  }

  @override
  String get rulesGoal =>
      'หาช่องที่ต้องเติมให้ครบ แล้วบล็อกจะกลายเป็นภาพที่ซ่อนอยู่';

  @override
  String worldLabel(int n) {
    return 'แผนที่ $n';
  }

  @override
  String get worldsTitle => 'แผนที่';

  @override
  String get worldUnlocked => 'ปลดล็อกแผนที่ใหม่แล้ว!';

  @override
  String get worldComplete => 'ผ่านแผนที่แล้ว!';

  @override
  String nextWorld(String name) {
    return 'แผนที่ถัดไป: $name';
  }

  @override
  String nextWorldLocked(String name) {
    return 'ผ่านแผนที่นี้เพื่อปลดล็อก $name';
  }

  @override
  String nextWorldSoon(String name) {
    return '$name เร็ว ๆ นี้';
  }

  @override
  String get worldLocked => 'ผ่านแผนที่ก่อนหน้าก่อน';

  @override
  String get worldSoon => 'เร็ว ๆ นี้';

  @override
  String get youAreHere => 'คุณอยู่ที่นี่';

  @override
  String get mapStart => 'จุดเริ่มต้น';

  @override
  String playLevel(int n) {
    return 'เล่น · ด่าน $n';
  }

  @override
  String get tapToContinue => 'แตะเพื่อดำเนินการต่อ';

  @override
  String starCount(int have, int max) {
    return '$have/$max';
  }

  @override
  String get settings => 'การตั้งค่า';

  @override
  String get settingsSound => 'เอฟเฟกต์เสียง';

  @override
  String get settingsLanguage => 'ภาษา';

  @override
  String get settingsLanguageDevice => 'ภาษาของอุปกรณ์';

  @override
  String hintRow(int n) {
    return 'แถว $n';
  }

  @override
  String hintColumn(int n) {
    return 'คอลัมน์ $n';
  }

  @override
  String hintFullLine(String line, String clue) {
    return '$line ($clue): กลุ่มทั้งหมดรวมช่องว่างคั่นกลุ่มละหนึ่งช่องเต็มทั้งเส้นพอดี ทุกช่องจึงแน่นอน ช่องนี้ต้องเติม!';
  }

  @override
  String hintOverlap(String line, String clue) {
    return '$line ($clue): ไม่ว่าจะดันกลุ่มไปชิดต้นหรือชิดท้าย ช่องนี้ก็อยู่ในกลุ่มเสมอ ช่องนี้จึงต้องเติม!';
  }

  @override
  String hintForcedFill(String line, String clue) {
    return '$line ($clue): ช่องและ X ที่คุณมีอยู่แล้วจำกัดตำแหน่งที่กลุ่มจะวางได้ ในทุกแบบที่เป็นไปได้ ช่องนี้ถูกเติม!';
  }

  @override
  String hintForcedEmpty(String line, String clue) {
    return '$line ($clue): ไม่มีกลุ่มไหนไปถึงช่องนี้ได้ ช่องนี้จึงว่าง เราใส่ X ไว้ให้แล้ว';
  }

  @override
  String get hintFallback => 'ช่องนี้เป็นส่วนหนึ่งของภาพ';

  @override
  String get tutorialSkip => 'ข้าม';

  @override
  String get tutorialGotIt => 'เข้าใจแล้ว';

  @override
  String tutorialLesson(int lesson, int count) {
    return 'บทเรียน $lesson/$count';
  }

  @override
  String get tutorialStart => 'เริ่มกันเลย!';

  @override
  String get tutorialSkipTitle => 'ข้ามบทแนะนำไหม?';

  @override
  String get tutorialSkipBody =>
      'ข้ามเฉพาะบทเรียนของด่านนี้ หรือข้ามบทแนะนำทั้งหมด?';

  @override
  String get tutorialSkipLevel => 'เฉพาะด่านนี้';

  @override
  String get tutorialSkipAll => 'ข้ามทั้งหมด';

  @override
  String get tutorialWelcome =>
      'สวัสดี! ทุกปริศนาซ่อนภาพไว้ อ่านตัวเลข เติมช่องที่ถูกต้อง แล้วเผยภาพออกมา!';

  @override
  String get tutorialL1Fill =>
      '[5]: แถวนี้มีช่องที่ถูกเติม 5 ช่อง แถวยาว 5 ช่องพอดี จึงเติมทั้งหมด! แตะสักช่อง';

  @override
  String get tutorialL1Drag =>
      'เยี่ยม! ทีนี้ลากโดยไม่ยกนิ้วเพื่อเติมส่วนที่เหลือของแถว';

  @override
  String get tutorialL1Row => 'แถวนี้ก็ [5] ครั้งนี้ลากจากหัวจรดท้ายในทีเดียว';

  @override
  String get tutorialL1AutoCross =>
      'เจอช่อง [2] ช่องของคอลัมน์นี้แล้ว ช่องที่เหลือจึงได้ X เอง X หมายถึง: ว่าง';

  @override
  String get tutorialL1Column =>
      'ตัวเลขด้านบนเป็นของคอลัมน์ คอลัมน์นี้คือ [5]: ลากจากบนลงล่าง';

  @override
  String get tutorialL1Count =>
      'แถวนี้ต้องการ [3] ช่อง ช่องที่มี X ว่าง จึงเหลือพอดี 3 ช่อง เติมให้หมด!';

  @override
  String get tutorialL1Finish => 'เติมแถวสุดท้ายเองแล้วเผยภาพออกมา!';

  @override
  String get tutorialL2Groups =>
      '[2 2]: สองกลุ่มแยกกัน เติม 2 ช่อง ว่างอย่างน้อย 1 ช่อง แล้วเติมอีก 2 ช่อง 2 + 1 + 2 = 5: พอดีเป๊ะ!';

  @override
  String get tutorialL2Cross => 'ช่องตรงกลางจึงว่าง แตะสองครั้งเพื่อใส่ X';

  @override
  String get tutorialL2Drag =>
      'X เป็นแค่โน้ต ไม่เสียอะไรเลย ทีนี้ลากไปตามแถว: ช่องที่มี X จะถูกข้าม';

  @override
  String get tutorialL2CrossSelf =>
      'แถวด้านล่างก็ [2 2] ถึงตาคุณแล้ว: แตะช่องว่างสองครั้งเพื่อใส่ X ก่อน';

  @override
  String get tutorialL2DragSelf => 'ทีนี้ลากเพื่อเติมแถว';

  @override
  String get tutorialL2Mistakes =>
      'ระวัง: เติมผิดช่องจะกลายเป็น X สีแดงและเสียหัวใจหนึ่งดวง ไม่แน่ใจ? ใส่ X ก่อน!';

  @override
  String get tutorialL2Finish =>
      'ที่เหลือเป็นของคุณ! ติดอยู่หรือ? นับดูว่าเส้นนั้นยังขาดอีกกี่ช่อง';

  @override
  String get tutorialL3Overlap =>
      'คอลัมน์นี้คือ [4] มีที่ 5 ช่อง บล็อก 4 ช่องจะอยู่บนสุดหรือล่างสุด ไม่ว่าแบบไหน 3 ช่องตรงกลางถูกเติมเสมอ!';

  @override
  String get tutorialL3OverlapFill =>
      'เติมช่องที่แน่นอนเหล่านั้น เทคนิคนี้เรียกว่าการซ้อนทับ: เคล็ดลับของปริศนาใหญ่!';

  @override
  String get tutorialL3OverlapSelf => 'คอลัมน์นี้ก็ [4] หาช่องที่แน่นอนเองเลย!';

  @override
  String get tutorialL3OverlapRow =>
      'แล้ว [3] ล่ะ? จะชิดซ้ายหรือชิดขวา ช่องตรงกลางก็ถูกเติมเสมอ เติมเลย!';

  @override
  String get tutorialL3Finish =>
      'สุดยอด! เทคนิคนี้จะได้ใช้บ่อยในปริศนาใหญ่ ทีนี้เติมภาพให้เสร็จเลย!';

  @override
  String get tutorialL4Ones =>
      'สามแถวบนคือ [1 1 1]: ช่องเดี่ยวสามช่องมีช่องว่างคั่น 1 + 1 + 1 + 1 + 1 = 5: พอดีเป๊ะ!';

  @override
  String get tutorialL4CrossDrag =>
      'ดังนั้นสามช่องบนของคอลัมน์นี้ว่าง แตะสองครั้ง ค้างนิ้วไว้ตอนแตะครั้งที่สองแล้วลากลง: ได้ X สามตัวในครั้งเดียว!';

  @override
  String get tutorialL4CrossDragSelf =>
      'ถึงตาคุณ: ลากครั้งเดียวให้เป็น X บนสามช่องว่างของคอลัมน์นี้';

  @override
  String get tutorialL4Erase =>
      'ใส่ X ผิดหรือ? แตะสองครั้งอีกทีเพื่อลบ ถ้าแตะสองครั้งแล้วลากเริ่มจาก X จะลบ X ที่ผ่าน';

  @override
  String get tutorialL4Finish => 'เก่งมาก! ทีนี้เติมภาพให้เสร็จ';

  @override
  String get tutorialL5Sum =>
      'บทเรียนสุดท้าย! คอลัมน์นี้คือ [3 1]: 3 + 1 + 1 = 5 จึงแน่นอน แก้เองเลย!';

  @override
  String get tutorialL5Hint =>
      'ติดอยู่หรือ? กดคำใบ้: จะบอกขั้นต่อไปพร้อมเหตุผล';

  @override
  String get tutorialL5Finish =>
      'พร้อมแล้ว! ในตารางใหญ่ เส้นหนาจะแบ่งทุก 5 ช่องให้นับง่าย เติมภาพให้เสร็จเลย!';
}
