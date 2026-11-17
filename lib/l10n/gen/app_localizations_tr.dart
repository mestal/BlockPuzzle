// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'BlockPuzzle';

  @override
  String get whoIsPlaying => 'Kim oynuyor?';

  @override
  String get newGame => 'Yeni oyun';

  @override
  String get emptySlot => 'Boş slot';

  @override
  String get yourName => 'Adın';

  @override
  String get namePlaceholder => 'Örneğin Ayşe';

  @override
  String get nameRequired => 'Bir ad yaz';

  @override
  String get pickColor => 'Rengini seç';

  @override
  String get start => 'Başla';

  @override
  String get cancel => 'Vazgeç';

  @override
  String deleteSlotTitle(String name) {
    return '$name silinsin mi?';
  }

  @override
  String get deleteSlotBody =>
      'Bu oyuncunun tüm ilerlemesi silinecek. Bu işlem geri alınamaz.';

  @override
  String get delete => 'Sil';

  @override
  String levelLabel(int n) {
    return 'Bölüm $n';
  }

  @override
  String levelsDone(int done, int total) {
    return '$done/$total bölüm';
  }

  @override
  String hintCount(int count) {
    return '$count ipucu';
  }

  @override
  String comingSoon(int count) {
    return '$count bölüm daha yakında';
  }

  @override
  String get tutorialTap => 'Tek dokun: X koy';

  @override
  String get tutorialDoubleTap => 'Çift dokun: doldur';

  @override
  String get tutorialDrag =>
      'Basılı tutup kaydırarak birçok kareyi birden işaretle';

  @override
  String get hint => 'İpucu';

  @override
  String get noHintsTitle => 'İpucun kalmadı';

  @override
  String get noHintsBody => 'Kısa bir reklam izle, 1 ipucu kazan.';

  @override
  String get watchAdForHint => 'Reklam izle: +1 ipucu';

  @override
  String get outOfLivesTitle => 'Hakların bitti';

  @override
  String get outOfLivesBody =>
      'Reklam izleyerek 1 hak daha kazanabilir ya da bölüme baştan başlayabilirsin.';

  @override
  String get watchAdForLife => 'Reklam izle: +1 hak';

  @override
  String get restart => 'Baştan başla';

  @override
  String get backToLevels => 'Bölümlere dön';

  @override
  String get levelComplete => 'Harika!';

  @override
  String nextLevel(int n) {
    return 'Sıradaki: Bölüm $n';
  }

  @override
  String get ok => 'Tamam';

  @override
  String get allDoneSoon => 'Yeni bölümler çok yakında';

  @override
  String get adLabel => 'Reklam';

  @override
  String get adPlaceholder => 'Burada reklam gösterilecek';

  @override
  String get adClose => 'Kapat';

  @override
  String adCountdown(int seconds) {
    return '$seconds sn';
  }

  @override
  String get rulesTitle => 'Nasıl oynanır?';

  @override
  String get rulesClues =>
      'Soldaki ve üstteki sayılar o satırda ve sütunda kaç dolu kare olduğunu gösterir. Birden çok sayı varsa gruplar arasında en az bir boşluk vardır.';

  @override
  String get rulesMistakes =>
      'Yanlış kareyi doldurursan ya da dolu olması gereken kareye X koyarsan 1 hakkın gider.';

  @override
  String get rulesGoal =>
      'Tüm dolu kareleri bulunca bloklar gizli resme dönüşür.';
}
