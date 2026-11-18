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
  String tutorialLesson(int lesson, int count) {
    return 'Eğitim $lesson/$count';
  }

  @override
  String get tutorialStart => 'Başlayalım!';

  @override
  String get tutorialSkipTitle => 'Eğitimi atla?';

  @override
  String get tutorialSkipBody =>
      'Yalnızca bu bölümün eğitimini mi, yoksa tüm eğitimi mi atlamak istersin?';

  @override
  String get tutorialSkipLevel => 'Yalnızca bu bölüm';

  @override
  String get tutorialSkipAll => 'Tüm eğitimi atla';

  @override
  String get tutorialWelcome =>
      'Merhaba! Her bulmacada gizli bir resim var. Sayılara bakıp doğru kareleri doldur, resmi ortaya çıkar!';

  @override
  String get tutorialL1Fill =>
      '[5]: bu satırda 5 dolu kare var. Satır da 5 kare, yani hepsi dolu! Bir kareye dokun.';

  @override
  String get tutorialL1Drag =>
      'Süper! Şimdi parmağını kaldırmadan kaydır, satırın kalanını doldur.';

  @override
  String get tutorialL1Row =>
      'Bu satır da [5]. Bu kez baştan sona tek hamlede kaydır.';

  @override
  String get tutorialL1AutoCross =>
      'Bu sütundaki [2] kare bulundu, kalanlar kendiliğinden X oldu. X, burası boş demek.';

  @override
  String get tutorialL1Column =>
      'Üstteki sayılar sütunlar için. Bu sütun [5]: yukarıdan aşağı kaydır.';

  @override
  String get tutorialL1Count =>
      'Bu satıra [3] kare lazım. X\'ler boş; geriye tam 3 kare kaldı. Hepsini doldur!';

  @override
  String get tutorialL1Finish => 'Son satırı sen bitir ve resmi ortaya çıkar!';

  @override
  String get tutorialL2Groups =>
      '[2 2]: iki ayrı grup. 2 dolu, en az 1 boş, sonra 2 dolu. 2 + 1 + 2 = 5: satıra tam sığar!';

  @override
  String get tutorialL2Cross =>
      'Yani ortadaki kare boş. Ona çift dokunarak X koy.';

  @override
  String get tutorialL2Drag =>
      'X bir nottur, hak götürmez. Şimdi satırı baştan sona kaydır; X\'li kare atlanır.';

  @override
  String get tutorialL2CrossSelf =>
      'Alttaki satır da [2 2]. Sıra sende: önce boş kareye çift dokunarak X koy.';

  @override
  String get tutorialL2DragSelf => 'Şimdi satırı kaydırarak doldur.';

  @override
  String get tutorialL2Mistakes =>
      'Dikkat: yanlış kareyi doldurursan kırmızı X olur ve bir kalp gider. Emin değilsen önce X koy!';

  @override
  String get tutorialL2Finish =>
      'Gerisi sende! Takılınca bir çizgide kaç kare kaldığını say.';

  @override
  String get tutorialL3Overlap =>
      'Bu sütun [4], yer 5 kare. 4\'lük blok ya en üstte ya en altta durur. İki durumda da ortadaki 3 kare dolu!';

  @override
  String get tutorialL3OverlapFill =>
      'Bu kesin kareleri doldur. Bu numaranın adı örtüşme: büyük bulmacaların sırrı!';

  @override
  String get tutorialL3OverlapSelf =>
      'Bu sütun da [4]. Kesin dolu kareleri sen bul!';

  @override
  String get tutorialL3OverlapRow =>
      'Peki [3]? Sola da yaslansa sağa da, ortadaki kare hep dolu. Onu doldur!';

  @override
  String get tutorialL3Finish =>
      'Harika! Bu numarayı büyük bulmacalarda çok kullanacaksın. Şimdi resmi bitir!';

  @override
  String get tutorialL4Ones =>
      'Üstteki iki satır [1 1 1]: üç tek kare, aralarında boşluk. 1 + 1 + 1 + 1 + 1 = 5: yerleri belli!';

  @override
  String get tutorialL4CrossDrag =>
      'Bu iki kare boş. Çift dokun, ikinci dokunuşta parmağını kaldırmadan aşağı kaydır: X çizgisi!';

  @override
  String get tutorialL4CrossDragSelf =>
      'Şimdi sen: bu sütundaki iki boş kareye X çiz.';

  @override
  String get tutorialL4Erase =>
      'Yanlış X mi koydun? X\'e yine çift dokun, silinir. X\'ten başlayıp kaydırırsan geçtiğin X\'ler silinir.';

  @override
  String get tutorialL4Finish => 'Süper! Şimdi resmi tamamla.';

  @override
  String get tutorialL5Sum =>
      'Son ders! Bu sütun [3 1]: 3 + 1 + 1 = 5, yerleri belli. Kendin çöz!';

  @override
  String get tutorialL5Hint =>
      'Takılırsan İpucu\'na bas: bir sonraki adımı ve nedenini gösterir.';

  @override
  String get tutorialL5Finish =>
      'Artık hazırsın! Büyük ızgaralarda kalın çizgiler 5\'er kareyi ayırır. Resmi bitir!';
}
