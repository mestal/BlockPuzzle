import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bg.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fa.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fil.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_ms.dart';
import 'app_localizations_nb.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pa.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_sw.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_te.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bg'),
    Locale('bn'),
    Locale('cs'),
    Locale('da'),
    Locale('de'),
    Locale('el'),
    Locale('en'),
    Locale('es'),
    Locale('fa'),
    Locale('fi'),
    Locale('fil'),
    Locale('fr'),
    Locale('hi'),
    Locale('hu'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('mr'),
    Locale('ms'),
    Locale('nb'),
    Locale('nl'),
    Locale('pa'),
    Locale('pl'),
    Locale('pt'),
    Locale('ro'),
    Locale('ru'),
    Locale('sv'),
    Locale('sw'),
    Locale('ta'),
    Locale('te'),
    Locale('th'),
    Locale('tr'),
    Locale('uk'),
    Locale('ur'),
    Locale('vi'),
    Locale('zh'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In tr, this message translates to:
  /// **'Pixel Bloom'**
  String get appTitle;

  /// No description provided for @whoIsPlaying.
  ///
  /// In tr, this message translates to:
  /// **'Kim oynuyor?'**
  String get whoIsPlaying;

  /// No description provided for @newGame.
  ///
  /// In tr, this message translates to:
  /// **'Yeni oyun'**
  String get newGame;

  /// No description provided for @emptySlot.
  ///
  /// In tr, this message translates to:
  /// **'Boş slot'**
  String get emptySlot;

  /// No description provided for @yourName.
  ///
  /// In tr, this message translates to:
  /// **'Adın'**
  String get yourName;

  /// No description provided for @namePlaceholder.
  ///
  /// In tr, this message translates to:
  /// **'Örneğin Ayşe'**
  String get namePlaceholder;

  /// No description provided for @nameRequired.
  ///
  /// In tr, this message translates to:
  /// **'Bir ad yaz'**
  String get nameRequired;

  /// No description provided for @start.
  ///
  /// In tr, this message translates to:
  /// **'Başla'**
  String get start;

  /// No description provided for @cancel.
  ///
  /// In tr, this message translates to:
  /// **'Vazgeç'**
  String get cancel;

  /// No description provided for @deleteSlotTitle.
  ///
  /// In tr, this message translates to:
  /// **'{name} silinsin mi?'**
  String deleteSlotTitle(String name);

  /// No description provided for @deleteSlotBody.
  ///
  /// In tr, this message translates to:
  /// **'Bu oyuncunun tüm ilerlemesi silinecek. Bu işlem geri alınamaz.'**
  String get deleteSlotBody;

  /// No description provided for @delete.
  ///
  /// In tr, this message translates to:
  /// **'Sil'**
  String get delete;

  /// No description provided for @levelLabel.
  ///
  /// In tr, this message translates to:
  /// **'Bölüm {n}'**
  String levelLabel(int n);

  /// No description provided for @hintCount.
  ///
  /// In tr, this message translates to:
  /// **'{count} ipucu'**
  String hintCount(int count);

  /// No description provided for @tutorialTap.
  ///
  /// In tr, this message translates to:
  /// **'Tek dokun: doldur'**
  String get tutorialTap;

  /// No description provided for @tutorialDoubleTap.
  ///
  /// In tr, this message translates to:
  /// **'Çift dokun: X koy (X\'e tekrar çift dokun: kaldır)'**
  String get tutorialDoubleTap;

  /// No description provided for @tutorialDrag.
  ///
  /// In tr, this message translates to:
  /// **'Basılı tutup kaydırarak birçok kareyi birden işaretle. Çift dokunup X\'ten kaydırırsan X\'leri silersin.'**
  String get tutorialDrag;

  /// No description provided for @hint.
  ///
  /// In tr, this message translates to:
  /// **'İpucu'**
  String get hint;

  /// No description provided for @noHintsTitle.
  ///
  /// In tr, this message translates to:
  /// **'İpucun kalmadı'**
  String get noHintsTitle;

  /// No description provided for @noHintsBody.
  ///
  /// In tr, this message translates to:
  /// **'Kısa bir reklam izle, 1 ipucu kazan.'**
  String get noHintsBody;

  /// No description provided for @noHintsBodyNoAds.
  ///
  /// In tr, this message translates to:
  /// **'Tüm ipuçlarını kullandın.'**
  String get noHintsBodyNoAds;

  /// No description provided for @watchAdForHint.
  ///
  /// In tr, this message translates to:
  /// **'Reklam izle: +1 ipucu'**
  String get watchAdForHint;

  /// No description provided for @outOfLivesTitle.
  ///
  /// In tr, this message translates to:
  /// **'Hakların bitti'**
  String get outOfLivesTitle;

  /// No description provided for @outOfLivesBody.
  ///
  /// In tr, this message translates to:
  /// **'Reklam izleyerek 1 hak daha kazanabilir ya da bölüme baştan başlayabilirsin.'**
  String get outOfLivesBody;

  /// No description provided for @outOfLivesBodyNoAds.
  ///
  /// In tr, this message translates to:
  /// **'Bölümü baştan başlat ya da bölümlere dön.'**
  String get outOfLivesBodyNoAds;

  /// No description provided for @watchAdForLife.
  ///
  /// In tr, this message translates to:
  /// **'Reklam izle: +1 hak'**
  String get watchAdForLife;

  /// No description provided for @restart.
  ///
  /// In tr, this message translates to:
  /// **'Baştan başla'**
  String get restart;

  /// No description provided for @backToLevels.
  ///
  /// In tr, this message translates to:
  /// **'Bölümlere dön'**
  String get backToLevels;

  /// No description provided for @levelComplete.
  ///
  /// In tr, this message translates to:
  /// **'Harika!'**
  String get levelComplete;

  /// No description provided for @nextLevel.
  ///
  /// In tr, this message translates to:
  /// **'Sıradaki: Bölüm {n}'**
  String nextLevel(int n);

  /// No description provided for @ok.
  ///
  /// In tr, this message translates to:
  /// **'Tamam'**
  String get ok;

  /// No description provided for @allDoneSoon.
  ///
  /// In tr, this message translates to:
  /// **'Yeni bölümler çok yakında'**
  String get allDoneSoon;

  /// No description provided for @adLabel.
  ///
  /// In tr, this message translates to:
  /// **'Reklam'**
  String get adLabel;

  /// No description provided for @adPlaceholder.
  ///
  /// In tr, this message translates to:
  /// **'Burada reklam gösterilecek'**
  String get adPlaceholder;

  /// No description provided for @adClose.
  ///
  /// In tr, this message translates to:
  /// **'Kapat'**
  String get adClose;

  /// No description provided for @adCountdown.
  ///
  /// In tr, this message translates to:
  /// **'{seconds} sn'**
  String adCountdown(int seconds);

  /// No description provided for @rulesTitle.
  ///
  /// In tr, this message translates to:
  /// **'Nasıl oynanır?'**
  String get rulesTitle;

  /// No description provided for @rulesClues.
  ///
  /// In tr, this message translates to:
  /// **'Soldaki ve üstteki sayılar o satırda ve sütunda kaç dolu kare olduğunu gösterir. Birden çok sayı varsa gruplar arasında en az bir boşluk vardır.'**
  String get rulesClues;

  /// No description provided for @rulesMistakes.
  ///
  /// In tr, this message translates to:
  /// **'Boş olması gereken kareyi doldurursan 1 hakkın gider. X koymak serbest: notlarını istediğin gibi alabilirsin. X olan kareyi doldurmak için önce çift dokunarak X\'i kaldır.'**
  String get rulesMistakes;

  /// No description provided for @rulesScoring.
  ///
  /// In tr, this message translates to:
  /// **'Doğru her doldurma puan kazandırır. Hatasız art arda doldurdukça çarpan büyür (en çok x5). Satır ve sütunları bitirmek ekstra puandır.'**
  String get rulesScoring;

  /// No description provided for @levelScore.
  ///
  /// In tr, this message translates to:
  /// **'{score} puan'**
  String levelScore(int score);

  /// No description provided for @totalScore.
  ///
  /// In tr, this message translates to:
  /// **'Toplam: {total}'**
  String totalScore(int total);

  /// No description provided for @rulesGoal.
  ///
  /// In tr, this message translates to:
  /// **'Tüm dolu kareleri bulunca bloklar gizli resme dönüşür.'**
  String get rulesGoal;

  /// No description provided for @worldLabel.
  ///
  /// In tr, this message translates to:
  /// **'Harita {n}'**
  String worldLabel(int n);

  /// No description provided for @worldsTitle.
  ///
  /// In tr, this message translates to:
  /// **'Haritalar'**
  String get worldsTitle;

  /// No description provided for @worldUnlocked.
  ///
  /// In tr, this message translates to:
  /// **'Yeni harita açıldı!'**
  String get worldUnlocked;

  /// No description provided for @worldComplete.
  ///
  /// In tr, this message translates to:
  /// **'Harita tamamlandı!'**
  String get worldComplete;

  /// No description provided for @nextWorld.
  ///
  /// In tr, this message translates to:
  /// **'Sonraki harita: {name}'**
  String nextWorld(String name);

  /// No description provided for @nextWorldLocked.
  ///
  /// In tr, this message translates to:
  /// **'Bu haritayı bitir, {name} açılsın'**
  String nextWorldLocked(String name);

  /// No description provided for @nextWorldSoon.
  ///
  /// In tr, this message translates to:
  /// **'{name} çok yakında'**
  String nextWorldSoon(String name);

  /// No description provided for @worldLocked.
  ///
  /// In tr, this message translates to:
  /// **'Önceki haritayı bitir'**
  String get worldLocked;

  /// No description provided for @worldSoon.
  ///
  /// In tr, this message translates to:
  /// **'Yakında'**
  String get worldSoon;

  /// No description provided for @youAreHere.
  ///
  /// In tr, this message translates to:
  /// **'Buradasın'**
  String get youAreHere;

  /// No description provided for @mapStart.
  ///
  /// In tr, this message translates to:
  /// **'Başlangıç'**
  String get mapStart;

  /// No description provided for @playLevel.
  ///
  /// In tr, this message translates to:
  /// **'Oyna · Bölüm {n}'**
  String playLevel(int n);

  /// No description provided for @tapToContinue.
  ///
  /// In tr, this message translates to:
  /// **'Devam etmek için dokun'**
  String get tapToContinue;

  /// No description provided for @starCount.
  ///
  /// In tr, this message translates to:
  /// **'{have}/{max}'**
  String starCount(int have, int max);

  /// No description provided for @settings.
  ///
  /// In tr, this message translates to:
  /// **'Ayarlar'**
  String get settings;

  /// No description provided for @settingsSound.
  ///
  /// In tr, this message translates to:
  /// **'Ses efektleri'**
  String get settingsSound;

  /// No description provided for @settingsLanguage.
  ///
  /// In tr, this message translates to:
  /// **'Dil'**
  String get settingsLanguage;

  /// No description provided for @settingsLanguageDevice.
  ///
  /// In tr, this message translates to:
  /// **'Cihaz dili'**
  String get settingsLanguageDevice;

  /// No description provided for @hintRow.
  ///
  /// In tr, this message translates to:
  /// **'{n}. satır'**
  String hintRow(int n);

  /// No description provided for @hintColumn.
  ///
  /// In tr, this message translates to:
  /// **'{n}. sütun'**
  String hintColumn(int n);

  /// No description provided for @hintFullLine.
  ///
  /// In tr, this message translates to:
  /// **'{line} ({clue}): {sum} = {length}, çizginin tam boyu. Gruplar ve aralarındaki birer boşluk çizgiyi tam dolduruyor, her karenin yeri belli. Bu kare dolu!'**
  String hintFullLine(String line, String clue, String sum, int length);

  /// No description provided for @hintOverlap.
  ///
  /// In tr, this message translates to:
  /// **'{line} ({clue}): {size} karelik blok en başa itilince {early}., en sona itilince {late}. kareleri kaplıyor. İkisinde de dolu olan kareler ({common}) kesin dolu!'**
  String hintOverlap(
    String line,
    String clue,
    int size,
    String early,
    String late,
    String common,
  );

  /// No description provided for @hintForcedFill.
  ///
  /// In tr, this message translates to:
  /// **'{line} ({clue}): açtığın kareler ve X\'ler grupların sığabileceği yerleri daraltıyor. Her olası yerleşimde bu kare dolu!'**
  String hintForcedFill(String line, String clue);

  /// No description provided for @hintForcedEmpty.
  ///
  /// In tr, this message translates to:
  /// **'{line} ({clue}): hiçbir grup bu kareye uzanamıyor, yani burası boş. X koyduk.'**
  String hintForcedEmpty(String line, String clue);

  /// No description provided for @hintOutOfReach.
  ///
  /// In tr, this message translates to:
  /// **'{line} ({clue}): gruplar ancak şu karelere uzanabilir: {reach}. {cell}. kare hepsinin dışında kalıyor, yani boş!'**
  String hintOutOfReach(String line, String clue, String reach, int cell);

  /// No description provided for @hintBlockDone.
  ///
  /// In tr, this message translates to:
  /// **'{line} ({clue}): yanındaki blok ({cells}) zaten {size} kare; buraya sığabilecek en büyük grup da bu kadar. Blok tamam, bu kare boş!'**
  String hintBlockDone(String line, String clue, String cells, int size);

  /// No description provided for @hintTooSmall.
  ///
  /// In tr, this message translates to:
  /// **'{line} ({clue}): bu kare, X\'ler ya da kenar arasındaki {gap} karelik bir boşlukta. Buraya uzanan en küçük grup bile {size} kare, sığmıyor. Bu kare boş!'**
  String hintTooSmall(String line, String clue, int gap, int size);

  /// No description provided for @hintFixedCross.
  ///
  /// In tr, this message translates to:
  /// **'Buradaki X\'in yanlıştı, kaldırdık.'**
  String get hintFixedCross;

  /// No description provided for @hintFallback.
  ///
  /// In tr, this message translates to:
  /// **'Bu kare resmin bir parçası.'**
  String get hintFallback;

  /// No description provided for @tutorialSkip.
  ///
  /// In tr, this message translates to:
  /// **'Atla'**
  String get tutorialSkip;

  /// No description provided for @tutorialGotIt.
  ///
  /// In tr, this message translates to:
  /// **'Anladım'**
  String get tutorialGotIt;

  /// No description provided for @tutorialLesson.
  ///
  /// In tr, this message translates to:
  /// **'Eğitim {lesson}/{count}'**
  String tutorialLesson(int lesson, int count);

  /// No description provided for @tutorialStart.
  ///
  /// In tr, this message translates to:
  /// **'Başlayalım!'**
  String get tutorialStart;

  /// No description provided for @tutorialSkipTitle.
  ///
  /// In tr, this message translates to:
  /// **'Eğitimi atla?'**
  String get tutorialSkipTitle;

  /// No description provided for @tutorialSkipBody.
  ///
  /// In tr, this message translates to:
  /// **'Yalnızca bu bölümün eğitimini mi, yoksa tüm eğitimi mi atlamak istersin?'**
  String get tutorialSkipBody;

  /// No description provided for @tutorialSkipLevel.
  ///
  /// In tr, this message translates to:
  /// **'Yalnızca bu bölüm'**
  String get tutorialSkipLevel;

  /// No description provided for @tutorialSkipAll.
  ///
  /// In tr, this message translates to:
  /// **'Tüm eğitimi atla'**
  String get tutorialSkipAll;

  /// No description provided for @tutorialWelcome.
  ///
  /// In tr, this message translates to:
  /// **'Merhaba! Her bulmacada gizli bir resim var. Sayılara bakıp doğru kareleri doldur, resmi ortaya çıkar!'**
  String get tutorialWelcome;

  /// No description provided for @tutorialL1Fill.
  ///
  /// In tr, this message translates to:
  /// **'[5]: bu satırda 5 dolu kare var. Satır da 5 kare, yani hepsi dolu! Bir kareye dokun.'**
  String get tutorialL1Fill;

  /// No description provided for @tutorialL1Drag.
  ///
  /// In tr, this message translates to:
  /// **'Süper! Şimdi parmağını kaldırmadan kaydır, satırın kalanını doldur.'**
  String get tutorialL1Drag;

  /// No description provided for @tutorialL1Row.
  ///
  /// In tr, this message translates to:
  /// **'Bu satır da [5]. Bu kez baştan sona tek hamlede kaydır.'**
  String get tutorialL1Row;

  /// No description provided for @tutorialL1AutoCross.
  ///
  /// In tr, this message translates to:
  /// **'Bu sütundaki [2] kare bulundu, kalanlar kendiliğinden X oldu. X, burası boş demek.'**
  String get tutorialL1AutoCross;

  /// No description provided for @tutorialL1Column.
  ///
  /// In tr, this message translates to:
  /// **'Üstteki sayılar sütunlar için. Bu sütun [5]: yukarıdan aşağı kaydır.'**
  String get tutorialL1Column;

  /// No description provided for @tutorialL1Count.
  ///
  /// In tr, this message translates to:
  /// **'Bu satıra [3] kare lazım. X\'ler boş; geriye tam 3 kare kaldı. Hepsini doldur!'**
  String get tutorialL1Count;

  /// No description provided for @tutorialL1Finish.
  ///
  /// In tr, this message translates to:
  /// **'Son satırı sen bitir ve resmi ortaya çıkar!'**
  String get tutorialL1Finish;

  /// No description provided for @tutorialL2Groups.
  ///
  /// In tr, this message translates to:
  /// **'[2 2]: iki ayrı grup. 2 dolu, en az 1 boş, sonra 2 dolu. 2 + 1 + 2 = 5: satıra tam sığar!'**
  String get tutorialL2Groups;

  /// No description provided for @tutorialL2Cross.
  ///
  /// In tr, this message translates to:
  /// **'Yani ortadaki kare boş. Ona çift dokunarak X koy.'**
  String get tutorialL2Cross;

  /// No description provided for @tutorialL2Drag.
  ///
  /// In tr, this message translates to:
  /// **'X bir nottur, hak götürmez. Şimdi satırı baştan sona kaydır; X\'li kare atlanır.'**
  String get tutorialL2Drag;

  /// No description provided for @tutorialL2CrossSelf.
  ///
  /// In tr, this message translates to:
  /// **'Alttaki satır da [2 2]. Sıra sende: önce boş kareye çift dokunarak X koy.'**
  String get tutorialL2CrossSelf;

  /// No description provided for @tutorialL2DragSelf.
  ///
  /// In tr, this message translates to:
  /// **'Şimdi satırı kaydırarak doldur.'**
  String get tutorialL2DragSelf;

  /// No description provided for @tutorialL2Mistakes.
  ///
  /// In tr, this message translates to:
  /// **'Dikkat: yanlış kareyi doldurursan kırmızı X olur ve bir kalp gider. Emin değilsen önce X koy!'**
  String get tutorialL2Mistakes;

  /// No description provided for @tutorialL2Finish.
  ///
  /// In tr, this message translates to:
  /// **'Gerisi sende! Takılınca bir çizgide kaç kare kaldığını say.'**
  String get tutorialL2Finish;

  /// No description provided for @tutorialL3Overlap.
  ///
  /// In tr, this message translates to:
  /// **'Bu sütun [4], yer 5 kare. 4\'lük blok ya en üstte ya en altta durur. İki durumda da ortadaki 3 kare dolu!'**
  String get tutorialL3Overlap;

  /// No description provided for @tutorialL3OverlapFill.
  ///
  /// In tr, this message translates to:
  /// **'Bu kesin kareleri doldur. Bu numaranın adı örtüşme: büyük bulmacaların sırrı!'**
  String get tutorialL3OverlapFill;

  /// No description provided for @tutorialL3OverlapSelf.
  ///
  /// In tr, this message translates to:
  /// **'Bu sütun da [4]. Kesin dolu kareleri sen bul!'**
  String get tutorialL3OverlapSelf;

  /// No description provided for @tutorialL3OverlapRow.
  ///
  /// In tr, this message translates to:
  /// **'Peki [3]? Sola da yaslansa sağa da, ortadaki kare hep dolu. Onu doldur!'**
  String get tutorialL3OverlapRow;

  /// No description provided for @tutorialL3Finish.
  ///
  /// In tr, this message translates to:
  /// **'Harika! Bu numarayı büyük bulmacalarda çok kullanacaksın. Şimdi resmi bitir!'**
  String get tutorialL3Finish;

  /// No description provided for @tutorialL4Ones.
  ///
  /// In tr, this message translates to:
  /// **'Üstteki üç satır [1 1 1]: üç tek kare, aralarında birer boşluk. 1 + 1 + 1 + 1 + 1 = 5: yerleri belli!'**
  String get tutorialL4Ones;

  /// No description provided for @tutorialL4CrossDrag.
  ///
  /// In tr, this message translates to:
  /// **'Yani bu sütunun üstteki üç karesi boş. Çift dokun, ikinci dokunuşta parmağını kaldırmadan aşağı kaydır: üç X birden!'**
  String get tutorialL4CrossDrag;

  /// No description provided for @tutorialL4CrossDragSelf.
  ///
  /// In tr, this message translates to:
  /// **'Şimdi sen: bu sütundaki üç boş kareye tek seferde X çiz.'**
  String get tutorialL4CrossDragSelf;

  /// No description provided for @tutorialL4Erase.
  ///
  /// In tr, this message translates to:
  /// **'Yanlış X mi koydun? X\'e yine çift dokun, silinir. X\'ten başlayıp kaydırırsan geçtiğin X\'ler silinir.'**
  String get tutorialL4Erase;

  /// No description provided for @tutorialL4Finish.
  ///
  /// In tr, this message translates to:
  /// **'Süper! Şimdi resmi tamamla.'**
  String get tutorialL4Finish;

  /// No description provided for @tutorialL5Gaps.
  ///
  /// In tr, this message translates to:
  /// **'Son ders: X ile çözmek! Kenardaki dört sütun [2 2]: 2 + 1 + 2 = 5. Hepsinin boşluğu ortadaki satıra düşüyor.'**
  String get tutorialL5Gaps;

  /// No description provided for @tutorialL5CrossDrag.
  ///
  /// In tr, this message translates to:
  /// **'Bu boş karelere X koy: çift dokun, ikinci dokunuşta parmağını kaldırmadan yana kaydır. İki X birden!'**
  String get tutorialL5CrossDrag;

  /// No description provided for @tutorialL5CrossDragSelf.
  ///
  /// In tr, this message translates to:
  /// **'Şimdi sen: sağdaki iki boş kareye tek seferde X çiz.'**
  String get tutorialL5CrossDragSelf;

  /// No description provided for @tutorialL5Count.
  ///
  /// In tr, this message translates to:
  /// **'Bu satır [1] ve X\'lerden sonra tek kare kaldı. X\'ler saymayı kolaylaştırır: doldur!'**
  String get tutorialL5Count;

  /// No description provided for @tutorialL5Hint.
  ///
  /// In tr, this message translates to:
  /// **'Takılırsan İpucu\'na bas: bir sonraki adımı ve nedenini gösterir.'**
  String get tutorialL5Hint;

  /// No description provided for @tutorialL5Finish.
  ///
  /// In tr, this message translates to:
  /// **'Artık hazırsın! Büyük ızgaralarda kalın çizgiler 5\'er kareyi ayırır. Resmi bitir!'**
  String get tutorialL5Finish;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'bg',
    'bn',
    'cs',
    'da',
    'de',
    'el',
    'en',
    'es',
    'fa',
    'fi',
    'fil',
    'fr',
    'hi',
    'hu',
    'id',
    'it',
    'ja',
    'ko',
    'mr',
    'ms',
    'nb',
    'nl',
    'pa',
    'pl',
    'pt',
    'ro',
    'ru',
    'sv',
    'sw',
    'ta',
    'te',
    'th',
    'tr',
    'uk',
    'ur',
    'vi',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bg':
      return AppLocalizationsBg();
    case 'bn':
      return AppLocalizationsBn();
    case 'cs':
      return AppLocalizationsCs();
    case 'da':
      return AppLocalizationsDa();
    case 'de':
      return AppLocalizationsDe();
    case 'el':
      return AppLocalizationsEl();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fa':
      return AppLocalizationsFa();
    case 'fi':
      return AppLocalizationsFi();
    case 'fil':
      return AppLocalizationsFil();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'hu':
      return AppLocalizationsHu();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'mr':
      return AppLocalizationsMr();
    case 'ms':
      return AppLocalizationsMs();
    case 'nb':
      return AppLocalizationsNb();
    case 'nl':
      return AppLocalizationsNl();
    case 'pa':
      return AppLocalizationsPa();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ro':
      return AppLocalizationsRo();
    case 'ru':
      return AppLocalizationsRu();
    case 'sv':
      return AppLocalizationsSv();
    case 'sw':
      return AppLocalizationsSw();
    case 'ta':
      return AppLocalizationsTa();
    case 'te':
      return AppLocalizationsTe();
    case 'th':
      return AppLocalizationsTh();
    case 'tr':
      return AppLocalizationsTr();
    case 'uk':
      return AppLocalizationsUk();
    case 'ur':
      return AppLocalizationsUr();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
