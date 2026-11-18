import 'package:flutter/foundation.dart';

/// AdMob ad unit ids.
///
/// Debug and profile builds always use Google's public test units, and so
/// does a release build while its production id below is still empty.
///
/// The AdMob *app* ids live in the platform files:
/// - Android: `android/app/src/main/AndroidManifest.xml`
///   (`com.google.android.gms.ads.APPLICATION_ID`)
/// - iOS: `ios/Runner/Info.plist` (`GADApplicationIdentifier`)
abstract final class AdConfig {
  /// Per-platform switches. Web never shows ads.
  static const androidAdsEnabled = true;
  // TODO(admob): Flip to true once the iOS ids below are filled in.
  static const iosAdsEnabled = false;

  /// Build-wide kill switch: `--dart-define=ADS_ENABLED=false` turns every
  /// ad off regardless of platform.
  static const _masterSwitch = bool.fromEnvironment(
    'ADS_ENABLED',
    defaultValue: true,
  );

  /// Whether ads are shown on the current platform. While false the game
  /// shows no ads, does not start the AdMob SDK and offers no ad rewards
  /// (no extra lives or hints).
  static bool get adsEnabled {
    if (!_masterSwitch || kIsWeb) return false;
    return switch (defaultTargetPlatform) {
      TargetPlatform.android => androidAdsEnabled,
      TargetPlatform.iOS => iosAdsEnabled,
      _ => false,
    };
  }

  static const _androidInterstitial = 'ca-app-pub-2622546463597711/3697612865';
  static const _androidRewarded = 'ca-app-pub-2622546463597711/1755469090';
  // TODO(admob): Production interstitial ad unit id (iOS).
  static const _iosInterstitial = '';
  // TODO(admob): Production rewarded ad unit id (iOS).
  static const _iosRewarded = '';

  // Google's public test units:
  // https://developers.google.com/admob/android/test-ads
  // https://developers.google.com/admob/ios/test-ads
  static const _testAndroidInterstitial =
      'ca-app-pub-3940256099942544/1033173712';
  static const _testAndroidRewarded = 'ca-app-pub-3940256099942544/5224354917';
  static const _testIosInterstitial = 'ca-app-pub-3940256099942544/4411468910';
  static const _testIosRewarded = 'ca-app-pub-3940256099942544/1712485313';

  static bool get _ios => defaultTargetPlatform == TargetPlatform.iOS;

  static String get interstitial => _pick(
    _ios ? _iosInterstitial : _androidInterstitial,
    _ios ? _testIosInterstitial : _testAndroidInterstitial,
  );

  static String get rewarded => _pick(
    _ios ? _iosRewarded : _androidRewarded,
    _ios ? _testIosRewarded : _testAndroidRewarded,
  );

  static String _pick(String production, String test) =>
      kReleaseMode && production.isNotEmpty ? production : test;
}
