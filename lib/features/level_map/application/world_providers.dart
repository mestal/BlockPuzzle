import 'dart:convert';

import 'package:block_puzzle/features/level_map/domain/world.dart';
import 'package:block_puzzle/features/levels/level_repository.dart';
import 'package:block_puzzle/features/progress/slot_data.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const worldCatalogAsset = 'assets/worlds/worlds.json';

/// Reads the world catalog; done once at start-up (see `main.dart`).
Future<WorldCatalog> loadWorldCatalog(AssetBundle bundle) async {
  final json = jsonDecode(await bundle.loadString(worldCatalogAsset));
  return WorldCatalog.fromJson(json as Map<String, Object?>);
}

/// The world catalog. Overridden in `main.dart` with the loaded asset, so
/// screens and the router can read it synchronously.
final worldCatalogProvider = Provider<WorldCatalog>(
  (ref) => throw UnimplementedError('worldCatalogProvider is not loaded'),
);

/// Access of a world for [slot].
WorldAccess accessFor(World world, SlotData slot) => worldAccess(
  world,
  unlockedLevel: slot.unlockedLevel,
  shippedLevels: LevelRepository.levelCount,
);

/// The level [slot] should play next.
int currentLevelOf(SlotData slot) => currentLevel(
  unlockedLevel: slot.unlockedLevel,
  shippedLevels: LevelRepository.levelCount,
);
