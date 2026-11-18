// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'Pixel Bloom';

  @override
  String get whoIsPlaying => 'Siapa yang main?';

  @override
  String get newGame => 'Permainan baru';

  @override
  String get emptySlot => 'Slot kosong';

  @override
  String get yourName => 'Namamu';

  @override
  String get namePlaceholder => 'Misalnya Putri';

  @override
  String get nameRequired => 'Masukkan nama';

  @override
  String get pickColor => 'Pilih warnamu';

  @override
  String get start => 'Mulai';

  @override
  String get cancel => 'Batal';

  @override
  String deleteSlotTitle(String name) {
    return 'Hapus $name?';
  }

  @override
  String get deleteSlotBody =>
      'Semua progres pemain ini akan dihapus. Tindakan ini tidak dapat dibatalkan.';

  @override
  String get delete => 'Hapus';

  @override
  String levelLabel(int n) {
    return 'Level $n';
  }

  @override
  String hintCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count petunjuk',
    );
    return '$_temp0';
  }

  @override
  String get tutorialTap => 'Ketuk: isi';

  @override
  String get tutorialDoubleTap =>
      'Ketuk dua kali: beri X (ketuk dua kali X lagi: hapus)';

  @override
  String get tutorialDrag =>
      'Tahan dan geser untuk menandai banyak kotak sekaligus. Ketuk dua kali dan geser dari sebuah X untuk menghapus tanda X.';

  @override
  String get hint => 'Petunjuk';

  @override
  String get noHintsTitle => 'Petunjuk habis';

  @override
  String get noHintsBody => 'Tonton iklan singkat untuk mendapat 1 petunjuk.';

  @override
  String get watchAdForHint => 'Tonton iklan: +1 petunjuk';

  @override
  String get outOfLivesTitle => 'Nyawa habis';

  @override
  String get outOfLivesBody =>
      'Tonton iklan untuk mendapat 1 nyawa lagi, atau ulangi level dari awal.';

  @override
  String get watchAdForLife => 'Tonton iklan: +1 nyawa';

  @override
  String get restart => 'Ulangi dari awal';

  @override
  String get backToLevels => 'Kembali ke level';

  @override
  String get levelComplete => 'Hebat!';

  @override
  String nextLevel(int n) {
    return 'Berikutnya: Level $n';
  }

  @override
  String get ok => 'OK';

  @override
  String get allDoneSoon => 'Level baru segera hadir';

  @override
  String get adLabel => 'Iklan';

  @override
  String get adPlaceholder => 'Iklan akan ditampilkan di sini';

  @override
  String get adClose => 'Tutup';

  @override
  String adCountdown(int seconds) {
    return '$seconds dtk';
  }

  @override
  String get rulesTitle => 'Cara bermain?';

  @override
  String get rulesClues =>
      'Angka di kiri dan atas menunjukkan berapa kotak terisi di baris dan kolom itu. Jika ada beberapa angka, kelompok-kelompoknya dipisahkan setidaknya satu kotak kosong.';

  @override
  String get rulesMistakes =>
      'Mengisi kotak yang seharusnya kosong membuatmu kehilangan 1 nyawa. Tanda X gratis: buat catatan sesukamu. Untuk mengisi kotak yang ber-X, hapus dulu X-nya dengan ketuk dua kali.';

  @override
  String get rulesScoring =>
      'Setiap isian yang benar memberi poin. Isian benar berturut-turut menaikkan pengali (hingga x5). Baris dan kolom yang selesai memberi poin bonus.';

  @override
  String levelScore(int score) {
    return '$score poin';
  }

  @override
  String totalScore(int total) {
    return 'Total: $total';
  }

  @override
  String get rulesGoal =>
      'Temukan semua kotak terisi dan balok-baloknya berubah menjadi gambar tersembunyi.';

  @override
  String worldLabel(int n) {
    return 'Peta $n';
  }

  @override
  String get worldsTitle => 'Peta';

  @override
  String get worldUnlocked => 'Peta baru terbuka!';

  @override
  String get worldComplete => 'Peta selesai!';

  @override
  String nextWorld(String name) {
    return 'Peta berikutnya: $name';
  }

  @override
  String nextWorldLocked(String name) {
    return 'Selesaikan peta ini untuk membuka $name';
  }

  @override
  String nextWorldSoon(String name) {
    return '$name segera hadir';
  }

  @override
  String get worldLocked => 'Selesaikan peta sebelumnya';

  @override
  String get worldSoon => 'Segera hadir';

  @override
  String get youAreHere => 'Kamu di sini';

  @override
  String get mapStart => 'Mulai';

  @override
  String playLevel(int n) {
    return 'Main · Level $n';
  }

  @override
  String get tapToContinue => 'Ketuk untuk lanjut';

  @override
  String starCount(int have, int max) {
    return '$have/$max';
  }

  @override
  String get settings => 'Pengaturan';

  @override
  String get settingsSound => 'Efek suara';

  @override
  String get settingsLanguage => 'Bahasa';

  @override
  String get settingsLanguageDevice => 'Bahasa perangkat';

  @override
  String hintRow(int n) {
    return 'Baris $n';
  }

  @override
  String hintColumn(int n) {
    return 'Kolom $n';
  }

  @override
  String hintFullLine(String line, String clue) {
    return '$line ($clue): kelompok-kelompok ditambah satu celah di antaranya memenuhi seluruh garis, jadi setiap kotak sudah pasti. Kotak ini terisi!';
  }

  @override
  String hintOverlap(String line, String clue) {
    return '$line ($clue): dorong kelompok ke awal atau ke akhir: kotak ini selalu berada di dalam sebuah kelompok. Jadi kotak ini pasti terisi!';
  }

  @override
  String hintForcedFill(String line, String clue) {
    return '$line ($clue): kotak dan tanda X yang sudah kamu punya mempersempit tempat kelompok bisa muat. Di setiap susunan yang mungkin, kotak ini terisi!';
  }

  @override
  String hintForcedEmpty(String line, String clue) {
    return '$line ($clue): tidak ada kelompok yang bisa mencapai kotak ini, jadi kotak ini kosong. Kami beri X di sini.';
  }

  @override
  String get hintFallback => 'Kotak ini bagian dari gambar.';

  @override
  String get tutorialSkip => 'Lewati';

  @override
  String get tutorialGotIt => 'Mengerti';

  @override
  String get tutorialL1Fill =>
      'Angka menunjukkan berapa kotak di baris itu yang terisi. Baris ini bilang 5, jadi kelima kotaknya terisi! Ketuk kotak untuk mengisinya.';

  @override
  String get tutorialL1Drag =>
      'Bagus! Sekarang tahan jarimu dan geser untuk mengisi sisa baris.';

  @override
  String get tutorialL1Column =>
      'Kolom ini juga bilang 5: geser dari atas ke bawah.';

  @override
  String get tutorialL1Finish =>
      'Saat baris atau kolom selesai, kotak lainnya otomatis diberi X. Selesaikan sisa gambarnya sendiri!';

  @override
  String get tutorialL2Cross =>
      '2 2 berarti 2 kotak terisi, setidaknya satu celah, lalu 2 kotak terisi lagi. 2 + celah + 2 = 5, jadi baris ini pasti! Ketuk dua kali kotak kosong untuk memberi X.';

  @override
  String get tutorialL2Drag =>
      'Kotak dengan X-mu dilewati saat menggeser. Geser sepanjang baris untuk mengisinya.';

  @override
  String get tutorialL2Rules =>
      'Mengisi kotak yang salah membuatmu kehilangan 1 nyawa; tanda X gratis. Jika buntu, tombol Petunjuk juga menjelaskan alasannya. Selebihnya terserah kamu!';
}
