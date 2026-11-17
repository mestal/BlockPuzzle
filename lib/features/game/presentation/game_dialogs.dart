import 'package:block_puzzle/app/theme.dart';
import 'package:block_puzzle/core/widgets/picture_view.dart';
import 'package:block_puzzle/features/game/domain/puzzle.dart';
import 'package:block_puzzle/features/levels/level_repository.dart';
import 'package:block_puzzle/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum OutOfLivesChoice { watchAd, restart, exit }

Future<OutOfLivesChoice?> showOutOfLivesDialog(BuildContext context) {
  final l10n = AppLocalizations.of(context);
  return showDialog<OutOfLivesChoice>(
    context: context,
    barrierDismissible: false,
    builder: (context) => _GameDialog(
      icon: Icons.heart_broken_rounded,
      iconColor: AppColors.heart,
      title: l10n.outOfLivesTitle,
      body: Text(l10n.outOfLivesBody, textAlign: TextAlign.center),
      actions: [
        FilledButton.icon(
          onPressed: () => Navigator.pop(context, OutOfLivesChoice.watchAd),
          icon: const Icon(Icons.play_circle_fill_rounded),
          label: Text(l10n.watchAdForLife),
        ),
        OutlinedButton(
          onPressed: () => Navigator.pop(context, OutOfLivesChoice.restart),
          child: Text(l10n.restart),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, OutOfLivesChoice.exit),
          child: Text(l10n.backToLevels),
        ),
      ],
    ),
  );
}

Future<bool> showNoHintsDialog(BuildContext context) async {
  final l10n = AppLocalizations.of(context);
  final result = await showDialog<bool>(
    context: context,
    builder: (context) => _GameDialog(
      icon: Icons.lightbulb_rounded,
      iconColor: AppColors.gold,
      title: l10n.noHintsTitle,
      body: Text(l10n.noHintsBody, textAlign: TextAlign.center),
      actions: [
        FilledButton.icon(
          onPressed: () => Navigator.pop(context, true),
          icon: const Icon(Icons.play_circle_fill_rounded),
          label: Text(l10n.watchAdForHint),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(l10n.cancel),
        ),
      ],
    ),
  );
  return result ?? false;
}

Future<void> showRulesDialog(BuildContext context) {
  final l10n = AppLocalizations.of(context);
  Widget line(IconData icon, String text) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.blockTop),
        const SizedBox(width: 12),
        Expanded(child: Text(text)),
      ],
    ),
  );
  return showDialog<void>(
    context: context,
    builder: (context) => _GameDialog(
      icon: Icons.help_rounded,
      iconColor: AppColors.blockTop,
      title: l10n.rulesTitle,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          line(Icons.tag_rounded, l10n.rulesClues),
          line(Icons.close_rounded, l10n.tutorialTap),
          line(Icons.square_rounded, l10n.tutorialDoubleTap),
          line(Icons.swipe_rounded, l10n.tutorialDrag),
          line(Icons.favorite_rounded, l10n.rulesMistakes),
          line(Icons.image_rounded, l10n.rulesGoal),
        ],
      ),
      actions: [
        FilledButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.ok),
        ),
      ],
    ),
  );
}

/// Shown after the picture reveal. Resolves when the player taps OK.
Future<void> showLevelCompleteDialog(
  BuildContext context, {
  required Puzzle puzzle,
  required int? nextLevel,
}) {
  final l10n = AppLocalizations.of(context);
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (context) => _GameDialog(
      icon: Icons.emoji_events_rounded,
      iconColor: AppColors.gold,
      title: l10n.levelComplete,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PictureView(puzzle: puzzle, cellSize: 132 / puzzle.cols)
              .animate()
              .scale(
                begin: const Offset(0.3, 0.3),
                duration: 600.ms,
                curve: Curves.elasticOut,
              )
              .shimmer(delay: 500.ms, duration: 900.ms),
          const SizedBox(height: 8),
          Text(
            puzzle.name,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.block,
            ),
          ),
          const Divider(height: 28),
          if (nextLevel == null)
            Text(l10n.allDoneSoon)
          else
            _NextLevelPreview(level: nextLevel),
        ],
      ),
      actions: [
        FilledButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.ok),
        ),
      ],
    ),
  );
}

class _NextLevelPreview extends ConsumerWidget {
  const _NextLevelPreview({required this.level});

  final int level;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final next = ref.watch(puzzleProvider(level)).value;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (next != null)
          PictureView(puzzle: next, cellSize: 12, silhouette: true),
        const SizedBox(width: 16),
        Text(
          l10n.nextLevel(level),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class _GameDialog extends StatelessWidget {
  const _GameDialog({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.body,
    required this.actions,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final Widget body;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(24),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(icon, size: 56, color: iconColor)
                  .animate()
                  .scale(duration: 500.ms, curve: Curves.elasticOut)
                  .then()
                  .shake(hz: 3, duration: 400.ms),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.block,
                ),
              ),
              const SizedBox(height: 12),
              DefaultTextStyle.merge(
                style: const TextStyle(fontSize: 16, color: Color(0xFF334155)),
                child: body,
              ),
              const SizedBox(height: 20),
              for (final action in actions)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: action,
                ),
            ],
          ),
        ),
      ),
    ).animate().scale(
      begin: const Offset(0.8, 0.8),
      duration: 300.ms,
      curve: Curves.easeOutBack,
    );
  }
}
