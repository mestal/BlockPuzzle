// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malay (`ms`).
class AppLocalizationsMs extends AppLocalizations {
  AppLocalizationsMs([String locale = 'ms']) : super(locale);

  @override
  String get appTitle => 'Pixel Bloom';

  @override
  String get whoIsPlaying => 'Siapa yang bermain?';

  @override
  String get newGame => 'Permainan baharu';

  @override
  String get emptySlot => 'Slot kosong';

  @override
  String get yourName => 'Nama anda';

  @override
  String get namePlaceholder => 'Contohnya Aisyah';

  @override
  String get nameRequired => 'Masukkan nama';

  @override
  String get pickColor => 'Pilih warna anda';

  @override
  String get start => 'Mula';

  @override
  String get cancel => 'Batal';

  @override
  String deleteSlotTitle(String name) {
    return 'Padam $name?';
  }

  @override
  String get deleteSlotBody =>
      'Semua kemajuan pemain ini akan dipadam. Tindakan ini tidak boleh dibatalkan.';

  @override
  String get delete => 'Padam';

  @override
  String levelLabel(int n) {
    return 'Tahap $n';
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
  String get tutorialTap => 'Ketik: isi';

  @override
  String get tutorialDoubleTap =>
      'Ketik dua kali: letak X (ketik dua kali pada X sekali lagi: buang)';

  @override
  String get tutorialDrag =>
      'Tekan dan leret untuk menanda banyak petak sekali gus. Ketik dua kali dan leret dari X untuk memadam tanda X.';

  @override
  String get hint => 'Petunjuk';

  @override
  String get noHintsTitle => 'Petunjuk sudah habis';

  @override
  String get noHintsBody => 'Tonton iklan pendek untuk mendapat 1 petunjuk.';

  @override
  String get watchAdForHint => 'Tonton iklan: +1 petunjuk';

  @override
  String get outOfLivesTitle => 'Nyawa sudah habis';

  @override
  String get outOfLivesBody =>
      'Tonton iklan untuk mendapat 1 nyawa lagi, atau mulakan semula tahap ini.';

  @override
  String get watchAdForLife => 'Tonton iklan: +1 nyawa';

  @override
  String get restart => 'Mula semula';

  @override
  String get backToLevels => 'Kembali ke tahap';

  @override
  String get levelComplete => 'Hebat!';

  @override
  String nextLevel(int n) {
    return 'Seterusnya: Tahap $n';
  }

  @override
  String get ok => 'OK';

  @override
  String get allDoneSoon => 'Tahap baharu akan datang';

  @override
  String get adLabel => 'Iklan';

  @override
  String get adPlaceholder => 'Iklan akan dipaparkan di sini';

  @override
  String get adClose => 'Tutup';

  @override
  String adCountdown(int seconds) {
    return '$seconds s';
  }

  @override
  String get rulesTitle => 'Cara bermain?';

  @override
  String get rulesClues =>
      'Nombor di kiri dan atas menunjukkan berapa petak berisi dalam baris dan lajur itu. Jika ada beberapa nombor, kumpulan-kumpulan itu dipisahkan oleh sekurang-kurangnya satu petak kosong.';

  @override
  String get rulesMistakes =>
      'Mengisi petak yang sepatutnya kosong menyebabkan anda kehilangan 1 nyawa. Tanda X adalah percuma: buat catatan sesuka hati. Untuk mengisi petak yang ada X, buang X dahulu dengan ketik dua kali.';

  @override
  String get rulesScoring =>
      'Setiap isian yang betul memberi mata. Isian betul berturut-turut menaikkan pengganda (hingga x5). Baris dan lajur yang siap memberi mata bonus.';

  @override
  String levelScore(int score) {
    return '$score mata';
  }

  @override
  String totalScore(int total) {
    return 'Jumlah: $total';
  }

  @override
  String get rulesGoal =>
      'Cari semua petak berisi dan blok-blok akan bertukar menjadi gambar tersembunyi.';

  @override
  String worldLabel(int n) {
    return 'Peta $n';
  }

  @override
  String get worldsTitle => 'Peta';

  @override
  String get worldUnlocked => 'Peta baharu dibuka!';

  @override
  String get worldComplete => 'Peta selesai!';

  @override
  String nextWorld(String name) {
    return 'Peta seterusnya: $name';
  }

  @override
  String nextWorldLocked(String name) {
    return 'Selesaikan peta ini untuk membuka $name';
  }

  @override
  String nextWorldSoon(String name) {
    return '$name akan datang';
  }

  @override
  String get worldLocked => 'Selesaikan peta sebelumnya';

  @override
  String get worldSoon => 'Akan datang';

  @override
  String get youAreHere => 'Anda di sini';

  @override
  String get mapStart => 'Mula';

  @override
  String playLevel(int n) {
    return 'Main · Tahap $n';
  }

  @override
  String get tapToContinue => 'Ketik untuk teruskan';

  @override
  String starCount(int have, int max) {
    return '$have/$max';
  }

  @override
  String get settings => 'Tetapan';

  @override
  String get settingsSound => 'Kesan bunyi';

  @override
  String get settingsLanguage => 'Bahasa';

  @override
  String get settingsLanguageDevice => 'Bahasa peranti';

  @override
  String hintRow(int n) {
    return 'Baris $n';
  }

  @override
  String hintColumn(int n) {
    return 'Lajur $n';
  }

  @override
  String hintFullLine(String line, String clue) {
    return '$line ($clue): kumpulan-kumpulan dengan satu ruang di antaranya memenuhi seluruh garisan, jadi setiap petak sudah pasti. Petak ini berisi!';
  }

  @override
  String hintOverlap(String line, String clue) {
    return '$line ($clue): tolak kumpulan ke awal atau ke hujung: petak ini sentiasa berada dalam satu kumpulan. Jadi ia mesti berisi!';
  }

  @override
  String hintForcedFill(String line, String clue) {
    return '$line ($clue): petak dan tanda X yang sudah ada menyempitkan tempat kumpulan boleh muat. Dalam setiap susunan yang mungkin, petak ini berisi!';
  }

  @override
  String hintForcedEmpty(String line, String clue) {
    return '$line ($clue): tiada kumpulan yang boleh sampai ke petak ini, jadi ia kosong. Kami letakkan X di sini.';
  }

  @override
  String get hintFallback => 'Petak ini sebahagian daripada gambar.';

  @override
  String get tutorialSkip => 'Langkau';

  @override
  String get tutorialGotIt => 'Faham';

  @override
  String get tutorialL1Fill =>
      'Nombor menunjukkan berapa petak dalam baris itu yang berisi. Baris ini kata 5, jadi kesemua 5 petak berisi! Ketik petak untuk mengisinya.';

  @override
  String get tutorialL1Drag =>
      'Bagus! Sekarang tekan jari anda dan leret untuk mengisi baki baris.';

  @override
  String get tutorialL1Column =>
      'Lajur ini juga kata 5: leret dari atas ke bawah.';

  @override
  String get tutorialL1Finish =>
      'Apabila baris atau lajur siap, petak lain di dalamnya mendapat X dengan sendiri. Siapkan baki gambar sendiri!';

  @override
  String get tutorialL2Cross =>
      '2 2 bermaksud 2 petak berisi, sekurang-kurangnya satu ruang, kemudian 2 petak berisi lagi. 2 + ruang + 2 = 5, jadi baris ini pasti! Ketik dua kali pada petak kosong untuk meletakkan X.';

  @override
  String get tutorialL2Drag =>
      'Petak dengan X anda dilangkau semasa meleret. Leret sepanjang baris untuk mengisinya.';

  @override
  String get tutorialL2Rules =>
      'Mengisi petak yang salah menyebabkan anda kehilangan 1 nyawa; tanda X percuma. Jika tersekat, butang Petunjuk juga menerangkan sebabnya. Selebihnya terpulang kepada anda!';
}
