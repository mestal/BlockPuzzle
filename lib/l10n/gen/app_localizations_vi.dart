// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'BlockPuzzle';

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
  String get pickColor => 'Chọn màu của bạn';

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
  String get watchAdForHint => 'Xem quảng cáo: +1 gợi ý';

  @override
  String get outOfLivesTitle => 'Hết mạng';

  @override
  String get outOfLivesBody =>
      'Xem quảng cáo để nhận thêm 1 mạng, hoặc chơi lại màn này từ đầu.';

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
  String hintFullLine(String line, String clue) {
    return '$line ($clue): các nhóm cộng với một khoảng trống giữa mỗi nhóm lấp đầy cả dòng, nên mọi ô đều đã xác định. Ô này được tô!';
  }

  @override
  String hintOverlap(String line, String clue) {
    return '$line ($clue): dồn các nhóm về đầu hay về cuối thì ô này vẫn luôn nằm trong một nhóm. Vậy ô này phải được tô!';
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
  String get hintFallback => 'Ô này là một phần của bức tranh.';

  @override
  String get tutorialSkip => 'Bỏ qua';

  @override
  String get tutorialGotIt => 'Đã hiểu';

  @override
  String get tutorialL1Fill =>
      'Các số cho biết có bao nhiêu ô trong hàng đó được tô. Hàng này ghi 5, vậy cả 5 ô đều được tô! Chạm vào một ô để tô nó.';

  @override
  String get tutorialL1Drag =>
      'Tuyệt! Giờ hãy giữ ngón tay và vuốt để tô phần còn lại của hàng.';

  @override
  String get tutorialL1Column => 'Cột này cũng ghi 5: vuốt từ trên xuống dưới.';

  @override
  String get tutorialL1Finish =>
      'Khi một hàng hay cột hoàn thành, các ô còn lại tự động được đánh X. Hãy tự hoàn thành phần còn lại của bức tranh!';

  @override
  String get tutorialL2Cross =>
      '2 2 nghĩa là 2 ô được tô, ít nhất một khoảng trống, rồi thêm 2 ô được tô. 2 + khoảng trống + 2 = 5, nên hàng này đã chắc chắn! Chạm hai lần vào ô trống để đánh X.';

  @override
  String get tutorialL2Drag =>
      'Các ô có X của bạn sẽ được bỏ qua khi vuốt. Vuốt dọc cả hàng để tô nó.';

  @override
  String get tutorialL2Rules =>
      'Tô sai ô sẽ mất 1 mạng; dấu X là miễn phí. Nếu bí, nút Gợi ý cũng giải thích lý do. Phần còn lại là của bạn!';
}
