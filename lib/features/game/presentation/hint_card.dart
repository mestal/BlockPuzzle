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

  /// The localized explanation of [hint], with the real numbers of its
  /// line: squares are counted from the start of the line (left of a row,
  /// top of a column), from 1.
  static String explain(AppLocalizations l10n, Hint hint) {
    final line = hint.isRow
        ? l10n.hintRow(hint.line + 1)
        : l10n.hintColumn(hint.line + 1);
    final clue = _ltr(hint.clue.isEmpty ? '0' : hint.clue.join(' '));
    final text = switch (hint.reason) {
      HintReason.fullLine => l10n.hintFullLine(
        line,
        clue,
        _ltr(hint.clue.join(' + 1 + ')),
        hint.length,
      ),
      HintReason.overlap => l10n.hintOverlap(
        line,
        clue,
        hint.groups.first.size,
        _span(
          hint.groups.first.earliest,
          hint.groups.first.earliest + hint.groups.first.size - 1,
        ),
        _span(hint.groups.first.latest, hint.groups.first.end),
        _span(hint.span!.$1, hint.span!.$2),
      ),
      HintReason.outOfReach => l10n.hintOutOfReach(
        line,
        clue,
        _ltr(
          hint.groups
              .map((g) => '${g.size} → ${_range(g.earliest, g.end)}')
              .join(', '),
        ),
        hint.index + 1,
      ),
      HintReason.blockDone => l10n.hintBlockDone(
        line,
        clue,
        _span(hint.span!.$1, hint.span!.$2),
        hint.span!.$2 - hint.span!.$1 + 1,
      ),
      HintReason.tooSmall => l10n.hintTooSmall(
        line,
        clue,
        hint.span!.$2 - hint.span!.$1 + 1,
        hint.groups.map((g) => g.size).reduce((a, b) => a < b ? a : b),
      ),
      HintReason.forcedFill => l10n.hintForcedFill(line, clue),
      HintReason.forcedEmpty => l10n.hintForcedEmpty(line, clue),
      HintReason.fallback => l10n.hintFallback,
    };
    return hint.fixesCross ? '$text ${l10n.hintFixedCross}' : text;
  }

  /// Squares [first]..[last] (0-based) as "3–6", or "4" for one square.
  static String _range(int first, int last) =>
      first == last ? '${first + 1}' : '${first + 1}–${last + 1}';

  static String _span(int first, int last) => _ltr(_range(first, last));

  /// Isolated left-to-right so numbers keep their order in RTL text.
  static String _ltr(String text) => '\u2066$text\u2069';

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
