import 'package:block_puzzle/app/theme.dart';
import 'package:block_puzzle/core/widgets/picture_view.dart';
import 'package:block_puzzle/core/widgets/sky_background.dart';
import 'package:block_puzzle/features/levels/level_repository.dart';
import 'package:block_puzzle/features/progress/slots_controller.dart';
import 'package:block_puzzle/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Level selection for the active player.
class LevelMapScreen extends ConsumerWidget {
  const LevelMapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final slot = ref.watch(activeSlotProvider);
    if (slot == null) return const Scaffold(body: SkyBackground());

    const shipped = LevelRepository.levelCount;
    const remaining = LevelRepository.plannedLevelCount - shipped;

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
                        onPressed: () => context.go('/'),
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          slot.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.lightbulb_rounded,
                        color: AppColors.gold,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${slot.hints}',
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
                  child: GridView.builder(
                    padding: const EdgeInsets.all(20),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                        ),
                    itemCount: shipped + 1,
                    itemBuilder: (context, i) {
                      if (i == shipped) {
                        return _ComingSoonTile(
                          label: l10n.comingSoon(remaining),
                        );
                      }
                      final level = i + 1;
                      return _LevelTile(
                            level: level,
                            completed: slot.completed.contains(level),
                            unlocked: level <= slot.unlockedLevel,
                            current: level == slot.unlockedLevel,
                          )
                          .animate(delay: (60 * i).ms)
                          .fadeIn()
                          .scale(
                            begin: const Offset(0.7, 0.7),
                            curve: Curves.easeOutBack,
                          );
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

class _LevelTile extends ConsumerWidget {
  const _LevelTile({
    required this.level,
    required this.completed,
    required this.unlocked,
    required this.current,
  });

  final int level;
  final bool completed;
  final bool unlocked;
  final bool current;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final puzzle = completed ? ref.watch(puzzleProvider(level)).value : null;

    Widget tile = Material(
      color: unlocked ? AppColors.board : Colors.white24,
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: unlocked ? () => context.go('/play/$level') : null,
        child: Center(
          child: puzzle != null
              ? Padding(
                  padding: const EdgeInsets.all(14),
                  child: FittedBox(child: PictureView(puzzle: puzzle)),
                )
              : unlocked
              ? Text(
                  '$level',
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: AppColors.block,
                  ),
                )
              : const Icon(Icons.lock_rounded, color: Colors.white70, size: 32),
        ),
      ),
    );

    if (current && !completed) {
      tile =
          DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.gold,
                      blurRadius: 18,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: tile,
              )
              .animate(onPlay: (c) => c.repeat(reverse: true))
              .scaleXY(end: 1.06, duration: 800.ms, curve: Curves.easeInOut);
    }
    return tile;
  }
}

class _ComingSoonTile extends StatelessWidget {
  const _ComingSoonTile({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      color: Colors.white12,
      borderRadius: BorderRadius.circular(22),
      border: Border.all(color: Colors.white38, width: 2),
    ),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}
