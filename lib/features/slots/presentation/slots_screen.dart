import 'package:block_puzzle/app/localized.dart';
import 'package:block_puzzle/app/router.dart';
import 'package:block_puzzle/app/theme.dart';
import 'package:block_puzzle/core/widgets/jelly_block.dart';
import 'package:block_puzzle/core/widgets/sky_background.dart';
import 'package:block_puzzle/features/level_map/application/world_providers.dart';
import 'package:block_puzzle/features/progress/slot_data.dart';
import 'package:block_puzzle/features/progress/slots_controller.dart';
import 'package:block_puzzle/features/settings/presentation/settings_sheet.dart';
import 'package:block_puzzle/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Start screen: three player slots stored on the device.
class SlotsScreen extends ConsumerWidget {
  const SlotsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final slots = ref.watch(slotsProvider);

    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: SkyBackground()),
          SafeArea(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 32, 20, 24),
              children: [
                const _Logo(),
                const SizedBox(height: 28),
                Text(
                  l10n.whoIsPlaying,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                ...switch (slots) {
                  AsyncData(:final value) => [
                    for (var i = 0; i < value.length; i++)
                      _SlotCard(index: i, slot: value[i])
                          .animate(delay: (120 * i).ms)
                          .fadeIn()
                          .slideX(begin: i.isEven ? -0.3 : 0.3),
                  ],
                  _ => [
                    const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
                  ],
                },
              ],
            ),
          ),
          const SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(4),
                child: SettingsButton(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    const pattern = ['#.#', '###', '.#.'];
    return Column(
      children: [
        SizedBox(
          width: 96,
          height: 96,
          child: Stack(
            children: [
              for (var r = 0; r < 3; r++)
                for (var c = 0; c < 3; c++)
                  if (pattern[r][c] == '#')
                    Positioned(
                      left: c * 32,
                      top: r * 32,
                      width: 32,
                      height: 32,
                      child: CustomPaint(painter: JellyPainter.blue())
                          .animate(
                            onPlay: (controller) => controller.repeat(),
                          )
                          .shimmer(
                            delay: 120.ms * (r * 3 + c),
                            duration: 1200.ms,
                          )
                          .then(delay: 1600.ms),
                    ),
            ],
          ),
        ).animate().scale(duration: 700.ms, curve: Curves.elasticOut),
        const SizedBox(height: 12),
        Text(
          AppLocalizations.of(context).appTitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 44,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
            shadows: [
              Shadow(color: AppColors.blockShadow, offset: Offset(0, 4)),
              Shadow(color: Colors.black26, blurRadius: 16),
            ],
          ),
        ),
      ],
    );
  }
}

class _SlotCard extends ConsumerWidget {
  const _SlotCard({required this.index, required this.slot});

  final int index;
  final SlotData? slot;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final slot = this.slot;

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Material(
        color: Colors.white.withValues(alpha: slot == null ? 0.25 : 0.92),
        borderRadius: BorderRadius.circular(24),
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: () =>
              slot == null ? _create(context, ref) : _open(context, ref),
          onLongPress: slot == null ? null : () => _delete(context, ref, slot),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: slot == null
                ? Row(
                    children: [
                      const CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.white30,
                        child: Icon(
                          Icons.add_rounded,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        l10n.newGame,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  )
                : _FilledSlot(slot: slot),
          ),
        ),
      ),
    );
  }

  void _open(BuildContext context, WidgetRef ref) {
    ref.read(activeSlotIndexProvider.notifier).index = index;
    context.go(Routes.currentMap);
  }

  Future<void> _create(BuildContext context, WidgetRef ref) async {
    final result = await showDialog<(String, int)>(
      context: context,
      builder: (_) => const _NewSlotDialog(),
    );
    if (result == null) return;
    await ref
        .read(slotsProvider.notifier)
        .create(index, name: result.$1, color: result.$2);
    if (context.mounted) _open(context, ref);
  }

  Future<void> _delete(
    BuildContext context,
    WidgetRef ref,
    SlotData slot,
  ) async {
    final l10n = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.deleteSlotTitle(slot.name)),
        content: Text(l10n.deleteSlotBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: AppColors.mistake),
            onPressed: () => Navigator.pop(context, true),
            child: Text(l10n.delete),
          ),
        ],
      ),
    );
    if (confirmed ?? false) {
      await ref.read(slotsProvider.notifier).delete(index);
    }
  }
}

class _FilledSlot extends ConsumerWidget {
  const _FilledSlot({required this.slot});

  final SlotData slot;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final color = AppColors.avatars[slot.colorIndex % AppColors.avatars.length];
    final done = slot.completed.length;
    final catalog = ref.watch(worldCatalogProvider);
    final total = catalog.plannedLevelCount;
    final level = currentLevelOf(slot);
    final world = catalog.worldOf(level);

    return Row(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: color,
          child: Text(
            slot.name.characters.first.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                slot.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.block,
                ),
              ),
              Text(
                '${world.name.localized(context)} · ${l10n.levelLabel(level)}',
                style: const TextStyle(color: Color(0xFF475569)),
              ),
              const SizedBox(height: 6),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: LinearProgressIndicator(
                  value: done / total,
                  minHeight: 8,
                  color: AppColors.blockTop,
                  backgroundColor: AppColors.emptyCell,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Column(
          children: [
            const Icon(Icons.lightbulb_rounded, color: AppColors.gold),
            Text(
              '${slot.hints}',
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ],
    );
  }
}

class _NewSlotDialog extends StatefulWidget {
  const _NewSlotDialog();

  @override
  State<_NewSlotDialog> createState() => _NewSlotDialogState();
}

class _NewSlotDialogState extends State<_NewSlotDialog> {
  final _name = TextEditingController();
  int _color = 0;
  String? _error;

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  void _submit() {
    final name = _name.text.trim();
    if (name.isEmpty) {
      setState(() => _error = AppLocalizations.of(context).nameRequired);
      return;
    }
    Navigator.pop(context, (name, _color));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return AlertDialog(
      title: Text(l10n.newGame),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _name,
            autofocus: true,
            maxLength: 14,
            textCapitalization: TextCapitalization.words,
            onChanged: (_) {
              if (_error != null) setState(() => _error = null);
            },
            onSubmitted: (_) => _submit(),
            decoration: InputDecoration(
              labelText: l10n.yourName,
              hintText: l10n.namePlaceholder,
              errorText: _error,
            ),
          ),
          const SizedBox(height: 8),
          Text(l10n.pickColor),
          const SizedBox(height: 8),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              for (var i = 0; i < AppColors.avatars.length; i++)
                GestureDetector(
                  onTap: () => setState(() => _color = i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.avatars[i],
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _color == i
                            ? AppColors.gold
                            : Colors.transparent,
                        width: 4,
                      ),
                    ),
                    child: _color == i
                        ? const Icon(Icons.check_rounded, color: Colors.white)
                        : null,
                  ),
                ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.cancel),
        ),
        FilledButton(onPressed: _submit, child: Text(l10n.start)),
      ],
    );
  }
}
