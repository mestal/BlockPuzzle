import 'dart:async';
import 'dart:math';

import 'package:block_puzzle/app/localized.dart';
import 'package:block_puzzle/app/router.dart';
import 'package:block_puzzle/app/theme.dart';
import 'package:block_puzzle/core/widgets/particles.dart';
import 'package:block_puzzle/core/widgets/sky_background.dart';
import 'package:block_puzzle/features/ads/ad_service.dart';
import 'package:block_puzzle/features/game/application/game_controller.dart';
import 'package:block_puzzle/features/game/domain/puzzle.dart';
import 'package:block_puzzle/features/game/domain/scoring.dart';
import 'package:block_puzzle/features/game/domain/tutorial.dart';
import 'package:block_puzzle/features/game/presentation/board_view.dart';
import 'package:block_puzzle/features/game/presentation/game_dialogs.dart';
import 'package:block_puzzle/features/game/presentation/hint_card.dart';
import 'package:block_puzzle/features/game/presentation/tutorial_overlay.dart';
import 'package:block_puzzle/features/level_map/application/world_providers.dart';
import 'package:block_puzzle/features/levels/level_repository.dart';
import 'package:block_puzzle/features/progress/slots_controller.dart';
import 'package:block_puzzle/features/settings/presentation/settings_sheet.dart';
import 'package:block_puzzle/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class GameScreen extends ConsumerWidget {
  const GameScreen({required this.levelId, super.key});

  final int levelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final puzzle = ref.watch(puzzleProvider(levelId));
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: SkyBackground()),
          switch (puzzle) {
            AsyncData(:final value) => _GamePlay(
              key: ValueKey(value.id),
              puzzle: value,
            ),
            AsyncError() => Center(
              child: TextButton(
                onPressed: () => context.go(Routes.currentMap),
                child: Text(AppLocalizations.of(context).backToLevels),
              ),
            ),
            _ => const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          },
        ],
      ),
    );
  }
}

class _GamePlay extends ConsumerStatefulWidget {
  const _GamePlay({required this.puzzle, super.key});

  final Puzzle puzzle;

  @override
  ConsumerState<_GamePlay> createState() => _GamePlayState();
}

class _GamePlayState extends ConsumerState<_GamePlay>
    with SingleTickerProviderStateMixin {
  final _particles = ParticleController();
  late final _shake = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 420),
  );

  Puzzle get _puzzle => widget.puzzle;

  /// The guided steps of this level (levels 1-2), if any.
  late final _tutorial = Tutorial.forLevel(_puzzle.id);

  /// Text-only tutorial steps the player has closed.
  final _acknowledged = <int>{};

  @override
  void initState() {
    super.initState();
    // A level saved with no lives left asks again on resume.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = ref.read(gameControllerProvider(_puzzle));
      if (state.status == GameStatus.outOfLives) unawaited(_onOutOfLives());
    });
  }

  @override
  void dispose() {
    _shake.dispose();
    super.dispose();
  }

  GameController get _game =>
      ref.read(gameControllerProvider(_puzzle).notifier);

  void _onState(GameState? previous, GameState next) {
    final fx = next.fx;
    if (fx == null || fx.seq == previous?.fx?.seq) return;
    if (fx.mistake) {
      unawaited(HapticFeedback.heavyImpact());
      unawaited(_shake.forward(from: 0));
    }
    if (next.status == GameStatus.outOfLives &&
        previous?.status != GameStatus.outOfLives) {
      unawaited(
        Future<void>.delayed(const Duration(milliseconds: 600), _onOutOfLives),
      );
    }
    if (fx.solved) unawaited(_onWin());
  }

  Future<void> _onOutOfLives() async {
    if (!mounted) return;
    final choice = await showOutOfLivesDialog(context);
    if (!mounted) return;
    switch (choice) {
      case OutOfLivesChoice.watchAd:
        final rewarded = await ref
            .read(adServiceProvider)
            .showRewarded(context);
        if (!mounted) return;
        if (rewarded) {
          _game.grantLife();
        } else {
          unawaited(_onOutOfLives());
        }
      case OutOfLivesChoice.restart:
        _game.restart();
      case OutOfLivesChoice.exit || null:
        context.go(_mapRoute);
    }
  }

  Future<void> _onWin() async {
    unawaited(HapticFeedback.heavyImpact());
    final revealTime = 500 + (_puzzle.rows + _puzzle.cols) * 80 + 560;
    await Future<void>.delayed(Duration(milliseconds: revealTime));
    if (!mounted) return;
    _celebrate();
    await Future<void>.delayed(const Duration(milliseconds: 1400));
    if (!mounted) return;

    final next = _puzzle.id < LevelRepository.levelCount
        ? _puzzle.id + 1
        : null;
    final finished = ref.read(gameControllerProvider(_puzzle));
    await showLevelCompleteDialog(
      context,
      puzzle: _puzzle,
      nextLevel: next,
      score: finished.score,
      stars: finished.stars,
      totalScore: ref.read(activeSlotProvider)?.totalScore ?? finished.score,
    );
    if (!mounted) return;
    await ref.read(adServiceProvider).showInterstitial(context);
    if (!mounted) return;
    context.go(_afterWin(next));
  }

  /// The map of the world this level belongs to.
  String get _mapRoute => Routes.map(
    ref.read(worldCatalogProvider).worldOf(_puzzle.id).index,
  );

  /// Next level in the same world, or, when this level finished a world,
  /// the new world's map with its unlock celebration.
  String _afterWin(int? next) {
    if (next == null) return _mapRoute;
    final catalog = ref.read(worldCatalogProvider);
    final nextWorld = catalog.worldOf(next);
    if (nextWorld != catalog.worldOf(_puzzle.id)) {
      return Routes.map(nextWorld.index, intro: true);
    }
    return Routes.play(next);
  }

  void _celebrate() {
    final size = MediaQuery.sizeOf(context);
    final random = Random();
    for (var i = 0; i < 6; i++) {
      Timer(Duration(milliseconds: i * 180), () {
        if (!mounted) return;
        unawaited(HapticFeedback.lightImpact());
        _particles.burst(
          Offset(
            size.width * (0.15 + random.nextDouble() * 0.7),
            size.height * (0.2 + random.nextDouble() * 0.3),
          ),
          count: 40,
          colors: AppColors.confetti,
          shape: i.isEven ? ParticleShape.confetti : ParticleShape.star,
          size: 14,
          speed: 520,
          gravity: 520,
          life: 1.8,
        );
      });
    }
  }

  Future<void> _onHint() async {
    if (_game.useHint()) return;
    final watch = await showNoHintsDialog(context);
    if (!watch || !mounted) return;
    final rewarded = await ref.read(adServiceProvider).showRewarded(context);
    if (rewarded) _game.grantHint();
  }

  /// Moves past a text-only step; the last one ends the tutorial.
  void _acknowledge(int step) {
    setState(() => _acknowledged.add(step));
    final board = ref.read(gameControllerProvider(_puzzle)).board;
    if (_tutorial?.currentStep(board, _acknowledged) == null) {
      _game.finishTutorial();
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(gameControllerProvider(_puzzle), _onState);
    final state = ref.watch(gameControllerProvider(_puzzle));
    // Only the hint count: the slot also changes on every saved move.
    final hints = ref.watch(activeSlotProvider.select((s) => s?.hints ?? 0));
    final l10n = AppLocalizations.of(context);
    final won = state.status == GameStatus.won;
    // Shown until finished or skipped, and never on a level already won.
    final tutorialSeen = ref.watch(
      activeSlotProvider.select(
        (s) =>
            s == null ||
            s.tutorials.contains(_puzzle.id) ||
            s.completed.contains(_puzzle.id),
      ),
    );
    final tutorial = tutorialSeen || won ? null : _tutorial;
    final stepIndex = tutorial?.currentStep(state.board, _acknowledged);
    final step = stepIndex == null ? null : tutorial!.steps[stepIndex];

    return Stack(
      children: [
        SafeArea(
          child: Column(
            children: [
              _TopBar(
                level: _puzzle.id,
                lives: state.lives,
                title: won ? _puzzle.name.localized(context) : null,
              ),
              _ScoreBar(score: state.score, combo: state.combo),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Center(
                    child: AnimatedBuilder(
                      animation: _shake,
                      builder: (context, child) => Transform.translate(
                        offset: Offset(
                          sin(_shake.value * pi * 6) * 10 * (1 - _shake.value),
                          0,
                        ),
                        child: child,
                      ),
                      child: BoardView(
                        state: state,
                        onMark: _game.mark,
                        onPreview: _game.previewFill,
                        particles: _particles,
                        guide: step,
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeOut,
                child: switch (state.hint) {
                  final hint? when !won => HintCard(
                    key: ValueKey(hint),
                    hint: hint,
                    onClose: _game.dismissHint,
                  ),
                  _ when step != null => TutorialCard(
                    step: step,
                    index: stepIndex!,
                    count: tutorial!.steps.length,
                    onSkip: _game.finishTutorial,
                    onAck: () => _acknowledge(stepIndex),
                  ),
                  _ => const SizedBox(width: double.infinity),
                },
              ),
              _BottomBar(
                hints: hints,
                enabled: state.status == GameStatus.playing,
                onHint: _onHint,
                onRestart: _game.restart,
                hintLabel: l10n.hint,
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: RepaintBoundary(child: ParticleLayer(controller: _particles)),
        ),
      ],
    );
  }
}

class _TopBar extends ConsumerWidget {
  const _TopBar({required this.level, required this.lives, this.title});

  final int level;
  final int lives;
  final String? title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 8, 4),
      child: Row(
        children: [
          IconButton(
            onPressed: () => context.go(
              Routes.map(ref.read(worldCatalogProvider).worldOf(level).index),
            ),
            icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          ),
          Expanded(
            child: Text(
              title ?? l10n.levelLabel(level),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                shadows: [Shadow(blurRadius: 8, color: Colors.black38)],
              ),
            ),
          ),
          _Lives(lives: lives),
          IconButton(
            onPressed: () => showRulesDialog(context),
            icon: const Icon(Icons.help_outline_rounded, color: Colors.white),
          ),
          const SettingsButton(),
        ],
      ),
    );
  }
}

/// Running score with a pulse on every gain, plus the combo multiplier.
class _ScoreBar extends StatelessWidget {
  const _ScoreBar({required this.score, required this.combo});

  final int score;
  final int combo;

  @override
  Widget build(BuildContext context) {
    final multiplier = Scoring.multiplier(combo);
    final toNext = Scoring.comboStep - combo % Scoring.comboStep;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TweenAnimationBuilder<double>(
          tween: Tween(end: score.toDouble()),
          duration: const Duration(milliseconds: 450),
          curve: Curves.easeOut,
          builder: (context, v, _) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.25),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.star_rounded, color: AppColors.gold),
                const SizedBox(width: 6),
                Text(
                  '${v.round()}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (combo > 0) ...[
          const SizedBox(width: 10),
          // Re-keyed on every combo step so the chip pops each time.
          Container(
            key: ValueKey(combo),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: multiplier >= Scoring.maxMultiplier
                  ? AppColors.heart
                  : AppColors.gold,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              multiplier >= Scoring.maxMultiplier
                  ? 'x$multiplier MAX'
                  : 'x$multiplier  ·  $toNext',
              style: const TextStyle(
                color: AppColors.block,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ).animate().scale(
            begin: const Offset(0.7, 0.7),
            duration: 260.ms,
            curve: Curves.easeOutBack,
          ),
        ],
      ],
    );
  }
}

/// Heart with the number of lives left; pops whenever the count changes.
class _Lives extends StatelessWidget {
  const _Lives({required this.lives});

  final int lives;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4),
    child: AnimatedSwitcher(
      duration: const Duration(milliseconds: 450),
      transitionBuilder: (child, animation) => ScaleTransition(
        scale: CurvedAnimation(parent: animation, curve: Curves.elasticOut),
        child: child,
      ),
      child: Row(
        key: ValueKey(lives),
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            lives > 0 ? Icons.favorite_rounded : Icons.heart_broken_rounded,
            color: lives > 0 ? AppColors.heart : Colors.white38,
            size: 30,
            shadows: const [Shadow(blurRadius: 10, color: Colors.white54)],
          ),
          const SizedBox(width: 4),
          Text(
            '$lives',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w700,
              shadows: [Shadow(blurRadius: 8, color: Colors.black38)],
            ),
          ),
        ],
      ),
    ),
  );
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({
    required this.hints,
    required this.enabled,
    required this.onHint,
    required this.onRestart,
    required this.hintLabel,
  });

  final int hints;
  final bool enabled;
  final VoidCallback onHint;
  final VoidCallback onRestart;
  final String hintLabel;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _RoundButton(
          icon: Icons.refresh_rounded,
          onPressed: enabled ? onRestart : null,
        ),
        const SizedBox(width: 20),
        Badge(
          label: Text(hints > 0 ? '$hints' : '+'),
          backgroundColor: hints > 0 ? AppColors.heart : AppColors.goldDeep,
          largeSize: 22,
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          child: FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.gold,
              foregroundColor: AppColors.block,
              padding: const EdgeInsets.symmetric(horizontal: 28),
            ),
            onPressed: enabled ? onHint : null,
            icon: const Icon(Icons.lightbulb_rounded),
            label: Text(hintLabel),
          ),
        ),
      ],
    ),
  );
}

class _RoundButton extends StatelessWidget {
  const _RoundButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => IconButton.filled(
    style: IconButton.styleFrom(
      backgroundColor: Colors.white.withValues(alpha: 0.9),
      foregroundColor: AppColors.block,
      minimumSize: const Size.square(52),
    ),
    onPressed: onPressed,
    icon: Icon(icon),
  );
}
