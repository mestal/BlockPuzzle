import 'dart:math';

import 'package:block_puzzle/app/router.dart';
import 'package:block_puzzle/app/theme.dart';
import 'package:block_puzzle/core/widgets/picture_view.dart';
import 'package:block_puzzle/core/widgets/sky_background.dart';
import 'package:block_puzzle/features/level_map/application/world_providers.dart';
import 'package:block_puzzle/features/level_map/domain/world.dart';
import 'package:block_puzzle/features/level_map/presentation/world_scenery.dart';
import 'package:block_puzzle/features/levels/level_repository.dart';
import 'package:block_puzzle/features/progress/slot_data.dart';
import 'package:block_puzzle/features/progress/slots_controller.dart';
import 'package:block_puzzle/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Every world as a card: progress, stars and a mosaic of the pictures the
/// player has revealed there. Locked worlds tease what comes next.
class WorldsScreen extends ConsumerStatefulWidget {
  const WorldsScreen({super.key});

  @override
  ConsumerState<WorldsScreen> createState() => _WorldsScreenState();
}

class _WorldsScreenState extends ConsumerState<WorldsScreen> {
  static const _cardExtent = 236.0;

  ScrollController? _scroll;

  @override
  void dispose() {
    _scroll?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final catalog = ref.watch(worldCatalogProvider);
    final slot = ref.watch(activeSlotProvider);
    if (slot == null) return const Scaffold(body: SkyBackground());
    final here = catalog.worldOf(currentLevelOf(slot));
    final scroll = _scroll ??= ScrollController(
      initialScrollOffset: max(0, (here.index - 1.5) * _cardExtent),
    );

    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: SkyBackground()),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 4, 16, 4),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => context.go(Routes.currentMap),
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          l10n.worldsTitle,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const Icon(Icons.star_rounded, color: AppColors.gold),
                      const SizedBox(width: 2),
                      Text(
                        '${slot.stars.values.fold(0, (a, b) => a + b)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    controller: scroll,
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                    itemExtent: _cardExtent,
                    itemCount: catalog.worlds.length,
                    itemBuilder: (context, i) {
                      final world = catalog.worlds[i];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: _WorldCard(
                          world: world,
                          slot: slot,
                          here: world == here,
                        ),
                      ).animate(delay: (70 * i).ms).fadeIn().slideY(begin: 0.2);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WorldCard extends StatelessWidget {
  const _WorldCard({
    required this.world,
    required this.slot,
    required this.here,
  });

  final World world;
  final SlotData slot;

  /// The player's current world.
  final bool here;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final access = accessFor(world, slot);
    final open = access == WorldAccess.open;
    final done = world.completedIn(slot.completed);

    final card = Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: here ? AppColors.gold : Colors.white54,
          width: here ? 4 : 2,
        ),
        boxShadow: [
          if (here) const BoxShadow(color: AppColors.gold, blurRadius: 18),
        ],
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: WorldBackground(
              palette: AppColors.worldTheme(world.theme),
              animate: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.worldLabel(world.index),
                            style: const TextStyle(color: Colors.white70),
                          ),
                          Text(
                            world.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              height: 1.1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (here) _Tag(label: l10n.youAreHere),
                  ],
                ),
                const Spacer(),
                _Mosaic(world: world, completed: slot.completed),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: LinearProgressIndicator(
                          value: done / world.levelCount,
                          minHeight: 10,
                          color: AppColors.gold,
                          backgroundColor: Colors.white24,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '$done/${world.levelCount}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.star_rounded,
                      color: AppColors.gold,
                      size: 20,
                    ),
                    Text(
                      l10n.starCount(world.starsIn(slot.stars), world.maxStars),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (!open)
            Positioned.fill(
              child: ColoredBox(
                color: AppColors.scrim,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      access == WorldAccess.locked
                          ? Icons.lock_rounded
                          : Icons.hourglass_top_rounded,
                      color: Colors.white,
                      size: 40,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      access == WorldAccess.locked
                          ? l10n.worldLocked
                          : l10n.worldSoon,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );

    return GestureDetector(
      onTap: open ? () => context.go(Routes.map(world.index)) : null,
      child: card,
    );
  }
}

/// One small tile per level: the revealed picture once finished.
class _Mosaic extends ConsumerWidget {
  const _Mosaic({required this.world, required this.completed});

  final World world;
  final Set<int> completed;

  static const _columns = 10;
  static const _gap = 4.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) => LayoutBuilder(
    builder: (context, box) {
      final cell = (box.maxWidth - _gap * (_columns - 1)) / _columns;
      return Wrap(
        spacing: _gap,
        runSpacing: _gap,
        children: [
          for (final level in world.levels)
            Container(
              width: cell,
              height: cell,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: completed.contains(level)
                    ? AppColors.board
                    : Colors.white24,
                borderRadius: BorderRadius.circular(6),
              ),
              child: completed.contains(level)
                  ? switch (ref.watch(puzzleProvider(level)).value) {
                      final puzzle? => Center(
                        child: PictureThumbnail(puzzle: puzzle),
                      ),
                      null => null,
                    }
                  : null,
            ),
        ],
      );
    },
  );
}

class _Tag extends StatelessWidget {
  const _Tag({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      color: AppColors.gold,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text(
      label,
      style: const TextStyle(
        color: AppColors.block,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
