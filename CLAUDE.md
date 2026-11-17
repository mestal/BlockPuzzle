# BlockPuzzle — CLAUDE.md

Mobil (yalnızca **dikey / portrait**) bir **nonogram** bulmaca oyunu. Flutter ile yazılır.
Oyuncu, satır ve sütun ipuçlarına bakarak doğru kareleri doldurur; bölüm bitince dolu bloklar
renklenip gizli bir **resme** dönüşür. 200 bölüm, kolaydan zora.

> Referans ekran görüntüleri: `G:\My Drive\Projects\BlockPuzzle` — yalnızca **mekanik** referansıdır.
> Görseller, karakterler, renk paleti ve arayüz **tamamen özgün** olmalı; başka bir oyunun
> görünümü, logosu, karakteri veya bölümleri kopyalanmaz.

---

## 1. Oyun kuralları

### Izgara ve ipuçları
- Izgara `R x C` karedir. Her kare çözümde ya **dolu** ya **boş**tur.
- **Soldaki sayılar** o satırdaki, **üstteki sayılar** o sütundaki dolu blok gruplarını gösterir.
  - Birden çok sayı varsa o kadar ayrı grup vardır, **sırası korunur** (soldan sağa / yukarıdan aşağıya)
    ve gruplar arasında **en az bir boş kare** bulunur.
  - Örnek: `6 1` → önce 6 bitişik dolu kare, en az bir boşluk, sonra 1 dolu kare.
  - Tamamen boş satır/sütunun ipucu `0`'dır.
- Her bölümün **tek bir çözümü** olmalı ve tahmin gerektirmeden (yalnızca mantıkla) çözülebilmelidir.
  Bu, testlerde bir çözücü (line solver) ile doğrulanır.

### Etkileşim
Mod düğmesi yok; işlemi **jest** belirler:

| Jest | Sonuç |
|---|---|
| Tek dokunma | Kareyi **doldur** |
| Tek dokunup basılı tutarak sürükleme | Geçilen kareleri **doldur** |
| Çift dokunma | Kareye **X** (oyuncunun kendi X'ine çift dokunma X'i **kaldırır**) |
| Çift dokunup ikinci dokunuşta basılı tutarak sürükleme | Geçilen karelere **X**; oyuncunun kendi X'inden başlanırsa geçilen X'ler **silinir** |

- Tek dokunma, çift dokunma olup olmadığını anlamak için ~250 ms bekler (`kDoubleTapTimeout`),
  ama oyuncu bunu hissetmez: parmak değdiği anda kare **dolu blok olarak önizlenir** (ses + haptic
  hemen). Hamle süre dolunca işlenir; kare yanlışsa o an kırmızı X'e döner. Çift dokunmada önizleme
  geri alınır ve X konur. Önizleme her zaman doğru doldurma gibi görünür (çözümü sızdırmaz).
- Çift dokunma yalnızca **aynı karede** sayılır (kare sınırında birkaç piksellik tolerans).
  Bu sürede başka bir kareye dokunulursa önceki dokunuş hemen doldurma olarak işlenir.
- Sürükleme ilk hareket yönüne (yatay/dikey) kilitlenir; tek satır veya sütun boyunca ilerler.
- Sürüklemede zaten açılmış (dolu veya X) kareler atlanır, hiçbir şey olmaz.
- Jestler keşfedilmesi zor olduğundan **Bölüm 1 el animasyonlu bir öğretici** içerir
  (önce tek dokunuş = doldur, sonra çift dokunuş = X).

### Doğru / yanlış nasıl anlaşılır
Her bölümün çözümü (`solution`) oyunda kayıtlıdır. **X serbesttir**: yanlış yere de konabilir,
hak kaybettirmez (oyuncunun notudur). Yalnızca **doldurma** hamlesi anında kontrol edilir:

| Oyuncunun hamlesi | Çözümde kare dolu | Çözümde kare boş |
|---|---|---|
| Doldur (boş kareye) | ✅ Doğru, kare dolar | ❌ Yanlış: kırmızı X'e döner, 1 hak gider |
| X koy | ✅ (not) | ✅ (not) |

- Oyuncunun kendi X'i olan kareye dokunmak **doldurmaz**; önce çift dokunarak X kaldırılmalı.
  (İpucu ise yanlış bir oyuncu X'inin üstüne doldurabilir.)
- Doldurma sürüklemesi yanlış karelerde durmaz: her yanlış kare kırmızı X olur ve 1 hak götürür
  (5 kare sürüklenip 3'ü yanlışsa 3 hak gider). Haklar biterse sürükleme durur. X sürüklemesi hiç durmaz.
- Bir satır veya sütunun tüm dolu kareleri bulununca kalan kareler (oyuncunun yanlış X'leri dahil)
  otomatik **yeşil X** olur, ipucu kutusu altına döner ve **satır/sütun kutlaması** oynar.
- X'ler kaynağına göre farklı renkte çizilir (`MarkSource` enum'u: `user`, `auto`, `mistake`, `hint`):

  | X türü | Renk | Görünüm |
  |---|---|---|
  | Oyuncunun kendi koyduğu X | `#1E3A8A` koyu mavi | kalın, net |
  | Satır/sütun tamamlanınca otomatik X | `#22C55E` yeşil | ince, dalgayla sırayla belirir |
  | Yanlış doldurma sonrası düzeltilen X | `#EF4444` kırmızı | kırmızı kalır, hatanın yeri görünsün |
  | İpucunun koyduğu X | `#B45309` koyu altın | kilitli |

  Otomatik X konmuş bir kareye oyuncu sonradan dokunursa hiçbir şey olmaz.

### Puanlama (`features/game/domain/scoring.dart`)
- Doğru doldurma: 10 puan × çarpan. Çarpan her 5 art arda doğru doldurmada artar (x1 → x5);
  hatada kombo sıfırlanır. İpucu ile açılan kare puan vermez.
- Satır/sütun bitirme: 50 × çarpan (satır başına).
- Bölüm sonu: 100 + kalan can × 50 + hatasızsa 200. Yıldız: 0 hata 3★, 1 hata 2★, fazlası 1★.
- Bölüm puanı yarım kalan bölümle birlikte saklanır; biten bölümler `SlotData.totalScore`'a eklenir.

### Ses
- Sesler `tool/generate_sounds.dart` ile üretilip `assets/audio/*.wav` olarak saklanır
  (`dart run tool/generate_sounds.dart`). `SoundService` (`core/audio`) çalar.
- Her sesin **kendi oyuncusu** vardır, kaynak bir kez ayarlanır; tekrar çalmak `stop` + `resume`.
  Paylaşılan oyunculara kaynak değiştirmek Android low-latency (SoundPool) modunda sesi kesiyordu.
  Ses odağı alınmaz (`mixWithOthers`); aynı ses 35 ms'den sık tetiklenirse atlanır.
- Sürükleme sürdükçe doldurma/X sesi pentatonik merdivenden yukarı çıkar (giderek incelir).

### Haklar (can)
- Her bölüm **10 hak** ile başlar (kalp ikonu + sayı; `GameState.maxLives`, ileride artabilir).
- Haklar bitince "Hakların bitti" popup'ı: **Reklam izle → +1 hak** (bölüm kaldığı yerden devam eder)
  veya **Bölümü yeniden başlat**.

### İpucu (hint)
- Oyuncu profili başına **toplam 5 ipucu** ile başlanır; bölümler arasında taşınır ve kaydedilir.
- İpucu **öğretir** (`features/game/domain/hint.dart`): bilinen karelerden (dolu kareler, kilitli X'ler,
  oyuncunun doğru X'leri) tek bir satır/sütunla kanıtlanabilen en kolay adımı seçer ve **nedenini**
  açıklayan bir kart gösterir; ilgili satır/sütun ve ipucu kutusu vurgulanır. Neden sırası:
  tam dolu çizgi → örtüşme (gruplar başa/sona yaslansa da kapsanan kare) → bilinenlerle zorunlu dolu
  → zorunlu boş (bu durumda altın renkli **ipucu X**'i konur). Dolu adımlar boş adımlara tercih edilir.
  Test: ipuçlarını izleyerek her bölüm hatasız çözülür.
- İpucu 0 iken düğmeye basılınca: **Reklam izle → +1 ipucu**.

### Bölüm sonu
- Son doğru kare girildiğinde: bloklar dalga halinde dönerek bölümün **renkli resmine** dönüşür,
  resmin adı görünür, konfeti + yıldız patlaması.
- Ardından popup: tamamlanan resim + **sonraki bölümün önizlemesi** (bulanık / siluet) + **Tamam**.
- **Tamam** → (geçiş reklamı) → sonraki bölüm.

### Reklamlar
- Tüm reklamlar `AdService` arayüzü üzerinden çağrılır.
- Şimdilik `DummyAdService`: tam ekran sahte reklam, 3 sn geri sayım, sonra kapat. Ödüllü reklamlar
  kapatılınca ödülü verir.
- AdMob (`google_mobile_ads`) daha sonra `AdMobAdService` olarak eklenecek; oyun kodu değişmemeli.
- Reklam türleri: `showInterstitial()` (bölüm geçişi), `showRewarded(reward)` (+1 hak, +1 ipucu).

### Haritalar (bölüm ilerlemesi)
- Bölümler **haritalara** (dünya) bölünür; her harita temalı bir bölgedir ve sıradaki N bölümü içerir.
  Katalog: `assets/worlds/worlds.json` (`id`, `name`, `theme`, `levels`). Bölüm numaraları globaldir;
  her harita bir öncekinin bittiği yerden devam eder. **Yeni harita = JSON'a bir satır** (+ gerekirse
  `AppColors.worldThemes`'e yeni tema). Testler katalogu ve tema anahtarlarını doğrular.
- Harita ekranı (`/map/:world`): alttan yukarı kıvrılan yol; bitirilen bölümler açılan resmin küçüğü +
  en iyi yıldızlarla, sıradaki bölüm parlayan jöle blok + oyuncu avatarıyla, kilitliler kapalı gösterilir.
  Yolun gidilen kısmı altın renktedir. Tepede harita kupası ve sonraki haritaya geçit; altta önceki harita.
  Paralaks tema arka planı, alt kısımda **Oyna** düğmesi.
- Bir harita, öncekinin son bölümü bitince açılır (ayrı kayıt yok; `unlockedLevel`'dan türetilir).
  Hiç bölümü yayınlanmamış harita "Yakında" görünür.
- Haritanın son bölümü bitince oyun yeni haritaya gider ve **"Yeni harita açıldı!"** kutlaması oynar.
- Haritalar ekranı (`/worlds`): her harita bir kart; ilerleme, yıldız ve bitirilen resimlerden mozaik.
- Bölüm başına en iyi yıldız `SlotData.stars`'ta saklanır.

### Oyuncu slotları
- Açılış ekranında **3 slot**. Her slot ayrı bir oyuncunun ilerlemesidir.
- Boş slot → "Yeni oyun": isim + avatar rengi seçilir.
- Dolu slot: isim, ulaşılan bölüm, ilerleme çubuğu, kalan ipucu. Uzun basınca silme (onaylı).
- Slot verisi: isim, avatar, açılmış en yüksek bölüm, tamamlanan bölümler, kalan ipucu,
  yarım kalan bölümün ızgara durumu ve kalan hakkı.
- Tüm veri **yalnızca cihazda** saklanır. Uygulama silinince silinmesi sorun değildir (bulut yok).
- Slot düzenlemeleri durumu anında günceller ama diske ~600 ms gecikmeyle yazılır
  (`SlotsController.saveDelay`); uygulama arka plana geçince `flush()` ile hemen yazılır.

### Dil
- Diller: Türkçe, İngilizce, Almanca, Fransızca, İspanyolca, İtalyanca, Çince (`core/languages.dart`).
- Varsayılan: cihaz dili; desteklenmiyorsa İngilizce. Ayarlar'dan (dişli ikonu) değiştirilebilir,
  `AppSettings` (`features/settings`) içinde saklanır.
- Bölüm ve harita adları JSON'da dil haritasıdır: `"name": {"tr": "...", "en": "...", ...}`
  (`LocalizedText`). Testler her dilin ARB anahtarlarını ve tüm adların çevirisini doğrular.

### Zorluk eğrisi (200 bölüm)

| Bölümler | Harita | Izgara (satır × sütun) | Not |
|---|---|---|---|
| 1–10 | Gün Batımı Tepeleri | 4×4 → 5×5 | Öğretici, bol tam dolu satır |
| 11–23 | Gün Batımı / Kumsal | 6×6 → 7×7 | Çoklu ipuçları başlar |
| 24–60 | Kumsal, Gece Ormanı | 7×7 → 9×9 | |
| 61–100 | Şeker Diyarı, Altın Çöl | 9×9 → 11×10 | Kılavuz çizgileri (5'lik bloklar) |
| 101–140 | Karlı Zirveler, Mercan Resifi | 11×10 → 13×10 | |
| 141–200 | Volkan, Bulut Kasabası, Yıldız Yolu | 13×10 → 15×10 | |

- **Sütun en fazla 10, satır en fazla 15.** Dikey ekranda genişlik belirleyicidir: 10 sütunda kare
  normal telefonda ~28–29 dp, küçük telefonda (360 dp) ~25 dp; 12 sütunda ~22–24 dp'ye düşer.
  15 satır 10 sütunla rahat sığar.
- 24–200 arası bölümler `tool/level_art.dart` + `tool/art/*.dart` içindeki piksel resimlerden
  `dart run tool/generate_levels.dart` ile üretilir. Üretici boş kenarları kırpar, resim tek çözümlü
  değilse mümkün olan en az hücreyi değiştirerek mantıkla çözülebilir yapar ve her haritadaki
  resimleri boyut + çözücüye göre zorluk sırasıyla numaralar. 1–23 elle yazılmıştır, üretici dokunmaz.
  Yeni resim: ilgili `tool/art/wNN_*.dart` dosyasına ekle (7 dilde ad), üreticiyi çalıştır.

Büyük ızgaralarda pinch-zoom + kaydırma desteklenir; dokunma alanı en az 32 dp kalmalı.

---

## 2. Görsel stil — "janjanlı"

- **Ana renk koyu mavi** (yeşil kullanılmaz). Palet:
  - Blok: `#1E3A8A` (gövde) → `#2563EB` (üst ton), parlama `#93C5FD`, alt gölge `#172554`
  - Tahta: açık krem/beyaz `#F8FAFF`; boş kare `#E6ECF8`; X işareti `#94A3B8`
  - Tamamlanan ipucu kutusu: altın `#FBBF24`; hata: `#EF4444`
  - Arka plan: mor → pembe → turuncu gün batımı gradyanı (bölüm temalarına göre değişir)
- Canlı gradyan arka planlar, yumuşak paralaks bulut/şekiller.
- Bloklar: parlak, jöle görünümlü, yuvarlak köşeli, iç parlama + alt gölge. Dokununca
  "pop" ölçek animasyonu + hafif titreşim (haptic).
- **Satır/sütun tamamlanınca:** satır boyunca ışık dalgası, yıldız parçacıkları, ipucu kutusu yeşile
  dönüp zıplar, kısa ses.
- **Hata:** kare kırmızı yanıp söner, ızgara hafifçe sallanır, kalp kırılma animasyonu.
- **Bölüm sonu:** blokların sırayla dönüp resim renklerine geçmesi, konfeti, ekran parlaması,
  ses + güçlü haptic.
- Animasyonlar 60/120 fps akıcı olmalı; parçacıklar `CustomPainter` ile, widget rebuild'i olmadan.
- Ayarlar: dil ve ses efektleri (müzik ve titreşim aç/kapa ileride).

---

## 3. Teknik yığın

- **Flutter** (güncel stable), **Dart 3** — records, patterns, `sealed` sınıflar, `switch` ifadeleri.
- Platform: Android + iOS, yalnızca portrait (`SystemChrome.setPreferredOrientations`).
- Durum yönetimi: **Riverpod 3** (`Notifier` / `AsyncNotifier`, kod üretimi yok).
- Modeller: elle yazılmış değişmez `final class`'lar (`@immutable`, `copyWith`, `toJson`/`fromJson`).
  Kod üretimi (build_runner) bilinçli olarak kullanılmıyor.
- Yönlendirme: **go_router**.
- Animasyon: `flutter_animate` + özel `CustomPainter` parçacık sistemi.
- Ses: `audioplayers` (kısa efektler önceden yüklenir) + haptic.
- Kalıcılık: `shared_preferences` (`SharedPreferencesAsync`) üzerinde JSON; bir
  `ProgressRepository` arayüzü arkasında.
- Reklam: `AdService` arayüzü → şimdilik `DummyAdService`.
- Font: `google_fonts` (Fredoka). Metinler: `flutter gen-l10n` → `lib/l10n/gen/` (7 dil, şablon `app_tr.arb`).
- Lint: `very_good_analysis`. Test: `flutter_test`.

## 4. Klasör yapısı (feature-first)

```
lib/
  main.dart
  app/                 # App widget, router, tema
  core/                # ortak yardımcılar, ses, haptic, sabitler
  features/
    slots/             # oyuncu slotları ekranı
    level_map/         # haritalar: World/WorldCatalog, MapLayout, harita ve haritalar ekranı
    game/
      domain/          # Puzzle, Clue, CellState, line solver, kurallar (saf Dart, Flutter yok)
      application/     # GameController (Riverpod notifier)
      presentation/    # ızgara, ipucu kutuları, efektler, popup'lar
    ads/               # AdService, DummyAdService
    progress/          # ProgressRepository, SlotData
assets/
  levels/              # level_001.json ... level_200.json
  worlds/              # worlds.json (harita kataloğu)
  audio/  images/
test/
```

## 5. Bölüm veri formatı

`assets/levels/level_NNN.json`:

```json
{
  "id": 1,
  "name": {"tr": "Mantar", "en": "Mushroom", "de": "Pilz", "fr": "Champignon",
           "es": "Seta", "it": "Fungo", "zh": "蘑菇"},
  "rows": 4,
  "cols": 4,
  "solution": [".##.", "####", ".##.", ".##."],
  "colors":   [".RR.", "RWRR", ".BB.", ".BB."],
  "palette":  { "R": "#E8453C", "W": "#FFFFFF", "B": "#F3E1C7" }
}
```

- `solution`: `#` dolu, `.` boş. İpuçları **koddan hesaplanır**, dosyada tutulmaz.
- `colors`: bölüm sonu resmi için her dolu karenin palet anahtarı.
- Yeni bölüm eklenince test, ipuçlarının **tek ve mantıkla çözülebilir** olduğunu doğrular.

## 6. Kodlama kuralları

- Oyun mantığı (`features/game/domain`) saf Dart'tır, Flutter'a bağımlı değildir ve %100 birim testlidir.
- UI'da iş mantığı yok; widget'lar yalnızca provider durumunu okur ve olay gönderir.
- `const` constructor'lar, küçük ve odaklı widget'lar, `build` içinde ağır iş yok.
- Sihirli sayılar yerine tema/sabit dosyaları. Renkler yalnızca `lib/app/theme.dart` içindeki `AppColors`'tan.
- Kod, tanımlayıcılar ve yorumlar **İngilizce**; kullanıcıya görünen metinler `l10n` (ARB) ile,
  şablon dil **Türkçe**; yeni metin 7 ARB dosyasının hepsine eklenir.
- ARB değişince: `flutter gen-l10n`.
- Tarayıcıda dikey önizleme: `flutter build web` + `.claude/launch.json` içindeki "web" sunucusu.
- Commit'ten önce: `dart format .`, `flutter analyze` ve `flutter test` temiz olmalı.
- Her iş bittiğinde yanıtın sonunda, yapılan değişiklikler için hazır bir **commit mesajı** göster
  (İngilizce, kısa başlık + gerekirse madde işaretli açıklama). Kullanıcı istemedikçe commit atma;
  yalnızca mesajı öner.
