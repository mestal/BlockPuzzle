// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'Pixel Bloom';

  @override
  String get whoIsPlaying => 'だれが遊ぶ？';

  @override
  String get newGame => '新しいゲーム';

  @override
  String get emptySlot => '空きスロット';

  @override
  String get yourName => '名前';

  @override
  String get namePlaceholder => '例：ハルト';

  @override
  String get nameRequired => '名前を入力してね';

  @override
  String get start => 'スタート';

  @override
  String get cancel => 'キャンセル';

  @override
  String deleteSlotTitle(String name) {
    return '$name を削除しますか？';
  }

  @override
  String get deleteSlotBody => 'このプレイヤーの進行状況はすべて削除されます。元に戻せません。';

  @override
  String get delete => '削除';

  @override
  String levelLabel(int n) {
    return 'レベル $n';
  }

  @override
  String hintCount(int count) {
    return 'ヒント $count 個';
  }

  @override
  String get tutorialTap => 'タップ：塗る';

  @override
  String get tutorialDoubleTap => 'ダブルタップ：X を付ける（X をもう一度ダブルタップ：消す）';

  @override
  String get tutorialDrag =>
      '押したままスライドすると、たくさんのマスにまとめて印を付けられます。X からダブルタップでスライドすると X を消せます。';

  @override
  String get hint => 'ヒント';

  @override
  String get noHintsTitle => 'ヒントがありません';

  @override
  String get noHintsBody => '短い広告を見てヒントを 1 個もらおう。';

  @override
  String get noHintsBodyNoAds => 'ヒントをすべて使い切りました。';

  @override
  String get watchAdForHint => '広告を見る：ヒント +1';

  @override
  String get outOfLivesTitle => 'ライフがなくなった';

  @override
  String get outOfLivesBody => '広告を見てライフを 1 つもらうか、レベルを最初からやり直そう。';

  @override
  String get outOfLivesBodyNoAds => 'ステージを最初からやり直すか、ステージ一覧に戻りましょう。';

  @override
  String get watchAdForLife => '広告を見る：ライフ +1';

  @override
  String get restart => 'やり直す';

  @override
  String get backToLevels => 'レベル一覧へ';

  @override
  String get levelComplete => 'やったね！';

  @override
  String nextLevel(int n) {
    return '次：レベル $n';
  }

  @override
  String get ok => 'OK';

  @override
  String get allDoneSoon => '新しいレベルは近日公開';

  @override
  String get adLabel => '広告';

  @override
  String get adPlaceholder => 'ここに広告が表示されます';

  @override
  String get adClose => '閉じる';

  @override
  String adCountdown(int seconds) {
    return '$seconds 秒';
  }

  @override
  String get rulesTitle => '遊び方';

  @override
  String get rulesClues =>
      '左と上の数字は、その行と列で塗られるマスの数です。数字がいくつかあるときは、グループの間に 1 マス以上のすき間があります。';

  @override
  String get rulesMistakes =>
      '空のはずのマスを塗るとライフが 1 減ります。X は自由に付けられるメモです。X のマスを塗るには、まずダブルタップで X を消してね。';

  @override
  String get rulesScoring =>
      '正しく塗るたびにポイント。ミスなく続けて塗ると倍率が上がります（最大 x5）。行や列を完成させるとボーナス！';

  @override
  String levelScore(int score) {
    return '$score ポイント';
  }

  @override
  String totalScore(int total) {
    return '合計：$total';
  }

  @override
  String get rulesGoal => '塗るマスをすべて見つけると、ブロックが隠れた絵に変わります。';

  @override
  String worldLabel(int n) {
    return 'マップ $n';
  }

  @override
  String get worldsTitle => 'マップ';

  @override
  String get worldUnlocked => '新しいマップが開いた！';

  @override
  String get worldComplete => 'マップクリア！';

  @override
  String nextWorld(String name) {
    return '次のマップ：$name';
  }

  @override
  String nextWorldLocked(String name) {
    return 'このマップをクリアすると $name が開きます';
  }

  @override
  String nextWorldSoon(String name) {
    return '$name は近日公開';
  }

  @override
  String get worldLocked => '前のマップをクリアしよう';

  @override
  String get worldSoon => '近日公開';

  @override
  String get youAreHere => '現在地';

  @override
  String get mapStart => 'スタート';

  @override
  String playLevel(int n) {
    return 'プレイ · レベル $n';
  }

  @override
  String get tapToContinue => 'タップして続ける';

  @override
  String starCount(int have, int max) {
    return '$have/$max';
  }

  @override
  String get settings => '設定';

  @override
  String get settingsSound => '効果音';

  @override
  String get settingsLanguage => '言語';

  @override
  String get settingsLanguageDevice => '端末の言語';

  @override
  String hintRow(int n) {
    return '$n 行目';
  }

  @override
  String hintColumn(int n) {
    return '$n 列目';
  }

  @override
  String hintFullLine(String line, String clue) {
    return '$line（$clue）：グループとその間のすき間で列がぴったり埋まるので、すべてのマスが決まります。このマスは塗り！';
  }

  @override
  String hintOverlap(String line, String clue) {
    return '$line（$clue）：グループを先頭に寄せても最後に寄せても、このマスは必ずグループの中。だから塗り！';
  }

  @override
  String hintForcedFill(String line, String clue) {
    return '$line（$clue）：今あるマスと X で、グループが入れる場所がしぼられます。どの置き方でもこのマスは塗り！';
  }

  @override
  String hintForcedEmpty(String line, String clue) {
    return '$line（$clue）：どのグループもこのマスに届かないので空です。X を付けました。';
  }

  @override
  String get hintFallback => 'このマスは絵の一部です。';

  @override
  String get tutorialSkip => 'スキップ';

  @override
  String get tutorialGotIt => 'わかった';

  @override
  String tutorialLesson(int lesson, int count) {
    return 'レッスン $lesson/$count';
  }

  @override
  String get tutorialStart => 'はじめよう！';

  @override
  String get tutorialSkipTitle => 'チュートリアルをスキップ？';

  @override
  String get tutorialSkipBody => 'このレベルのレッスンだけスキップする？それともチュートリアル全部？';

  @override
  String get tutorialSkipLevel => 'このレベルだけ';

  @override
  String get tutorialSkipAll => '全部スキップ';

  @override
  String get tutorialWelcome => 'こんにちは！どのパズルにも絵が隠れているよ。数字を読んで正しいマスを塗り、絵を見つけよう！';

  @override
  String get tutorialL1Fill =>
      '[5]：この行には塗るマスが 5 つ。行も 5 マスだから、全部塗るよ！どれか 1 マスをタップしよう。';

  @override
  String get tutorialL1Drag => 'いいね！今度は指を離さずにスライドして、行の残りを塗ろう。';

  @override
  String get tutorialL1Row => 'この行も [5]。今度は端から端まで一気にスライドしよう。';

  @override
  String get tutorialL1AutoCross =>
      'この列の [2] マスが見つかったので、残りには自動で X が付いたよ。X は「空き」の印。';

  @override
  String get tutorialL1Column => '上の数字は列のヒント。この列は [5]：上から下へスライドしよう。';

  @override
  String get tutorialL1Count =>
      'この行には [3] マス必要。X のマスは空きだから、残りはちょうど 3 マス。全部塗ろう！';

  @override
  String get tutorialL1Finish => '最後の行は自分で塗って、絵を完成させよう！';

  @override
  String get tutorialL2Groups =>
      '[2 2]：2 つの別々のかたまり。2 マス塗り、1 マス以上あけて、また 2 マス。2 + 1 + 2 = 5：ぴったり！';

  @override
  String get tutorialL2Cross => 'つまり真ん中のマスは空き。ダブルタップして X を付けよう。';

  @override
  String get tutorialL2Drag => 'X はただのメモで、何も減らないよ。行をスライドしよう：X のマスは飛ばされるよ。';

  @override
  String get tutorialL2CrossSelf => '下の行も [2 2]。きみの番：まず空きマスをダブルタップして X を付けよう。';

  @override
  String get tutorialL2DragSelf => '今度はスライドして行を塗ろう。';

  @override
  String get tutorialL2Mistakes =>
      '注意：まちがったマスを塗ると赤い X になって、ハートが 1 つ減るよ。迷ったら先に X！';

  @override
  String get tutorialL2Finish => 'あとはきみの番！困ったら、その線にあと何マス必要か数えてみよう。';

  @override
  String get tutorialL3Overlap =>
      'この列は [4] で、場所は 5 マス。4 マスのかたまりは一番上か一番下。どちらでも真ん中の 3 マスは塗られる！';

  @override
  String get tutorialL3OverlapFill => 'この確定マスを塗ろう。この技は「重なり」：大きなパズルの秘密だよ！';

  @override
  String get tutorialL3OverlapSelf => 'この列も [4]。確定マスを自分で見つけよう！';

  @override
  String get tutorialL3OverlapRow =>
      'じゃあ [3] は？左に寄せても右に寄せても、真ん中のマスはいつも塗られる。塗ろう！';

  @override
  String get tutorialL3Finish => 'すごい！この技は大きなパズルでよく使うよ。さあ、絵を完成させよう！';

  @override
  String get tutorialL4Ones =>
      '上の 3 行は [1 1 1]：すき間をあけて 1 マスずつ 3 つ。1 + 1 + 1 + 1 + 1 = 5：ぴったり！';

  @override
  String get tutorialL4CrossDrag =>
      'だからこの列の上の 3 マスは空き。ダブルタップして、2 回目で指を離さず下へスライド：X が 3 つ一気に引けるよ！';

  @override
  String get tutorialL4CrossDragSelf => 'きみの番：この列の空きマス 3 つに、ひとなぞりで X を引こう。';

  @override
  String get tutorialL4Erase =>
      'X をまちがえた？もう一度ダブルタップすると消えるよ。X からダブルタップでスライドすると、通った X が消えるよ。';

  @override
  String get tutorialL4Finish => 'ばっちり！絵を完成させよう。';

  @override
  String get tutorialL5Gaps =>
      '最後のレッスン：X で解こう！外側の 4 列は [2 2]：2 + 1 + 2 = 5。どの列も空きマスはまん中の行にあるよ。';

  @override
  String get tutorialL5CrossDrag =>
      'この空きマスに X をつけよう：ダブルタップして、2 回目で指を離さず横へスライド：X が 2 つ一気に引けるよ！';

  @override
  String get tutorialL5CrossDragSelf => 'きみの番：右側の空きマス 2 つに、ひとなぞりで X を引こう。';

  @override
  String get tutorialL5Count => 'この行は [1]。X のおかげで残りは 1 マスだけ。X があると数えやすいね：塗ろう！';

  @override
  String get tutorialL5Hint => '困ったらヒントを押そう：次の一手と、その理由を教えてくれるよ。';

  @override
  String get tutorialL5Finish =>
      'もう準備ばっちり！大きな盤面では太い線が 5 マスごとに区切るから数えやすいよ。絵を完成させよう！';
}
