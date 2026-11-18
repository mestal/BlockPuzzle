import 'package:block_puzzle/app/localized.dart';
import 'package:block_puzzle/app/theme.dart';
import 'package:block_puzzle/core/widgets/picture_view.dart';
import 'package:block_puzzle/features/game/domain/puzzle.dart';
import 'package:block_puzzle/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

enum OutOfLivesChoice { watchAd, restart, exit }

/// [offerAd] false (ads switched off): no extra life, only start over or
/// leave.
Future<OutOfLivesChoice?> showOutOfLivesDialog(
  BuildContext context, {
  required bool offerAd,
}) {
  final l10n = AppLocalizations.of(context);
  return showDialog<OutOfLivesChoice>(
    context: context,
    barrierDismissible: false,
    builder: (context) => _GameDialog(
      icon: Icons.heart_broken_rounded,
      iconColor: AppColors.heart,
      title: l10n.outOfLivesTitle,
      body: Text(
        offerAd ? l10n.outOfLivesBody : l10n.outOfLivesBodyNoAds,
        textAlign: TextAlign.center,
      ),
      actions: [
        if (offerAd)
          FilledButton.icon(
            onPressed: () => Navigator.pop(context, OutOfLivesChoice.watchAd),
            icon: const Icon(Icons.play_circle_fill_rounded),
            label: Text(l10n.watchAdForLife),
          ),
        if (offerAd)
          OutlinedButton(
            onPressed: () => Navigator.pop(context, OutOfLivesChoice.restart),
            child: Text(l10n.restart),
          )
        else
          FilledButton(
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

/// Returns true when the player wants to watch an ad for a hint. With
/// [offerAd] false (ads switched off) it only says the hints are gone.
Future<bool> showNoHintsDialog(
  BuildContext context, {
  required bool offerAd,
}) async {
  final l10n = AppLocalizations.of(context);
  final result = await showDialog<bool>(
    context: context,
    builder: (context) => _GameDialog(
      icon: Icons.lightbulb_rounded,
      iconColor: AppColors.gold,
      title: l10n.noHintsTitle,
      body: Text(
        offerAd ? l10n.noHintsBody : l10n.noHintsBodyNoAds,
        textAlign: TextAlign.center,
      ),
      actions: [
        if (offerAd) ...[
          FilledButton.icon(
            onPressed: () => Navigator.pop(context, true),
            icon: const Icon(Icons.play_circle_fill_rounded),
            label: Text(l10n.watchAdForHint),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.cancel),
          ),
        ] else
          FilledButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.ok),
          ),
      ],
    ),
  );
  return result ?? false;
}

enum SkipTutorialChoice { level, all }

/// Asks whether to skip only this level's tutorial lesson or all of them.
Future<SkipTutorialChoice?> showSkipTutorialDialog(BuildContext context) {
  final l10n = AppLocalizations.of(context);
  return showDialog<SkipTutorialChoice>(
    context: context,
    builder: (context) => _GameDialog(
      icon: Icons.skip_next_rounded,
      iconColor: AppColors.goldDeep,
      title: l10n.tutorialSkipTitle,
      body: Text(l10n.tutorialSkipBody, textAlign: TextAlign.center),
      actions: [
        FilledButton(
          onPressed: () => Navigator.pop(context, SkipTutorialChoice.level),
          child: Text(l10n.tutorialSkipLevel),
        ),
        OutlinedButton(
          onPressed: () => Navigator.pop(context, SkipTutorialChoice.all),
          child: Text(l10n.tutorialSkipAll),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.cancel),
        ),
      ],
    ),
  );
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
          line(Icons.stars_rounded, l10n.rulesScoring),
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
  required int score,
  required int stars,
  required int totalScore,
}) {
  final l10n = AppLocalizations.of(context);
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (context) => _GameDialog(
      icon: Icons.emoji_events_rounded,
      iconColor: AppColors.gold,
      iconSize: 40,
      title: l10n.levelComplete,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PictureView(
                puzzle: puzzle,
                cellSize: _fit(puzzle, _pictureBox),
              )
              .animate()
              .scale(
                begin: const Offset(0.3, 0.3),
                duration: 600.ms,
                curve: Curves.elasticOut,
              )
              .shimmer(delay: 500.ms, duration: 900.ms),
          const SizedBox(height: 6),
          Text(
            puzzle.name.localized(context),
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.block,
            ),
          ),
          _Stars(stars: stars),
          _CountUp(
            value: score,
            builder: (v) => Text(
              l10n.levelScore(v),
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.goldDeep,
              ),
            ),
          ),
          Text(l10n.totalScore(totalScore)),
          const Divider(height: 20),
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

/// Largest side of the solved picture in the level complete dialog.
const double _pictureBox = 112;

/// Cell size that fits the whole [puzzle] into a [box] x [box] square.
double _fit(Puzzle puzzle, double box) =>
    box / (puzzle.rows > puzzle.cols ? puzzle.rows : puzzle.cols);

/// Three stars that pop in one after the other.
class _Stars extends StatelessWidget {
  const _Stars({required this.stars});

  final int stars;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      for (var i = 0; i < 3; i++)
        Icon(
              i < stars ? Icons.star_rounded : Icons.star_outline_rounded,
              size: 36,
              color: i < stars ? AppColors.gold : Colors.black26,
            )
            .animate(delay: (500 + i * 280).ms)
            .scale(
              begin: Offset.zero,
              duration: 500.ms,
              curve: Curves.elasticOut,
            ),
    ],
  );
}

/// Counts a number up from zero.
class _CountUp extends StatelessWidget {
  const _CountUp({required this.value, required this.builder});

  final int value;
  final Widget Function(int value) builder;

  @override
  Widget build(BuildContext context) => TweenAnimationBuilder<double>(
    tween: Tween(begin: 0, end: value.toDouble()),
    duration: const Duration(milliseconds: 1200),
    curve: Curves.easeOutCubic,
    builder: (context, v, _) => builder(v.round()),
  );
}

/// Names the level that comes next. Its picture stays hidden: even a
/// blurred silhouette gives away which cells are filled.
class _NextLevelPreview extends StatelessWidget {
  const _NextLevelPreview({required this.level});

  final int level;

  @override
  Widget build(BuildContext context) => Text(
    AppLocalizations.of(context).nextLevel(level),
    textAlign: TextAlign.center,
    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
  );
}

class _GameDialog extends StatelessWidget {
  const _GameDialog({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.body,
    required this.actions,
    this.iconSize = 56,
  });

  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final String title;
  final Widget body;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(24),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 12),
        // Only the body scrolls (on very small screens); the buttons stay
        // pinned at the bottom so they never end up below the fold.
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Icon(icon, size: iconSize, color: iconColor)
                        .animate()
                        .scale(duration: 500.ms, curve: Curves.elasticOut)
                        .then()
                        .shake(hz: 3, duration: 400.ms),
                    const SizedBox(height: 6),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.block,
                          ),
                    ),
                    const SizedBox(height: 10),
                    DefaultTextStyle.merge(
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF334155),
                      ),
                      child: body,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            for (final action in actions)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: action,
              ),
          ],
        ),
      ),
    ).animate().scale(
      begin: const Offset(0.8, 0.8),
      duration: 300.ms,
      curve: Curves.easeOutBack,
    );
  }
}
