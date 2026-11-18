import 'dart:async';

import 'package:block_puzzle/app/app.dart';
import 'package:block_puzzle/features/ads/ad_config.dart';
import 'package:block_puzzle/features/ads/ad_service.dart';
import 'package:block_puzzle/features/ads/admob_ad_service.dart';
import 'package:block_puzzle/features/level_map/application/world_providers.dart';
import 'package:block_puzzle/features/settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
  );
  final (worlds, settings) = await (
    loadWorldCatalog(rootBundle),
    SharedPrefsSettingsRepository().load(),
  ).wait;
  // AdMob runs only on platforms where ads are switched on (never on web).
  final ads = AdConfig.adsEnabled ? AdMobAdService() : null;
  if (ads != null) unawaited(ads.init());
  runApp(
    ProviderScope(
      overrides: [
        worldCatalogProvider.overrideWithValue(worlds),
        initialSettingsProvider.overrideWithValue(settings),
        if (ads != null) adServiceProvider.overrideWithValue(ads),
      ],
      child: const BlockPuzzleApp(),
    ),
  );
}
