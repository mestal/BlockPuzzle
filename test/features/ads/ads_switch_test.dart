import 'package:block_puzzle/features/ads/ad_config.dart';
import 'package:block_puzzle/features/ads/ad_service.dart';
import 'package:block_puzzle/features/game/presentation/game_dialogs.dart';
import 'package:block_puzzle/l10n/gen/app_localizations.dart';
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

  test('ads are off by default', () {
    expect(AdConfig.adsEnabled, isFalse);
    final container = ProviderContainer();
    addTearDown(container.dispose);
    expect(container.read(adServiceProvider), isA<NoAdService>());
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
