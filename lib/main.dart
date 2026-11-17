import 'dart:async';

import 'package:block_puzzle/app/app.dart';
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
  runApp(
    ProviderScope(
      overrides: [
        worldCatalogProvider.overrideWithValue(worlds),
        initialSettingsProvider.overrideWithValue(settings),
      ],
      child: const BlockPuzzleApp(),
    ),
  );
}
