// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'BlockPuzzle';

  @override
  String get whoIsPlaying => '谁来玩？';

  @override
  String get newGame => '新游戏';

  @override
  String get emptySlot => '空位';

  @override
  String get yourName => '你的名字';

  @override
  String get namePlaceholder => '例如 小明';

  @override
  String get nameRequired => '请输入名字';

  @override
  String get pickColor => '选择你的颜色';

  @override
  String get start => '开始';

  @override
  String get cancel => '取消';

  @override
  String deleteSlotTitle(String name) {
    return '删除 $name？';
  }

  @override
  String get deleteSlotBody => '该玩家的所有进度都将被删除，且无法恢复。';

  @override
  String get delete => '删除';

  @override
  String levelLabel(int n) {
    return '第 $n 关';
  }

  @override
  String hintCount(int count) {
    return '$count 个提示';
  }

  @override
  String get tutorialTap => '单击：填充';

  @override
  String get tutorialDoubleTap => '双击：标记 X（再次双击 X：移除）';

  @override
  String get tutorialDrag => '按住并滑动可一次标记多个方格。双击后从 X 开始滑动可擦除 X。';

  @override
  String get hint => '提示';

  @override
  String get noHintsTitle => '提示已用完';

  @override
  String get noHintsBody => '观看一段短广告，获得 1 个提示。';

  @override
  String get watchAdForHint => '看广告：+1 提示';

  @override
  String get outOfLivesTitle => '生命已用完';

  @override
  String get outOfLivesBody => '观看广告获得 1 条生命，或重新开始本关。';

  @override
  String get watchAdForLife => '看广告：+1 生命';

  @override
  String get restart => '重新开始';

  @override
  String get backToLevels => '返回关卡';

  @override
  String get levelComplete => '太棒了！';

  @override
  String nextLevel(int n) {
    return '下一关：第 $n 关';
  }

  @override
  String get ok => '好的';

  @override
  String get allDoneSoon => '新关卡即将推出';

  @override
  String get adLabel => '广告';

  @override
  String get adPlaceholder => '这里将显示广告';

  @override
  String get adClose => '关闭';

  @override
  String adCountdown(int seconds) {
    return '$seconds 秒';
  }

  @override
  String get rulesTitle => '怎么玩？';

  @override
  String get rulesClues => '左侧和上方的数字表示该行和该列中有多少个填充方格。如果有多个数字，各组之间至少隔着一个空格。';

  @override
  String get rulesMistakes =>
      '填充了应该为空的方格会失去 1 条生命。X 标记可随意使用，用来做笔记。要填充带 X 的方格，请先双击移除 X。';

  @override
  String get rulesScoring => '每次正确填充都能得分。连续正确填充会提高倍数（最高 x5）。完成整行和整列可获得额外分数。';

  @override
  String levelScore(int score) {
    return '$score 分';
  }

  @override
  String totalScore(int total) {
    return '总分：$total';
  }

  @override
  String get rulesGoal => '找出所有填充方格，方块就会变成一幅隐藏的图画。';

  @override
  String worldLabel(int n) {
    return '地图 $n';
  }

  @override
  String get worldsTitle => '地图';

  @override
  String get worldUnlocked => '新地图已解锁！';

  @override
  String get worldComplete => '地图完成！';

  @override
  String nextWorld(String name) {
    return '下一张地图：$name';
  }

  @override
  String nextWorldLocked(String name) {
    return '完成本地图即可解锁 $name';
  }

  @override
  String nextWorldSoon(String name) {
    return '$name 即将推出';
  }

  @override
  String get worldLocked => '请先完成上一张地图';

  @override
  String get worldSoon => '即将推出';

  @override
  String get youAreHere => '你在这里';

  @override
  String get mapStart => '起点';

  @override
  String playLevel(int n) {
    return '开始 · 第 $n 关';
  }

  @override
  String get tapToContinue => '点击继续';

  @override
  String starCount(int have, int max) {
    return '$have/$max';
  }

  @override
  String get settings => '设置';

  @override
  String get settingsSound => '音效';

  @override
  String get settingsLanguage => '语言';

  @override
  String get settingsLanguageDevice => '跟随设备语言';

  @override
  String hintRow(int n) {
    return '第 $n 行';
  }

  @override
  String hintColumn(int n) {
    return '第 $n 列';
  }

  @override
  String hintFullLine(String line, String clue) {
    return '$line（$clue）：各组加上组间的一个空格正好填满整条线，所以每个方格都已确定。这个方格是填充的！';
  }

  @override
  String hintOverlap(String line, String clue) {
    return '$line（$clue）：无论把各组推到最前还是最后，这个方格总在某一组之内。所以它一定是填充的！';
  }

  @override
  String hintForcedFill(String line, String clue) {
    return '$line（$clue）：你已有的方格和 X 限制了各组能放的位置。在所有可能的摆法中，这个方格都是填充的！';
  }

  @override
  String hintForcedEmpty(String line, String clue) {
    return '$line（$clue）：没有任何一组能延伸到这个方格，所以它是空的。我们放了一个 X。';
  }

  @override
  String get hintFallback => '这个方格是图画的一部分。';

  @override
  String get tutorialSkip => '跳过';

  @override
  String get tutorialGotIt => '明白了';

  @override
  String get tutorialL1Fill => '数字表示这一行有几个填充的方块。这一行是 4，所以 4 个方块全都要填！点一下方块来填充。';

  @override
  String get tutorialL1Drag => '太棒了！现在按住手指滑动，填满这一行剩下的方块。';

  @override
  String get tutorialL1Column => '一行或一列完成后，其余方块会自动打上 X。这一列也是 4：从上往下滑。';

  @override
  String get tutorialL1Finish => '只剩一列了。自己完成这幅画吧！';

  @override
  String get tutorialL2Cross =>
      '2 1 表示先有 2 个填充方块，至少隔一个空格，再有 1 个填充方块。2 + 空格 + 1 = 4，这一行就确定了！双击空白方块，打上 X。';

  @override
  String get tutorialL2Drag => '滑动时会跳过你打了 X 的方块。沿整行滑动来填满它。';

  @override
  String get tutorialL2Rules =>
      '填错方块会扣 1 条命；打 X 是免费的。卡住时，提示按钮还会告诉你原因。剩下的就交给你了！';
}
