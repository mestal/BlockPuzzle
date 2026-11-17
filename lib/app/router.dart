import 'package:block_puzzle/features/game/presentation/game_screen.dart';
import 'package:block_puzzle/features/level_map/application/world_providers.dart';
import 'package:block_puzzle/features/level_map/domain/world.dart';
import 'package:block_puzzle/features/level_map/presentation/world_map_screen.dart';
import 'package:block_puzzle/features/level_map/presentation/worlds_screen.dart';
import 'package:block_puzzle/features/levels/level_repository.dart';
import 'package:block_puzzle/features/progress/slots_controller.dart';
import 'package:block_puzzle/features/slots/presentation/slots_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Every location in the app, so screens never build paths by hand.
abstract final class Routes {
  static const slots = '/';
  static const worlds = '/worlds';

  /// The map of the world the player is currently in.
  static const currentMap = '/map';

  /// The map of world [index]. [intro] plays the "new map unlocked" show.
  static String map(int index, {bool intro = false}) =>
      '/map/$index${intro ? '?intro=1' : ''}';

  static String play(int level) => '/play/$level';
}

final routerProvider = Provider<GoRouter>((ref) {
  final catalog = ref.read(worldCatalogProvider);
  return GoRouter(
    redirect: (context, state) {
      final slot = ref.read(activeSlotProvider);
      final location = state.matchedLocation;
      if (location == Routes.slots) return null;
      if (slot == null) return Routes.slots;

      if (location == Routes.currentMap) {
        return Routes.map(catalog.worldOf(currentLevelOf(slot)).index);
      }
      final worldIndex = int.tryParse(state.pathParameters['world'] ?? '');
      if (location.startsWith('/map/')) {
        final world = worldIndex == null ? null : catalog.byIndex(worldIndex);
        if (world == null || accessFor(world, slot) != WorldAccess.open) {
          return Routes.worlds;
        }
      }
      final id = int.tryParse(state.pathParameters['id'] ?? '');
      if (id != null &&
          (id < 1 ||
              id > LevelRepository.levelCount ||
              id > slot.unlockedLevel)) {
        return Routes.currentMap;
      }
      return null;
    },
    routes: [
      GoRoute(path: Routes.slots, builder: (_, _) => const SlotsScreen()),
      GoRoute(
        path: Routes.worlds,
        pageBuilder: (_, state) => _fade(state, const WorldsScreen()),
      ),
      // Only redirects (see above); needs a route to be matched at all.
      GoRoute(
        path: Routes.currentMap,
        builder: (_, _) => const SizedBox.shrink(),
      ),
      GoRoute(
        path: '/map/:world',
        pageBuilder: (_, state) => _fade(
          state,
          WorldMapScreen(
            worldIndex: int.parse(state.pathParameters['world']!),
            intro: state.uri.queryParameters['intro'] == '1',
          ),
        ),
      ),
      GoRoute(
        path: '/play/:id',
        pageBuilder: (_, state) => _fade(
          state,
          GameScreen(levelId: int.parse(state.pathParameters['id']!)),
        ),
      ),
    ],
  );
});

CustomTransitionPage<void> _fade(GoRouterState state, Widget child) =>
    CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (_, animation, _, child) => FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          scale: Tween<double>(begin: 1.04, end: 1).animate(animation),
          child: child,
        ),
      ),
    );
