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
| Tek dokunma | Kareye **X** |
| Tek dokunup basılı tutarak sürükleme | Geçilen karelere **X** |
| Çift dokunma | Kareyi **doldur** |
| Çift dokunup ikinci dokunuşta basılı tutarak sürükleme | Geçilen kareleri **doldur** |

- Tek dokunma, çift dokunma olup olmadığını anlamak için ~250 ms bekler (`kDoubleTapTimeout`);
  bu sürede karede hafif bir "basıldı" vurgusu gösterilir ki gecikme hissedilmesin.
- Sürükleme ilk hareket yönüne (yatay/dikey) kilitlenir; tek satır veya sütun boyunca ilerler.
- Sürüklemede zaten açılmış (dolu veya X) kareler atlanır, hiçbir şey olmaz.
- Jestler keşfedilmesi zor olduğundan **Bölüm 1 el animasyonlu bir öğretici** içerir
  (önce tek dokunuş = X, sonra çift dokunuş = doldur).

### Doğru / yanlış nasıl anlaşılır
Her bölümün çözümü (`solution`) oyunda kayıtlıdır; her hamle **anında** bununla karşılaştırılır:

| Oyuncunun hamlesi | Çözümde kare dolu | Çözümde kare boş |
|---|---|---|
| Doldur | ✅ Doğru, kare dolar | ❌ Yanlış |
| X koy | ❌ Yanlış | ✅ Doğru, X konur |

- Yanlış hamlede kare **doğru durumuna** otomatik çevrilir (kırmızı yanıp sönme + sallanma),
  oyuncu **1 hak** kaybeder.
- Sürükleme yanlış bir kareye gelirse o kare için 1 hak gider ve **sürükleme orada durur**
  (tek hamlede birden fazla hak kaybedilmez).
- Bir satır veya sütunun tüm dolu kareleri bulununca kalan boş kareler otomatik **X** ile işaretlenir,
  ipucu kutusu altına döner ve **satır/sütun kutlaması** oynar.
- X'ler kaynağına göre farklı renkte çizilir (`MarkSource` enum'u: `user`, `auto`, `mistake`):

  | X türü | Renk | Görünüm |
  |---|---|---|
  | Oyuncunun kendi koyduğu X | `#1E3A8A` koyu mavi | kalın, net |
  | Satır/sütun tamamlanınca otomatik X | `#94A3B8` soluk gri-mavi | ince, dalgayla sırayla belirir |
  | Yanlış hamle sonrası düzeltilen X | `#EF4444` kırmızı | kırmızı kalır, hatanın yeri görünsün |

  Otomatik X konmuş bir kareye oyuncu sonradan dokunursa hiçbir şey olmaz (kare zaten çözülmüş).

### Haklar (can)
- Her bölüm **3 hak** ile başlar (kalp ikonları).
- 3 hak bitince "Hakların bitti" popup'ı: **Reklam izle → +1 hak** (bölüm kaldığı yerden devam eder)
  veya **Bölümü yeniden başlat**.

### İpucu (hint)
- Oyuncu profili başına **toplam 5 ipucu** ile başlanır; bölümler arasında taşınır ve kaydedilir.
- İpucu: henüz çözülmemiş, doğru (dolu) bir kareyi parlatarak açar.
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

### Oyuncu slotları
- Açılış ekranında **3 slot**. Her slot ayrı bir oyuncunun ilerlemesidir.
- Boş slot → "Yeni oyun": isim + avatar rengi seçilir.
- Dolu slot: isim, ulaşılan bölüm, ilerleme çubuğu, kalan ipucu. Uzun basınca silme (onaylı).
- Slot verisi: isim, avatar, açılmış en yüksek bölüm, tamamlanan bölümler, kalan ipucu,
  yarım kalan bölümün ızgara durumu ve kalan hakkı.
- Tüm veri **yalnızca cihazda** saklanır. Uygulama silinince silinmesi sorun değildir (bulut yok).

### Zorluk eğrisi (200 bölüm)

| Bölümler | Izgara | Not |
|---|---|---|
| 1–10 | 4×4 → 5×5 | Öğretici, bol tam dolu satır |
| 11–30 | 5×5 → 6×6 | Çoklu ipuçları başlar |
| 31–60 | 7×7 → 8×8 | |
| 61–100 | 10×10 | Kılavuz çizgileri (5'lik bloklar) |
| 101–150 | 12×12 → 13×15 | |
| 151–200 | 15×15 → 15×20 | Dikey ekrana sığmak için genişlik en fazla 15 |

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
- Ayarlar: ses, müzik, titreşim aç/kapa.

---

## 3. Teknik yığın

- **Flutter** (güncel stable), **Dart 3** — records, patterns, `sealed` sınıflar, `switch` ifadeleri.
- Platform: Android + iOS, yalnızca portrait (`SystemChrome.setPreferredOrientations`).
- Durum yönetimi: **Riverpod 3** (`Notifier` / `AsyncNotifier`, kod üretimi yok).
- Modeller: elle yazılmış değişmez `final class`'lar (`@immutable`, `copyWith`, `toJson`/`fromJson`).
  Kod üretimi (build_runner) bilinçli olarak kullanılmıyor.
- Yönlendirme: **go_router**.
- Animasyon: `flutter_animate` + özel `CustomPainter` parçacık sistemi.
- Ses: henüz yok; eklenecekse `audioplayers` (kısa efektler önceden yüklenir). Şimdilik haptic.
- Kalıcılık: `shared_preferences` (`SharedPreferencesAsync`) üzerinde JSON; bir
  `ProgressRepository` arayüzü arkasında.
- Reklam: `AdService` arayüzü → şimdilik `DummyAdService`.
- Font: `google_fonts` (Fredoka). Metinler: `flutter gen-l10n` → `lib/l10n/gen/`.
- Lint: `very_good_analysis`. Test: `flutter_test`.

## 4. Klasör yapısı (feature-first)

```
lib/
  main.dart
  app/                 # App widget, router, tema
  core/                # ortak yardımcılar, ses, haptic, sabitler
  features/
    slots/             # oyuncu slotları ekranı
    level_map/         # bölüm seçim/ilerleme ekranı
    game/
      domain/          # Puzzle, Clue, CellState, line solver, kurallar (saf Dart, Flutter yok)
      application/     # GameController (Riverpod notifier)
      presentation/    # ızgara, ipucu kutuları, efektler, popup'lar
    ads/               # AdService, DummyAdService
    progress/          # ProgressRepository, SlotData
assets/
  levels/              # level_001.json ... level_200.json
  audio/  images/
test/
```

## 5. Bölüm veri formatı

`assets/levels/level_NNN.json`:

```json
{
  "id": 1,
  "name": "Mantar",
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
  varsayılan dil **Türkçe**.
- ARB değişince: `flutter gen-l10n`.
- Tarayıcıda dikey önizleme: `flutter build web` + `.claude/launch.json` içindeki "web" sunucusu.
- Commit'ten önce: `dart format .`, `flutter analyze` ve `flutter test` temiz olmalı.
