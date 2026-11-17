import 'package:block_puzzle/app/theme.dart';
import 'package:block_puzzle/features/game/domain/hint.dart';
import 'package:block_puzzle/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// Explains why the hinted cell is certain, so a hint teaches the rule
/// instead of just revealing a square. Tap to close; the next move closes
/// it too.
class HintCard extends StatelessWidget {
  const HintCard({required this.hint, required this.onClose, super.key});

  final Hint hint;
  final VoidCallback onClose;

  /// The localized explanation of [hint].
  static String explain(AppLocalizations l10n, Hint hint) {
    final line = hint.isRow
        ? l10n.hintRow(hint.line + 1)
        : l10n.hintColumn(hint.line + 1);
    final clue = hint.clue.isEmpty ? '0' : hint.clue.join(' ');
    return switch (hint.reason) {
      HintReason.fullLine => l10n.hintFullLine(line, clue),
      HintReason.overlap => l10n.hintOverlap(line, clue),
      HintReason.forcedFill => l10n.hintForcedFill(line, clue),
      HintReason.forcedEmpty => l10n.hintForcedEmpty(line, clue),
      HintReason.fallback => l10n.hintFallback,
    };
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Material(
        color: Colors.white.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onClose,
          child: Container(
            padding: const EdgeInsets.fromLTRB(12, 10, 8, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AppColors.gold, width: 2),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.lightbulb_rounded, color: AppColors.goldDeep),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    explain(l10n, hint),
                    style: const TextStyle(
                      color: AppColors.block,
                      fontSize: 14,
                      height: 1.3,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Icon(
                  Icons.close_rounded,
                  color: AppColors.crossAuto,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    ).animate().fadeIn(duration: 200.ms).slideY(begin: 0.3);
  }
}
