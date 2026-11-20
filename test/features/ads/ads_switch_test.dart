import 'package:block_puzzle/features/ads/ad_config.dart';
import 'package:block_puzzle/features/ads/ad_service.dart';
import 'package:block_puzzle/features/game/presentation/game_dialogs.dart';
import 'package:block_puzzle/l10n/gen/app_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Future<BuildContext> host(WidgetTester tester) async {
    late BuildContext context;
    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(
          builder: (c) {
            context = c;
            return const SizedBox();
          },
        ),
      ),
    );
    return context;
  }

  test('ads and interstitials are on for Android and iOS only', () {
    addTearDown(() => debugDefaultTargetPlatformOverride = null);
    for (final platform in TargetPlatform.values) {
      debugDefaultTargetPlatformOverride = platform;
      final mobile =
          platform == TargetPlatform.android || platform == TargetPlatform.iOS;
      expect(AdConfig.adsEnabled, mobile, reason: '$platform');
      expect(AdConfig.interstitialsEnabled, mobile, reason: '$platform');
    }
  });

  test('ads are off on desktop', () {
    debugDefaultTargetPlatformOverride = TargetPlatform.macOS;
    addTearDown(() => debugDefaultTargetPlatformOverride = null);
    final container = ProviderContainer();
    addTearDown(container.dispose);
    expect(container.read(adServiceProvider), isA<NoAdService>());
  });

  test('interstitials get more frequent as levels go on', () {
    List<int> shown(int from, int to) => [
      for (var level = from; level <= to; level++)
        if (AdConfig.interstitialAfterLevel(level)) level,
    ];
    expect(shown(1, 30), [for (var l = 3; l <= 30; l += 3) l]);
    expect(shown(31, 100), [for (var l = 32; l <= 100; l += 2) l]);
    expect(shown(101, 500), [for (var l = 101; l <= 500; l++) l]);
  });

  test('ads switched on use the placeholder ads', () {
    final container = ProviderContainer(
      overrides: [adsEnabledProvider.overrideWithValue(true)],
    );
    addTearDown(container.dispose);
    expect(container.read(adServiceProvider), isA<DummyAdService>());
  });

  testWidgets('NoAdService grants no reward', (tester) async {
    final context = await host(tester);
    expect(await const NoAdService().showRewarded(context), isFalse);
  });

  testWidgets('out of lives without ads offers no extra life', (
    tester,
  ) async {
    final context = await host(tester);
    final choice = showOutOfLivesDialog(context, offerAd: false);
    await tester.pumpAndSettle();
    expect(find.text('Watch ad: +1 life'), findsNothing);
    expect(find.text('Start over'), findsOneWidget);
    await tester.tap(find.text('Start over'));
    await tester.pumpAndSettle();
    expect(await choice, OutOfLivesChoice.restart);
  });

  testWidgets('out of lives with ads offers an extra life', (tester) async {
    final context = await host(tester);
    final choice = showOutOfLivesDialog(context, offerAd: true);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Watch ad: +1 life'));
    await tester.pumpAndSettle();
    expect(await choice, OutOfLivesChoice.watchAd);
  });

  testWidgets('no hints without ads only says so', (tester) async {
    final context = await host(tester);
    final watch = showNoHintsDialog(context, offerAd: false);
    await tester.pumpAndSettle();
    expect(find.text('Watch ad: +1 hint'), findsNothing);
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    expect(await watch, isFalse);
  });
}
