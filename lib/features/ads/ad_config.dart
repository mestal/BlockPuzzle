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
  // TODO(admob): Production interstitial ad unit id (Android).
  static const _androidInterstitial = '';
  // TODO(admob): Production rewarded ad unit id (Android).
  static const _androidRewarded = '';
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
