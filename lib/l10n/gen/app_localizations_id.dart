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
  String get noHintsBodyNoAds => 'Kamu sudah memakai semua petunjuk.';

  @override
  String get watchAdForHint => 'Tonton iklan: +1 petunjuk';

  @override
  String get outOfLivesTitle => 'Nyawa habis';

  @override
  String get outOfLivesBody =>
      'Tonton iklan untuk mendapat 1 nyawa lagi, atau ulangi level dari awal.';

  @override
  String get outOfLivesBodyNoAds =>
      'Ulangi level dari awal, atau kembali ke daftar level.';

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
  String tutorialLesson(int lesson, int count) {
    return 'Pelajaran $lesson/$count';
  }

  @override
  String get tutorialStart => 'Ayo mulai!';

  @override
  String get tutorialSkipTitle => 'Lewati tutorial?';

  @override
  String get tutorialSkipBody =>
      'Lewati pelajaran level ini saja, atau seluruh tutorial?';

  @override
  String get tutorialSkipLevel => 'Level ini saja';

  @override
  String get tutorialSkipAll => 'Lewati semua';

  @override
  String get tutorialWelcome =>
      'Hai! Setiap teka-teki menyembunyikan gambar. Baca angkanya, isi kotak yang benar, dan ungkap gambarnya!';

  @override
  String get tutorialL1Fill =>
      '[5]: baris ini punya 5 kotak terisi. Barisnya 5 kotak, jadi semuanya terisi! Ketuk salah satu.';

  @override
  String get tutorialL1Drag =>
      'Mantap! Sekarang geser tanpa mengangkat jari untuk mengisi sisa baris.';

  @override
  String get tutorialL1Row =>
      'Baris ini juga [5]. Kali ini geser dari ujung ke ujung sekaligus.';

  @override
  String get tutorialL1AutoCross =>
      'Kedua kotak [2] kolom ini sudah ketemu, jadi sisanya otomatis diberi X. X artinya: kosong.';

  @override
  String get tutorialL1Column =>
      'Angka di atas untuk kolom. Kolom ini [5]: geser dari atas ke bawah.';

  @override
  String get tutorialL1Count =>
      'Baris ini butuh [3] kotak. Kotak ber-X kosong, jadi tersisa tepat 3 kotak. Isi semuanya!';

  @override
  String get tutorialL1Finish =>
      'Selesaikan baris terakhir sendiri dan ungkap gambarnya!';

  @override
  String get tutorialL2Groups =>
      '[2 2]: dua kelompok terpisah. 2 terisi, minimal 1 kosong, lalu 2 terisi. 2 + 1 + 2 = 5: pas sekali!';

  @override
  String get tutorialL2Cross =>
      'Jadi kotak tengah kosong. Ketuk dua kali untuk memberinya X.';

  @override
  String get tutorialL2Drag =>
      'X hanya catatan dan tidak memakan apa pun. Sekarang geser sepanjang baris: kotak ber-X dilewati.';

  @override
  String get tutorialL2CrossSelf =>
      'Baris di bawahnya juga [2 2]. Giliranmu: ketuk dua kali kotak kosong dulu untuk memberinya X.';

  @override
  String get tutorialL2DragSelf => 'Sekarang geser untuk mengisi baris.';

  @override
  String get tutorialL2Mistakes =>
      'Hati-hati: mengisi kotak yang salah membuatnya jadi X merah dan kamu kehilangan satu hati. Ragu? Beri X dulu!';

  @override
  String get tutorialL2Finish =>
      'Sisanya milikmu! Buntu? Hitung berapa kotak lagi yang dibutuhkan sebuah garis.';

  @override
  String get tutorialL3Overlap =>
      'Kolom ini [4], dengan ruang untuk 5. Blok 4 itu ada di paling atas atau paling bawah. Mana pun itu, 3 kotak tengah terisi!';

  @override
  String get tutorialL3OverlapFill =>
      'Isi kotak-kotak pasti itu. Trik ini namanya tumpang tindih: rahasia teka-teki besar!';

  @override
  String get tutorialL3OverlapSelf =>
      'Kolom ini juga [4]. Temukan sendiri kotak yang pasti!';

  @override
  String get tutorialL3OverlapRow =>
      'Lalu [3]? Didorong ke kiri atau ke kanan, kotak tengah selalu terisi. Isi kotaknya!';

  @override
  String get tutorialL3Finish =>
      'Hebat! Trik ini akan sering kamu pakai di teka-teki besar. Sekarang selesaikan gambarnya!';

  @override
  String get tutorialL4Ones =>
      'Tiga baris teratas adalah [1 1 1]: tiga kotak tunggal dengan jarak di antaranya. 1 + 1 + 1 + 1 + 1 = 5: pas sekali!';

  @override
  String get tutorialL4CrossDrag =>
      'Jadi tiga kotak teratas di kolom ini kosong. Ketuk dua kali, tahan jari di ketukan kedua, lalu geser ke bawah: tiga X sekaligus!';

  @override
  String get tutorialL4CrossDragSelf =>
      'Giliranmu: gambar X di tiga kotak kosong pada kolom ini dengan satu geseran.';

  @override
  String get tutorialL4Erase =>
      'Salah X? Ketuk dua kali lagi untuk menghapusnya. Geseran ketuk dua kali yang dimulai dari X menghapus X yang dilewati.';

  @override
  String get tutorialL4Finish => 'Keren! Sekarang lengkapi gambarnya.';

  @override
  String get tutorialL5Sum =>
      'Pelajaran terakhir! Kolom ini [3 1]: 3 + 1 + 1 = 5, jadi sudah pasti. Selesaikan sendiri!';

  @override
  String get tutorialL5Hint =>
      'Buntu? Tekan Petunjuk: ia menunjukkan langkah berikutnya beserta alasannya.';

  @override
  String get tutorialL5Finish =>
      'Kamu sudah siap! Di grid besar, garis tebal memisahkan tiap 5 kotak agar mudah dihitung. Selesaikan gambarnya!';
}
