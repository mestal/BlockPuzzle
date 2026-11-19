import 'dart:async';
import 'dart:math';

import 'package:block_puzzle/features/ads/ad_config.dart';
import 'package:block_puzzle/features/ads/ad_service.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

/// Google AdMob ads. One interstitial and one rewarded ad are kept preloaded
/// (the interstitial only while [AdConfig.interstitialsEnabled]).
///
/// Never throws: if no ad is ready (offline, no fill, SDK error), the
/// interstitial is skipped and the rewarded ad simply grants nothing. A
/// failed load is retried with a growing delay.
class AdMobAdService implements AdService {
  AdMobAdService();

  InterstitialAd? _interstitial;
  RewardedAd? _rewarded;
  bool _loadingInterstitial = false;
  bool _loadingRewarded = false;
  int _interstitialFailures = 0;
  int _rewardedFailures = 0;
  bool _ready = false;

  /// Starts the SDK and preloads both ads. Safe to call without awaiting.
  Future<void> init() async {
    try {
      await MobileAds.instance.initialize();
      _ready = true;
      _loadInterstitial();
      _loadRewarded();
    } on Object catch (e) {
      debugPrint('AdMob init failed: $e');
    }
  }

  @override
  Future<void> showInterstitial(BuildContext context) async {
    if (!AdConfig.interstitialsEnabled) return;
    final ad = _interstitial;
    if (ad == null) {
      _loadInterstitial();
      return;
    }
    _interstitial = null;
    final closed = Completer<void>();
    void finish(Ad ad) {
      unawaited(ad.dispose());
      if (!closed.isCompleted) closed.complete();
    }

    ad.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: finish,
      onAdFailedToShowFullScreenContent: (ad, _) => finish(ad),
    );
    try {
      await ad.show();
      await closed.future;
    } on Object catch (e) {
      debugPrint('AdMob interstitial failed: $e');
      finish(ad);
    }
    _loadInterstitial();
  }

  @override
  Future<bool> showRewarded(BuildContext context) async {
    final ad = _rewarded;
    if (ad == null) {
      _loadRewarded();
      return false;
    }
    _rewarded = null;
    var earned = false;
    final closed = Completer<void>();
    void finish(Ad ad) {
      unawaited(ad.dispose());
      if (!closed.isCompleted) closed.complete();
    }

    ad.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: finish,
      onAdFailedToShowFullScreenContent: (ad, _) => finish(ad),
    );
    try {
      await ad.show(onUserEarnedReward: (_, _) => earned = true);
      await closed.future;
    } on Object catch (e) {
      debugPrint('AdMob rewarded failed: $e');
      finish(ad);
    }
    _loadRewarded();
    return earned;
  }

  void _loadInterstitial() {
    if (!AdConfig.interstitialsEnabled ||
        !_ready ||
        _interstitial != null ||
        _loadingInterstitial) {
      return;
    }
    _loadingInterstitial = true;
    unawaited(
      InterstitialAd.load(
        adUnitId: AdConfig.interstitial,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            _loadingInterstitial = false;
            _interstitialFailures = 0;
            _interstitial = ad;
          },
          onAdFailedToLoad: (error) {
            _loadingInterstitial = false;
            debugPrint('AdMob interstitial load failed: $error');
            _retry(++_interstitialFailures, _loadInterstitial);
          },
        ),
      ).catchError((Object e) {
        _loadingInterstitial = false;
        debugPrint('AdMob interstitial load failed: $e');
      }),
    );
  }

  void _loadRewarded() {
    if (!_ready || _rewarded != null || _loadingRewarded) return;
    _loadingRewarded = true;
    unawaited(
      RewardedAd.load(
        adUnitId: AdConfig.rewarded,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) {
            _loadingRewarded = false;
            _rewardedFailures = 0;
            _rewarded = ad;
          },
          onAdFailedToLoad: (error) {
            _loadingRewarded = false;
            debugPrint('AdMob rewarded load failed: $error');
            _retry(++_rewardedFailures, _loadRewarded);
          },
        ),
      ).catchError((Object e) {
        _loadingRewarded = false;
        debugPrint('AdMob rewarded load failed: $e');
      }),
    );
  }

  /// 4 s, 8 s, 16 s … capped at 2 minutes.
  static void _retry(int failures, void Function() load) {
    final seconds = min(120, 2 << min(failures, 6));
    Timer(Duration(seconds: seconds), load);
  }
}
