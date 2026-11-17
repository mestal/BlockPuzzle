import 'dart:async';
import 'dart:math';

import 'package:block_puzzle/app/localized.dart';
import 'package:block_puzzle/app/router.dart';
import 'package:block_puzzle/app/theme.dart';
import 'package:block_puzzle/core/widgets/particles.dart';
import 'package:block_puzzle/features/level_map/application/world_providers.dart';
import 'package:block_puzzle/features/level_map/domain/map_layout.dart';
import 'package:block_puzzle/features/level_map/domain/world.dart';
import 'package:block_puzzle/features/level_map/presentation/level_node.dart';
import 'package:block_puzzle/features/level_map/presentation/map_path_painter.dart';
import 'package:block_puzzle/features/level_map/presentation/world_scenery.dart';
import 'package:block_puzzle/features/levels/level_repository.dart';
import 'package:block_puzzle/features/progress/slot_data.dart';
import 'package:block_puzzle/features/progress/slots_controller.dart';
import 'package:block_puzzle/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// A world's level journey: a winding road climbing from the start sign at
/// the bottom, through every level, to the world's trophy at the top.
class WorldMapScreen extends ConsumerStatefulWidget {
  const WorldMapScreen({
    required this.worldIndex,
    this.intro = false,
    super.key,
  });

  final int worldIndex;

  /// Plays the "new map unlocked" celebration on open.
  final bool intro;

  @override
  ConsumerState<WorldMapScreen> createState() => _WorldMapScreenState();
}

class _WorldMapScreenState extends ConsumerState<WorldMapScreen> {
  final _particles = ParticleController();
  ScrollController? _scroll;
  late bool _showIntro = widget.intro;

  @override
  void initState() {
    super.initState();
    if (_showIntro) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _celebrate());
    }
  }

  @override
  void dispose() {
    _scroll?.dispose();
    super.dispose();
  }

  /// Created on first layout so the map opens centred on the player.
  ScrollController _scrollFor(MapLayout layout, int focus, double viewport) =>
      _scroll ??= ScrollController(
        initialScrollOffset: min(
          layout.offsetFor(focus, viewport),
          max(0, layout.height - viewport),
        ),
      );

  void _celebrate() {
    if (!mounted) return;
    unawaited(HapticFeedback.heavyImpact());
    final size = MediaQuery.sizeOf(context);
    final random = Random();
    for (var i = 0; i < 5; i++) {
      Timer(Duration(milliseconds: 250 + i * 200), () {
        if (!mounted) return;
        _particles.burst(
          Offset(
            size.width * (0.15 + random.nextDouble() * 0.7),
            size.height * (0.25 + random.nextDouble() * 0.25),
          ),
          count: 36,
          colors: AppColors.confetti,
          shape: ParticleShape.confetti,
          speed: 360,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final catalog = ref.watch(worldCatalogProvider);
    final slot = ref.watch(activeSlotProvider);
    final world = catalog.byIndex(widget.worldIndex);
    if (slot == null || world == null) return const Scaffold();
    final palette = AppColors.worldTheme(world.theme);
    final current = currentLevelOf(slot);
    final playable = !slot.completed.contains(current);

    return Scaffold(
      body: Stack(
        children: [
          LayoutBuilder(
            builder: (context, box) {
              final layout = MapLayout(
                count: world.levelCount,
                width: box.maxWidth,
              );
              final focus = (current - world.firstLevel).clamp(
                0,
                world.levelCount - 1,
              );
              final scroll = _scrollFor(layout, focus, box.maxHeight);
              return Stack(
                children: [
                  Positioned.fill(
                    child: WorldBackground(palette: palette, scroll: scroll),
                  ),
                  SingleChildScrollView(
                    controller: scroll,
                    reverse: true,
                    child: _MapCanvas(
                      world: world,
                      layout: layout,
                      slot: slot,
                      next: catalog.after(world),
                      previous: catalog.before(world),
                    ),
                  ),
                ],
              );
            },
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: _TopBar(world: world, slot: slot),
            ),
          ),
          if (playable)
            SafeArea(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: _PlayButton(level: current),
                ),
              ),
            ),
          if (_showIntro)
            Positioned.fill(
              child: _WorldIntro(
                world: world,
                onDone: () => setState(() => _showIntro = false),
              ),
            ),
          Positioned.fill(
            child: IgnorePointer(child: ParticleLayer(controller: _particles)),
          ),
        ],
      ),
    );
  }
}

/// Everything that scrolls: road, nodes, start sign and goal.
class _MapCanvas extends StatelessWidget {
  const _MapCanvas({
    required this.world,
    required this.layout,
    required this.slot,
    required this.next,
    required this.previous,
  });

  final World world;
  final MapLayout layout;
  final SlotData slot;
  final World? next;
  final World? previous;

  Offset _at(MapPoint p) => Offset(p.x, p.y);

  @override
  Widget build(BuildContext context) {
    final current = currentLevelOf(slot);
    // Path points: start, one per level, goal. The road is travelled up to
    // the player's highest unlocked level (or the goal when it's finished).
    final reached = (slot.unlockedLevel - world.firstLevel + 1).clamp(
      0,
      world.levelCount + 1,
    );
    final finished = slot.unlockedLevel > world.lastLevel;

    return SizedBox(
      width: layout.width,
      height: layout.height,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: MapPathPainter(
                points: layout.pathPoints.map(_at).toList(),
                reached: reached,
              ),
            ),
          ),
          _centredAt(
            layout.start,
            _StartSign(previous: previous),
            width: 220,
            height: 56,
          ),
          _centredAt(
            layout.goal,
            _Goal(finished: finished),
            width: 120,
            height: 120,
          ),
          Positioned(
            left: 24,
            right: 24,
            top: layout.goal.y - 120,
            child: _NextWorldCard(world: world, next: next, slot: slot),
          ),
          for (final (i, level) in world.levels.indexed)
            _node(context, i, level),
          if (world.contains(current))
            _centredAt(
              layout.node(current - world.firstLevel),
              _AvatarPin(slot: slot),
              width: 56,
              height: 64,
              dy: -(LevelNode.currentSize / 2 + 38),
            ),
        ],
      ),
    );
  }

  Widget _node(BuildContext context, int i, int level) {
    // Linear progress: every unlocked, unfinished level is the current one.
    final kind = slot.completed.contains(level)
        ? NodeKind.done
        : level > LevelRepository.levelCount
        ? NodeKind.soon
        : level <= slot.unlockedLevel
        ? NodeKind.current
        : NodeKind.locked;
    final open = kind == NodeKind.done || kind == NodeKind.current;
    final box = kind == NodeKind.current
        ? LevelNode.currentSize
        : LevelNode.size;
    return _centredAt(
      layout.node(i),
      LevelNode(
            level: level,
            kind: kind,
            stars: slot.stars[level] ?? 0,
            onTap: open ? () => context.go(Routes.play(level)) : null,
          )
          .animate(delay: (40 * i).ms)
          .fadeIn(duration: 300.ms)
          .scaleXY(begin: 0.6, curve: Curves.easeOutBack),
      width: box,
      height: box,
    );
  }

  static Widget _centredAt(
    MapPoint p,
    Widget child, {
    required double width,
    required double height,
    double dy = 0,
  }) => Positioned(
    left: p.x - width / 2,
    top: p.y - height / 2 + dy,
    width: width,
    height: height,
    child: Center(child: child),
  );
}

class _TopBar extends StatelessWidget {
  const _TopBar({required this.world, required this.slot});

  final World world;
  final SlotData slot;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 12, 0),
      child: Row(
        children: [
          IconButton(
            onPressed: () => context.go(Routes.slots),
            icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          ),
          Expanded(
            child: _Glass(
              onTap: () => context.go(Routes.worlds),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          l10n.worldLabel(world.index),
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                            height: 1.1,
                          ),
                        ),
                        Text(
                          world.name.localized(context),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            height: 1.1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.map_rounded, color: Colors.white),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          _Glass(
            child: Row(
              children: [
                const Icon(Icons.star_rounded, color: AppColors.gold),
                const SizedBox(width: 2),
                Text(
                  l10n.starCount(world.starsIn(slot.stars), world.maxStars),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(Icons.lightbulb_rounded, color: AppColors.gold),
                Text(
                  '${slot.hints}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
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

/// Frosted pill used by the top bar.
class _Glass extends StatelessWidget {
  const _Glass({required this.child, this.onTap});

  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Material(
    color: Colors.white24,
    borderRadius: BorderRadius.circular(20),
    child: InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        alignment: Alignment.center,
        child: child,
      ),
    ),
  );
}

/// The player's avatar bobbing above the level they are on.
class _AvatarPin extends StatelessWidget {
  const _AvatarPin({required this.slot});

  final SlotData slot;

  @override
  Widget build(BuildContext context) {
    final color = AppColors.avatars[slot.colorIndex % AppColors.avatars.length];
    return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 46,
              height: 46,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3),
                boxShadow: const [
                  BoxShadow(color: AppColors.blockShadow, offset: Offset(0, 3)),
                ],
              ),
              child: Text(
                slot.name.characters.first.toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            CustomPaint(
              size: const Size(16, 10),
              painter: _PointerPainter(),
            ),
          ],
        )
        .animate(onPlay: (c) => c.repeat(reverse: true))
        .moveY(end: -8, duration: 600.ms, curve: Curves.easeInOut);
  }
}

class _PointerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) => canvas.drawPath(
    Path()
      ..lineTo(size.width, 0)
      ..lineTo(size.width / 2, size.height)
      ..close(),
    Paint()..color = Colors.white,
  );

  @override
  bool shouldRepaint(_PointerPainter old) => false;
}

/// The trophy at the top of the road; turns gold when the world is done.
class _Goal extends StatelessWidget {
  const _Goal({required this.finished});

  final bool finished;

  @override
  Widget build(BuildContext context) {
    final trophy = Container(
      width: 104,
      height: 104,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: finished
            ? const RadialGradient(colors: [AppColors.gold, AppColors.goldDeep])
            : null,
        color: finished ? null : AppColors.lockedNode,
        border: Border.all(color: Colors.white, width: 4),
        boxShadow: finished
            ? const [BoxShadow(color: AppColors.gold, blurRadius: 28)]
            : null,
      ),
      child: Icon(
        Icons.emoji_events_rounded,
        size: 58,
        color: finished ? Colors.white : Colors.white54,
      ),
    );
    if (!finished) return trophy;
    return trophy
        .animate(onPlay: (c) => c.repeat())
        .shimmer(duration: 1800.ms, delay: 1200.ms);
  }
}

/// Sits at the start of the road: a flag on the first world, a way back to
/// the previous world on the others.
class _StartSign extends StatelessWidget {
  const _StartSign({required this.previous});

  final World? previous;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final prev = previous;
    return _Glass(
      onTap: prev == null ? null : () => context.go(Routes.map(prev.index)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            prev == null ? Icons.flag_rounded : Icons.arrow_downward_rounded,
            color: Colors.white,
          ),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              prev?.name.localized(context) ?? l10n.mapStart,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Above the trophy: where the road leads next.
class _NextWorldCard extends StatelessWidget {
  const _NextWorldCard({
    required this.world,
    required this.next,
    required this.slot,
  });

  final World world;
  final World? next;
  final SlotData slot;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final nextWorld = next;
    final finished = slot.unlockedLevel > world.lastLevel;
    final access = nextWorld == null ? null : accessFor(nextWorld, slot);

    final (icon, text, onTap) = switch (access) {
      null when finished => (
        Icons.celebration_rounded,
        l10n.worldComplete,
        null,
      ),
      null => (Icons.emoji_events_rounded, l10n.worldSoon, null),
      WorldAccess.open => (
        Icons.arrow_upward_rounded,
        l10n.nextWorld(nextWorld!.name.localized(context)),
        () => context.go(Routes.map(nextWorld.index)),
      ),
      WorldAccess.comingSoon => (
        Icons.hourglass_top_rounded,
        l10n.nextWorldSoon(nextWorld!.name.localized(context)),
        null,
      ),
      WorldAccess.locked => (
        Icons.lock_rounded,
        l10n.nextWorldLocked(nextWorld!.name.localized(context)),
        null,
      ),
    };
    return Center(
      child: _Glass(
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppColors.gold),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({required this.level});

  final int level;

  @override
  Widget build(BuildContext context) =>
      FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.gold,
              foregroundColor: AppColors.block,
              minimumSize: const Size(240, 60),
              elevation: 6,
              shadowColor: AppColors.blockShadow,
            ),
            onPressed: () => context.go(Routes.play(level)),
            icon: const Icon(Icons.play_arrow_rounded, size: 32),
            label: Text(AppLocalizations.of(context).playLevel(level)),
          )
          .animate(onPlay: (c) => c.repeat(reverse: true))
          .scaleXY(end: 1.05, duration: 900.ms, curve: Curves.easeInOut);
}

/// Full-screen "new map unlocked" banner; tap or wait to dismiss.
class _WorldIntro extends StatefulWidget {
  const _WorldIntro({required this.world, required this.onDone});

  final World world;
  final VoidCallback onDone;

  @override
  State<_WorldIntro> createState() => _WorldIntroState();
}

class _WorldIntroState extends State<_WorldIntro> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(milliseconds: 3200), widget.onDone);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final palette = AppColors.worldTheme(widget.world.theme);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onDone,
      child: ColoredBox(
        color: AppColors.scrim,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                    l10n.worldUnlocked,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.gold,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 300.ms)
                  .slideY(begin: -0.6, curve: Curves.easeOutBack),
              const SizedBox(height: 20),
              Container(
                    width: 280,
                    height: 180,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(color: Colors.white, width: 4),
                      boxShadow: const [
                        BoxShadow(color: AppColors.gold, blurRadius: 30),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: WorldBackground(palette: palette),
                        ),
                        Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                l10n.worldLabel(widget.world.index),
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                widget.world.name.localized(context),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                  .animate()
                  .scale(
                    begin: const Offset(0.2, 0.2),
                    duration: 700.ms,
                    curve: Curves.elasticOut,
                  )
                  .then(delay: 300.ms)
                  .shimmer(duration: 900.ms),
              const SizedBox(height: 24),
              Text(
                l10n.tapToContinue,
                style: const TextStyle(color: Colors.white70),
              ).animate(delay: 900.ms).fadeIn(),
            ],
          ),
        ),
      ),
    ).animate().fadeIn(duration: 250.ms);
  }
}
