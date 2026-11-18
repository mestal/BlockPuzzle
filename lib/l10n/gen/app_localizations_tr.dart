// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Pixel Bloom';

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
  String hintCount(int count) {
    return '$count ipucu';
  }

  @override
  String get tutorialTap => 'Tek dokun: doldur';

  @override
  String get tutorialDoubleTap =>
      'Çift dokun: X koy (X\'e tekrar çift dokun: kaldır)';

  @override
  String get tutorialDrag =>
      'Basılı tutup kaydırarak birçok kareyi birden işaretle. Çift dokunup X\'ten kaydırırsan X\'leri silersin.';

  @override
  String get hint => 'İpucu';

  @override
  String get noHintsTitle => 'İpucun kalmadı';

  @override
  String get noHintsBody => 'Kısa bir reklam izle, 1 ipucu kazan.';

  @override
  String get noHintsBodyNoAds => 'Tüm ipuçlarını kullandın.';

  @override
  String get watchAdForHint => 'Reklam izle: +1 ipucu';

  @override
  String get outOfLivesTitle => 'Hakların bitti';

  @override
  String get outOfLivesBody =>
      'Reklam izleyerek 1 hak daha kazanabilir ya da bölüme baştan başlayabilirsin.';

  @override
  String get outOfLivesBodyNoAds => 'Bölümü baştan başlat ya da bölümlere dön.';

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
      'Boş olması gereken kareyi doldurursan 1 hakkın gider. X koymak serbest: notlarını istediğin gibi alabilirsin. X olan kareyi doldurmak için önce çift dokunarak X\'i kaldır.';

  @override
  String get rulesScoring =>
      'Doğru her doldurma puan kazandırır. Hatasız art arda doldurdukça çarpan büyür (en çok x5). Satır ve sütunları bitirmek ekstra puandır.';

  @override
  String levelScore(int score) {
    return '$score puan';
  }

  @override
  String totalScore(int total) {
    return 'Toplam: $total';
  }

  @override
  String get rulesGoal =>
      'Tüm dolu kareleri bulunca bloklar gizli resme dönüşür.';

  @override
  String worldLabel(int n) {
    return 'Harita $n';
  }

  @override
  String get worldsTitle => 'Haritalar';

  @override
  String get worldUnlocked => 'Yeni harita açıldı!';

  @override
  String get worldComplete => 'Harita tamamlandı!';

  @override
  String nextWorld(String name) {
    return 'Sonraki harita: $name';
  }

  @override
  String nextWorldLocked(String name) {
    return 'Bu haritayı bitir, $name açılsın';
  }

  @override
  String nextWorldSoon(String name) {
    return '$name çok yakında';
  }

  @override
  String get worldLocked => 'Önceki haritayı bitir';

  @override
  String get worldSoon => 'Yakında';

  @override
  String get youAreHere => 'Buradasın';

  @override
  String get mapStart => 'Başlangıç';

  @override
  String playLevel(int n) {
    return 'Oyna · Bölüm $n';
  }

  @override
  String get tapToContinue => 'Devam etmek için dokun';

  @override
  String starCount(int have, int max) {
    return '$have/$max';
  }

  @override
  String get settings => 'Ayarlar';

  @override
  String get settingsSound => 'Ses efektleri';

  @override
  String get settingsLanguage => 'Dil';

  @override
  String get settingsLanguageDevice => 'Cihaz dili';

  @override
  String hintRow(int n) {
    return '$n. satır';
  }

  @override
  String hintColumn(int n) {
    return '$n. sütun';
  }

  @override
  String hintFullLine(String line, String clue) {
    return '$line ($clue): gruplar ve aralarındaki birer boşluk çizgiyi tam dolduruyor, her karenin yeri belli. Bu kare dolu!';
  }

  @override
  String hintOverlap(String line, String clue) {
    return '$line ($clue): grupları en başa da yaslasan en sona da, bu kare hep bir grubun içinde kalıyor. Bu yüzden kesin dolu!';
  }

  @override
  String hintForcedFill(String line, String clue) {
    return '$line ($clue): açtığın kareler ve X\'ler grupların sığabileceği yerleri daraltıyor. Her olası yerleşimde bu kare dolu!';
  }

  @override
  String hintForcedEmpty(String line, String clue) {
    return '$line ($clue): hiçbir grup bu kareye uzanamıyor, yani burası boş. X koyduk.';
  }

  @override
  String get hintFallback => 'Bu kare resmin bir parçası.';

  @override
  String get tutorialSkip => 'Atla';

  @override
  String get tutorialGotIt => 'Anladım';

  @override
  String get tutorialL1Fill =>
      'Sayılar o satırda kaç dolu kare olduğunu söyler. Bu satırda 5 var, yani 5 karenin hepsi dolu! Bir kareye dokunarak doldur.';

  @override
  String get tutorialL1Drag =>
      'Harika! Şimdi parmağını basılı tutup kaydırarak satırın kalanını doldur.';

  @override
  String get tutorialL1Column => 'Bu sütunda da 5 var: yukarıdan aşağı kaydır.';

  @override
  String get tutorialL1Finish =>
      'Bir satır ya da sütun bitince kalan kareleri kendiliğinden X olur. Resmin kalanını kendin tamamla!';

  @override
  String get tutorialL2Cross =>
      '2 2: önce 2 dolu kare, en az bir boşluk, sonra yine 2 dolu kare. 2 + boşluk + 2 = 5, satır tam belli! Boş kalacak kareye çift dokunarak X koy.';

  @override
  String get tutorialL2Drag =>
      'X koyduğun kareler kaydırırken atlanır. Satırı baştan sona kaydırarak doldur.';

  @override
  String get tutorialL2Rules =>
      'Yanlış kareyi doldurursan 1 hak gider; X koymak ise serbest. Takılırsan İpucu düğmesi nedenini de anlatır. Gerisi sende!';
}
