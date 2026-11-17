import 'package:block_puzzle/features/game/presentation/game_screen.dart';
import 'package:block_puzzle/features/level_map/presentation/level_map_screen.dart';
import 'package:block_puzzle/features/levels/level_repository.dart';
import 'package:block_puzzle/features/progress/slots_controller.dart';
import 'package:block_puzzle/features/slots/presentation/slots_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    redirect: (context, state) {
      final slot = ref.read(activeSlotProvider);
      if (state.matchedLocation == '/') return null;
      if (slot == null) return '/';
      final id = int.tryParse(state.pathParameters['id'] ?? '');
      if (id != null &&
          (id < 1 ||
              id > LevelRepository.levelCount ||
              id > slot.unlockedLevel)) {
        return '/levels';
      }
      return null;
    },
    routes: [
      GoRoute(path: '/', builder: (_, _) => const SlotsScreen()),
      GoRoute(
        path: '/levels',
        pageBuilder: (_, state) => _fade(state, const LevelMapScreen()),
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
