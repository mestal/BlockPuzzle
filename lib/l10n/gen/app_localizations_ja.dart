// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'BlockPuzzle';

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
  String get pickColor => '色を選んでね';

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
  String get watchAdForHint => '広告を見る：ヒント +1';

  @override
  String get outOfLivesTitle => 'ライフがなくなった';

  @override
  String get outOfLivesBody => '広告を見てライフを 1 つもらうか、レベルを最初からやり直そう。';

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
  String get tutorialL1Fill =>
      '数字はその行で塗られるマスの数です。この行は 4 なので、4 マスすべて塗ります！マスをタップして塗りましょう。';

  @override
  String get tutorialL1Drag => 'すごい！次は指を押したままスライドして、行の残りを塗りましょう。';

  @override
  String get tutorialL1Column =>
      '行や列が完成すると、残りのマスには自動で X が付きます。この列も 4 です。上から下へスライドしましょう。';

  @override
  String get tutorialL1Finish => 'あと 1 列です。自分で絵を完成させよう！';

  @override
  String get tutorialL2Cross =>
      '2 1 は、2 マス塗り、1 マス以上あけて、1 マス塗るという意味です。2 + すき間 + 1 = 4 なので、この行は確定！空くマスをダブルタップして X を付けよう。';

  @override
  String get tutorialL2Drag => 'X を付けたマスはスライドしても飛ばされます。行全体をスライドして塗りましょう。';

  @override
  String get tutorialL2Rules =>
      'まちがったマスを塗るとライフが 1 減ります。X はいくつ付けても OK。困ったらヒントボタンが理由も教えてくれます。あとは任せた！';
}
