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
  String get noHintsBodyNoAds => 'Anda telah menggunakan semua petunjuk.';

  @override
  String get watchAdForHint => 'Tonton iklan: +1 petunjuk';

  @override
  String get outOfLivesTitle => 'Nyawa sudah habis';

  @override
  String get outOfLivesBody =>
      'Tonton iklan untuk mendapat 1 nyawa lagi, atau mulakan semula tahap ini.';

  @override
  String get outOfLivesBodyNoAds =>
      'Mulakan semula tahap ini atau kembali ke senarai tahap.';

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
  String tutorialLesson(int lesson, int count) {
    return 'Pelajaran $lesson/$count';
  }

  @override
  String get tutorialStart => 'Jom mula!';

  @override
  String get tutorialSkipTitle => 'Langkau tutorial?';

  @override
  String get tutorialSkipBody =>
      'Langkau pelajaran tahap ini sahaja, atau seluruh tutorial?';

  @override
  String get tutorialSkipLevel => 'Tahap ini sahaja';

  @override
  String get tutorialSkipAll => 'Langkau semua';

  @override
  String get tutorialWelcome =>
      'Hai! Setiap teka-teki menyembunyikan gambar. Baca nombor, isi petak yang betul dan dedahkannya!';

  @override
  String get tutorialL1Fill =>
      '[5]: baris ini ada 5 petak berisi. Baris ini 5 petak panjang, jadi semuanya berisi! Ketik satu.';

  @override
  String get tutorialL1Drag =>
      'Hebat! Sekarang leret tanpa mengangkat jari untuk mengisi baki baris.';

  @override
  String get tutorialL1Row =>
      'Baris ini juga [5]. Kali ini leret dari hujung ke hujung sekali gus.';

  @override
  String get tutorialL1AutoCross =>
      'Kedua-dua petak [2] lajur ini sudah ditemui, jadi yang lain dapat X dengan sendiri. X bermaksud: kosong.';

  @override
  String get tutorialL1Column =>
      'Nombor di atas untuk lajur. Lajur ini [5]: leret dari atas ke bawah.';

  @override
  String get tutorialL1Count =>
      'Baris ini perlukan [3] petak. Petak X kosong, jadi tinggal tepat 3 petak. Isi semuanya!';

  @override
  String get tutorialL1Finish =>
      'Siapkan baris terakhir sendiri dan dedahkan gambarnya!';

  @override
  String get tutorialL2Groups =>
      '[2 2]: dua kumpulan berasingan. 2 berisi, sekurang-kurangnya 1 kosong, kemudian 2 berisi. 2 + 1 + 2 = 5: muat tepat!';

  @override
  String get tutorialL2Cross =>
      'Jadi petak tengah kosong. Ketik dua kali padanya untuk meletakkan X.';

  @override
  String get tutorialL2Drag =>
      'X hanya nota dan tidak menelan kos. Sekarang leret sepanjang baris: petak X dilangkau.';

  @override
  String get tutorialL2CrossSelf =>
      'Baris di bawah juga [2 2]. Giliran anda: letakkan X pada petak kosong dahulu.';

  @override
  String get tutorialL2DragSelf => 'Sekarang leret untuk mengisi baris.';

  @override
  String get tutorialL2Mistakes =>
      'Awas: mengisi petak yang salah menjadikannya X merah dan anda hilang satu hati. Tak pasti? Letakkan X dahulu!';

  @override
  String get tutorialL2Finish =>
      'Selebihnya milik anda! Buntu? Kira berapa petak lagi yang diperlukan sesuatu garisan.';

  @override
  String get tutorialL3Overlap =>
      'Lajur ini [4], dengan ruang untuk 5. Blok 4 itu sama ada paling atas atau paling bawah. Walau apa pun, 3 petak tengah berisi!';

  @override
  String get tutorialL3OverlapFill =>
      'Isi petak pasti itu. Helah ini dipanggil pertindihan: rahsia teka-teki besar!';

  @override
  String get tutorialL3OverlapSelf =>
      'Lajur ini juga [4]. Cari sendiri petak yang pasti!';

  @override
  String get tutorialL3OverlapRow =>
      'Bagaimana dengan [3]? Ditolak ke kiri atau ke kanan, petak tengah sentiasa berisi. Isikannya!';

  @override
  String get tutorialL3Finish =>
      'Hebat! Anda akan kerap guna helah ini dalam teka-teki besar. Sekarang siapkan gambar!';

  @override
  String get tutorialL4Ones =>
      'Dua baris atas ialah [1 1 1]: tiga petak tunggal dengan jarak di antaranya. 1 + 1 + 1 + 1 + 1 = 5: muat tepat!';

  @override
  String get tutorialL4CrossDrag =>
      'Dua petak ini kosong. Ketik dua kali, tahan jari pada ketikan kedua dan leret ke bawah: garisan X!';

  @override
  String get tutorialL4CrossDragSelf =>
      'Giliran anda: lukis X pada dua petak kosong dalam lajur ini.';

  @override
  String get tutorialL4Erase =>
      'Tersalah X? Ketik dua kali padanya lagi untuk membuangnya. Leretan ketik dua kali yang bermula pada X memadam X di laluannya.';

  @override
  String get tutorialL4Finish => 'Bagus! Sekarang lengkapkan gambar.';

  @override
  String get tutorialL5Sum =>
      'Pelajaran terakhir! Lajur ini [3 1]: 3 + 1 + 1 = 5, jadi ia pasti. Selesaikannya sendiri!';

  @override
  String get tutorialL5Hint =>
      'Buntu? Tekan Petunjuk: ia tunjukkan langkah seterusnya dan sebabnya.';

  @override
  String get tutorialL5Finish =>
      'Anda sudah sedia! Pada grid besar, garisan tebal memisahkan setiap 5 petak supaya mudah dikira. Siapkan gambar!';
}
