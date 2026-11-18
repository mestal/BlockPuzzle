// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'Pixel Bloom';

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
  String get noHintsBodyNoAds => '你已用完所有提示。';

  @override
  String get watchAdForHint => '看广告：+1 提示';

  @override
  String get outOfLivesTitle => '生命已用完';

  @override
  String get outOfLivesBody => '观看广告获得 1 条生命，或重新开始本关。';

  @override
  String get outOfLivesBodyNoAds => '重新开始本关，或返回关卡列表。';

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
  String tutorialLesson(int lesson, int count) {
    return '教程 $lesson/$count';
  }

  @override
  String get tutorialStart => '开始吧！';

  @override
  String get tutorialSkipTitle => '跳过教程？';

  @override
  String get tutorialSkipBody => '只跳过本关的教程，还是跳过全部教程？';

  @override
  String get tutorialSkipLevel => '只跳过本关';

  @override
  String get tutorialSkipAll => '全部跳过';

  @override
  String get tutorialWelcome => '你好！每个谜题里都藏着一幅画。读懂数字，填对方块，让画显现出来！';

  @override
  String get tutorialL1Fill => '[5]：这一行有 5 个填充方块。这一行正好 5 格，所以全部都要填！点一个试试。';

  @override
  String get tutorialL1Drag => '真棒！现在手指不要离开屏幕，滑动填满这一行剩下的方块。';

  @override
  String get tutorialL1Row => '这一行也是 [5]。这次一口气从头滑到尾。';

  @override
  String get tutorialL1AutoCross => '这一列的 [2] 个方块已找到，其余方块自动打上了 X。X 表示：空。';

  @override
  String get tutorialL1Column => '上方的数字属于列。这一列是 [5]：从上往下滑。';

  @override
  String get tutorialL1Count => '这一行需要 [3] 个方块。打 X 的是空格，所以正好剩下 3 格。全部填上！';

  @override
  String get tutorialL1Finish => '自己完成最后一行，让画显现出来！';

  @override
  String get tutorialL2Groups =>
      '[2 2]：两个分开的组。先填 2 格，至少空 1 格，再填 2 格。2 + 1 + 2 = 5：正好放下！';

  @override
  String get tutorialL2Cross => '所以中间那格是空的。双击它打上 X。';

  @override
  String get tutorialL2Drag => 'X 只是一个记号，不会扣任何东西。现在滑过整行：打 X 的格子会被跳过。';

  @override
  String get tutorialL2CrossSelf => '下面一行也是 [2 2]。轮到你了：先双击空格打上 X。';

  @override
  String get tutorialL2DragSelf => '现在滑动填满这一行。';

  @override
  String get tutorialL2Mistakes => '小心：填错格子会变成红色 X，并失去一颗心。没把握？先打 X！';

  @override
  String get tutorialL2Finish => '剩下的交给你！卡住了？数数一条线还差几格。';

  @override
  String get tutorialL3Overlap =>
      '这一列是 [4]，空间有 5 格。4 格的块要么在最上面，要么在最下面。无论哪种，中间 3 格都是填充的！';

  @override
  String get tutorialL3OverlapFill => '填上这些确定的方块。这个技巧叫“重叠”：大谜题的秘诀！';

  @override
  String get tutorialL3OverlapSelf => '这一列也是 [4]。自己找出确定的方块！';

  @override
  String get tutorialL3OverlapRow => '那 [3] 呢？不管靠左还是靠右，中间那格总是填充的。填上它！';

  @override
  String get tutorialL3Finish => '太棒了！这个技巧在大谜题里会经常用到。现在完成这幅画吧！';

  @override
  String get tutorialL4Ones =>
      '上面三行是 [1 1 1]：三个单独的方块，中间隔着空格。1 + 1 + 1 + 1 + 1 = 5：正好放下！';

  @override
  String get tutorialL4CrossDrag => '所以这一列最上面的三格是空的。双击，第二下按住不放并往下滑：一次画出三个 X！';

  @override
  String get tutorialL4CrossDragSelf => '轮到你了：一笔在这一列的三个空格上画 X。';

  @override
  String get tutorialL4Erase => '打错了 X？再双击一次就会消失。从 X 上双击并滑动，会擦掉经过的 X。';

  @override
  String get tutorialL4Finish => '太棒了！现在完成这幅画。';

  @override
  String get tutorialL5Sum => '最后一课！这一列是 [3 1]：3 + 1 + 1 = 5，所以是确定的。自己解开它！';

  @override
  String get tutorialL5Hint => '卡住了？点提示：它会显示下一步并解释原因。';

  @override
  String get tutorialL5Finish => '你准备好了！在大网格中，粗线每 5 格分隔一次，方便计数。完成这幅画吧！';
}
