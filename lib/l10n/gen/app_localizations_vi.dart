// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'Pixel Bloom';

  @override
  String get whoIsPlaying => 'Ai đang chơi?';

  @override
  String get newGame => 'Trò chơi mới';

  @override
  String get emptySlot => 'Ô trống';

  @override
  String get yourName => 'Tên của bạn';

  @override
  String get namePlaceholder => 'Ví dụ: Lan';

  @override
  String get nameRequired => 'Hãy nhập tên';

  @override
  String get start => 'Bắt đầu';

  @override
  String get cancel => 'Hủy';

  @override
  String deleteSlotTitle(String name) {
    return 'Xóa $name?';
  }

  @override
  String get deleteSlotBody =>
      'Toàn bộ tiến trình của người chơi này sẽ bị xóa. Không thể hoàn tác.';

  @override
  String get delete => 'Xóa';

  @override
  String levelLabel(int n) {
    return 'Màn $n';
  }

  @override
  String hintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gợi ý',
    );
    return '$_temp0';
  }

  @override
  String get tutorialTap => 'Chạm: tô';

  @override
  String get tutorialDoubleTap =>
      'Chạm hai lần: đánh X (chạm hai lần vào X lần nữa: bỏ X)';

  @override
  String get tutorialDrag =>
      'Giữ và vuốt để đánh dấu nhiều ô cùng lúc. Chạm hai lần rồi vuốt từ một dấu X để xóa các dấu X.';

  @override
  String get hint => 'Gợi ý';

  @override
  String get noHintsTitle => 'Hết gợi ý';

  @override
  String get noHintsBody => 'Xem một quảng cáo ngắn để nhận 1 gợi ý.';

  @override
  String get noHintsBodyNoAds => 'Bạn đã dùng hết gợi ý.';

  @override
  String get watchAdForHint => 'Xem quảng cáo: +1 gợi ý';

  @override
  String get outOfLivesTitle => 'Hết mạng';

  @override
  String get outOfLivesBody =>
      'Xem quảng cáo để nhận thêm 1 mạng, hoặc chơi lại màn này từ đầu.';

  @override
  String get outOfLivesBodyNoAds =>
      'Chơi lại màn này từ đầu hoặc quay về danh sách màn.';

  @override
  String get watchAdForLife => 'Xem quảng cáo: +1 mạng';

  @override
  String get restart => 'Chơi lại từ đầu';

  @override
  String get backToLevels => 'Về danh sách màn';

  @override
  String get levelComplete => 'Tuyệt vời!';

  @override
  String nextLevel(int n) {
    return 'Tiếp theo: Màn $n';
  }

  @override
  String get ok => 'OK';

  @override
  String get allDoneSoon => 'Màn chơi mới sắp ra mắt';

  @override
  String get adLabel => 'Quảng cáo';

  @override
  String get adPlaceholder => 'Quảng cáo sẽ hiển thị ở đây';

  @override
  String get adClose => 'Đóng';

  @override
  String adCountdown(int seconds) {
    return '$seconds giây';
  }

  @override
  String get rulesTitle => 'Cách chơi?';

  @override
  String get rulesClues =>
      'Các số bên trái và phía trên cho biết có bao nhiêu ô được tô trong hàng và cột đó. Nếu có nhiều số, giữa các nhóm có ít nhất một ô trống.';

  @override
  String get rulesMistakes =>
      'Tô vào ô đáng lẽ phải trống sẽ mất 1 mạng. Dấu X là miễn phí: ghi chú tùy ý. Muốn tô ô có X, hãy bỏ X trước bằng cách chạm hai lần.';

  @override
  String get rulesScoring =>
      'Mỗi ô tô đúng được cộng điểm. Tô đúng liên tiếp sẽ tăng hệ số nhân (tối đa x5). Hoàn thành hàng và cột được điểm thưởng.';

  @override
  String levelScore(int score) {
    return '$score điểm';
  }

  @override
  String totalScore(int total) {
    return 'Tổng: $total';
  }

  @override
  String get rulesGoal =>
      'Tìm hết các ô được tô và các khối sẽ biến thành một bức tranh ẩn.';

  @override
  String worldLabel(int n) {
    return 'Bản đồ $n';
  }

  @override
  String get worldsTitle => 'Bản đồ';

  @override
  String get worldUnlocked => 'Đã mở bản đồ mới!';

  @override
  String get worldComplete => 'Hoàn thành bản đồ!';

  @override
  String nextWorld(String name) {
    return 'Bản đồ tiếp theo: $name';
  }

  @override
  String nextWorldLocked(String name) {
    return 'Hoàn thành bản đồ này để mở $name';
  }

  @override
  String nextWorldSoon(String name) {
    return '$name sắp ra mắt';
  }

  @override
  String get worldLocked => 'Hãy hoàn thành bản đồ trước';

  @override
  String get worldSoon => 'Sắp ra mắt';

  @override
  String get youAreHere => 'Bạn ở đây';

  @override
  String get mapStart => 'Xuất phát';

  @override
  String playLevel(int n) {
    return 'Chơi · Màn $n';
  }

  @override
  String get tapToContinue => 'Chạm để tiếp tục';

  @override
  String starCount(int have, int max) {
    return '$have/$max';
  }

  @override
  String get settings => 'Cài đặt';

  @override
  String get settingsSound => 'Hiệu ứng âm thanh';

  @override
  String get settingsLanguage => 'Ngôn ngữ';

  @override
  String get settingsLanguageDevice => 'Ngôn ngữ của thiết bị';

  @override
  String hintRow(int n) {
    return 'Hàng $n';
  }

  @override
  String hintColumn(int n) {
    return 'Cột $n';
  }

  @override
  String hintFullLine(String line, String clue, String sum, int length) {
    return '$line ($clue): $sum = $length, đúng bằng độ dài của hàng. Các nhóm cùng một ô trống giữa mỗi nhóm lấp đầy nó, mỗi ô đều có vị trí cố định. Ô này được tô!';
  }

  @override
  String hintOverlap(
    String line,
    String clue,
    int size,
    String early,
    String late,
    String common,
  ) {
    return '$line ($clue): đẩy về đầu, khối dài $size phủ các ô $early; đẩy về cuối, phủ các ô $late. Các ô $common được tô trong cả hai trường hợp, nên chắc chắn!';
  }

  @override
  String hintForcedFill(String line, String clue) {
    return '$line ($clue): các ô và dấu X bạn đã có thu hẹp chỗ các nhóm có thể nằm. Trong mọi cách sắp xếp có thể, ô này đều được tô!';
  }

  @override
  String hintForcedEmpty(String line, String clue) {
    return '$line ($clue): không nhóm nào chạm tới được ô này, nên ô này trống. Chúng tôi đánh X vào đây.';
  }

  @override
  String hintOutOfReach(String line, String clue, String reach, int cell) {
    return '$line ($clue): các nhóm chỉ chạm tới được những ô này: $reach. Ô $cell nằm ngoài tất cả, nên ô này trống!';
  }

  @override
  String hintBlockDone(String line, String clue, String cells, int size) {
    return '$line ($clue): khối bên cạnh ($cells) đã dài $size, bằng nhóm lớn nhất có thể nằm ở đây. Khối đã đủ, nên ô này trống!';
  }

  @override
  String hintTooSmall(String line, String clue, int gap, int size) {
    return '$line ($clue): ô này nằm trong một khoảng chỉ dài $gap giữa các X hoặc mép. Ngay cả nhóm nhỏ nhất chạm tới đây cũng dài $size và không vừa, nên ô này trống!';
  }

  @override
  String get hintFixedCross =>
      'X của bạn ở đây bị sai, nên chúng tôi đã xóa nó.';

  @override
  String get hintFallback => 'Ô này là một phần của bức tranh.';

  @override
  String get tutorialSkip => 'Bỏ qua';

  @override
  String get tutorialGotIt => 'Đã hiểu';

  @override
  String tutorialLesson(int lesson, int count) {
    return 'Bài $lesson/$count';
  }

  @override
  String get tutorialStart => 'Bắt đầu nào!';

  @override
  String get tutorialSkipTitle => 'Bỏ qua hướng dẫn?';

  @override
  String get tutorialSkipBody =>
      'Chỉ bỏ qua bài của màn này hay toàn bộ hướng dẫn?';

  @override
  String get tutorialSkipLevel => 'Chỉ màn này';

  @override
  String get tutorialSkipAll => 'Bỏ qua tất cả';

  @override
  String get tutorialWelcome =>
      'Chào bạn! Mỗi câu đố đều giấu một bức tranh. Đọc các số, tô đúng ô và làm nó hiện ra nhé!';

  @override
  String get tutorialL1Fill =>
      '[5]: hàng này có 5 ô được tô. Hàng dài đúng 5 ô, nên tô hết! Chạm vào một ô.';

  @override
  String get tutorialL1Drag =>
      'Tuyệt! Giờ vuốt mà không nhấc ngón tay để tô phần còn lại của hàng.';

  @override
  String get tutorialL1Row =>
      'Hàng này cũng là [5]. Lần này hãy vuốt một mạch từ đầu đến cuối.';

  @override
  String get tutorialL1AutoCross =>
      'Đã tìm thấy [2] ô của cột này, nên các ô còn lại tự được đánh X. X nghĩa là: trống.';

  @override
  String get tutorialL1Column =>
      'Các số ở trên là của cột. Cột này là [5]: vuốt từ trên xuống dưới.';

  @override
  String get tutorialL1Count =>
      'Hàng này cần [3] ô. Các ô X là trống, nên còn đúng 3 ô. Tô hết nhé!';

  @override
  String get tutorialL1Finish =>
      'Tự tô hàng cuối cùng và làm bức tranh hiện ra nhé!';

  @override
  String get tutorialL2Groups =>
      '[2 2]: hai nhóm riêng. 2 ô tô, ít nhất 1 ô trống, rồi 2 ô tô. 2 + 1 + 2 = 5: vừa khít!';

  @override
  String get tutorialL2Cross =>
      'Vậy ô ở giữa là trống. Chạm hai lần vào nó để đánh X.';

  @override
  String get tutorialL2Drag =>
      'X chỉ là ghi chú, không mất gì cả. Giờ vuốt qua hàng: ô có X sẽ được bỏ qua.';

  @override
  String get tutorialL2CrossSelf =>
      'Hàng bên dưới cũng là [2 2]. Đến lượt bạn: chạm hai lần vào ô trống trước để đánh X.';

  @override
  String get tutorialL2DragSelf => 'Giờ vuốt để tô hàng.';

  @override
  String get tutorialL2Mistakes =>
      'Cẩn thận: tô sai ô sẽ biến nó thành X đỏ và mất một trái tim. Chưa chắc? Đánh X trước!';

  @override
  String get tutorialL2Finish =>
      'Phần còn lại là của bạn! Bí à? Đếm xem một đường còn thiếu bao nhiêu ô.';

  @override
  String get tutorialL3Overlap =>
      'Cột này là [4], chỗ có 5 ô. Khối 4 ô hoặc nằm trên cùng, hoặc nằm dưới cùng. Dù thế nào, 3 ô giữa đều được tô!';

  @override
  String get tutorialL3OverlapFill =>
      'Tô các ô chắc chắn đó. Mẹo này gọi là chồng lấp: bí quyết của các câu đố lớn!';

  @override
  String get tutorialL3OverlapSelf =>
      'Cột này cũng là [4]. Tự tìm các ô chắc chắn nhé!';

  @override
  String get tutorialL3OverlapRow =>
      'Còn [3] thì sao? Đẩy sang trái hay phải, ô giữa luôn được tô. Tô nó đi!';

  @override
  String get tutorialL3Finish =>
      'Tuyệt vời! Bạn sẽ dùng mẹo này nhiều ở các câu đố lớn. Giờ hoàn thành bức tranh nhé!';

  @override
  String get tutorialL4Ones =>
      'Ba hàng trên cùng là [1 1 1]: ba ô lẻ, xen giữa là ô trống. 1 + 1 + 1 + 1 + 1 = 5: vừa khít!';

  @override
  String get tutorialL4CrossDrag =>
      'Vậy ba ô trên cùng của cột này trống. Chạm hai lần, giữ ngón tay ở lần chạm thứ hai rồi vuốt xuống: ba dấu X một lúc!';

  @override
  String get tutorialL4CrossDragSelf =>
      'Đến lượt bạn: vuốt một lần để vẽ X lên ba ô trống của cột này.';

  @override
  String get tutorialL4Erase =>
      'Đánh X nhầm? Chạm hai lần lần nữa để xóa. Vuốt bằng chạm hai lần bắt đầu từ một X sẽ xóa các X trên đường đi.';

  @override
  String get tutorialL4Finish => 'Giỏi lắm! Giờ hoàn thành bức tranh nhé.';

  @override
  String get tutorialL5Gaps =>
      'Bài cuối: giải bằng dấu X! Bốn cột ngoài cùng là [2 2]: 2 + 1 + 2 = 5. Chỗ trống của chúng đều nằm ở hàng giữa.';

  @override
  String get tutorialL5CrossDrag =>
      'Đánh dấu các ô trống này: chạm hai lần, giữ ngón tay ở lần chạm thứ hai rồi vuốt sang ngang: hai dấu X một lúc!';

  @override
  String get tutorialL5CrossDragSelf =>
      'Đến lượt bạn: vuốt một lần để vẽ X lên hai ô trống bên phải.';

  @override
  String get tutorialL5Count =>
      'Hàng này là [1], và sau các dấu X chỉ còn một ô. Dấu X giúp đếm dễ hơn: tô ô đó!';

  @override
  String get tutorialL5Hint =>
      'Bí à? Nhấn Gợi ý: nó chỉ bước tiếp theo và giải thích lý do.';

  @override
  String get tutorialL5Finish =>
      'Bạn đã sẵn sàng! Ở lưới lớn, các đường đậm chia mỗi 5 ô để dễ đếm. Hoàn thành bức tranh nhé!';
}
