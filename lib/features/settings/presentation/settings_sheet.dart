import 'package:block_puzzle/app/theme.dart';
import 'package:block_puzzle/core/languages.dart';
import 'package:block_puzzle/features/settings/app_settings.dart';
import 'package:block_puzzle/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Gear icon that opens the [SettingsSheet].
class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) => IconButton(
    tooltip: AppLocalizations.of(context).settings,
    onPressed: () => showSettingsSheet(context),
    icon: const Icon(Icons.settings_rounded, color: Colors.white),
  );
}

Future<void> showSettingsSheet(BuildContext context) =>
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.board,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (_) => const SettingsSheet(),
    );

/// Language and sound preferences.
class SettingsSheet extends ConsumerWidget {
  const SettingsSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final settings = ref.watch(settingsProvider);
    final controller = ref.read(settingsProvider.notifier);
    const titleStyle = TextStyle(
      color: AppColors.block,
      fontSize: 18,
      fontWeight: FontWeight.w700,
    );

    return SafeArea(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(context).height * 0.85,
        ),
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
          children: [
            Center(child: Text(l10n.settings, style: titleStyle)),
            const SizedBox(height: 8),
            SwitchListTile(
              value: settings.sound,
              onChanged: (on) => controller.setSound(on: on),
              title: Text(
                l10n.settingsSound,
                style: const TextStyle(color: AppColors.block),
              ),
              secondary: Icon(
                settings.sound
                    ? Icons.volume_up_rounded
                    : Icons.volume_off_rounded,
                color: AppColors.block,
              ),
              activeThumbColor: AppColors.blockTop,
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
              child: Row(
                children: [
                  const Icon(Icons.language_rounded, color: AppColors.block),
                  const SizedBox(width: 12),
                  Text(l10n.settingsLanguage, style: titleStyle),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: LanguageDropdown(
                value: settings.language,
                onChanged: controller.setLanguage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Stylish language picker: a raised pill showing the current choice that
/// opens a rounded menu of every [supportedLanguages] entry (alphabetical),
/// preceded by "device language".
class LanguageDropdown extends StatelessWidget {
  const LanguageDropdown({
    required this.value,
    required this.onChanged,
    super.key,
  });

  /// Chosen language code, or null to follow the device language.
  final String? value;
  final ValueChanged<String?> onChanged;

  /// [DropdownButton] treats a null value as "nothing selected", so the
  /// device-language entry uses this key instead.
  static const _device = '';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final selected = value ?? _device;
    final options = <(String, String)>[
      (_device, l10n.settingsLanguageDevice),
      for (final MapEntry(:key, :value) in supportedLanguages.entries)
        (key, value),
    ];

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.clueChip, AppColors.emptyCell],
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.blockShine, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: AppColors.block.withValues(alpha: 0.18),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selected,
          isExpanded: true,
          borderRadius: BorderRadius.circular(20),
          dropdownColor: AppColors.board,
          menuMaxHeight: 420,
          elevation: 12,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.blockTop,
            size: 28,
          ),
          onChanged: (code) {
            if (code != null) onChanged(code == _device ? null : code);
          },
          selectedItemBuilder: (_) => [
            for (final (code, label) in options)
              _LanguageRow(code: code, label: label),
          ],
          items: [
            for (final (code, label) in options)
              DropdownMenuItem(
                value: code,
                child: _LanguageRow(
                  code: code,
                  label: label,
                  selected: code == selected,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// One language: a jelly badge with its code, its own name and, in the
/// open menu, a check mark on the current choice.
class _LanguageRow extends StatelessWidget {
  const _LanguageRow({
    required this.code,
    required this.label,
    this.selected = false,
  });

  final String code;
  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Container(
        width: 38,
        height: 28,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.blockTop, AppColors.block],
          ),
          borderRadius: BorderRadius.circular(9),
          boxShadow: const [
            BoxShadow(color: AppColors.blockShadow, offset: Offset(0, 2)),
          ],
        ),
        child: code.isEmpty
            ? const Icon(
                Icons.smartphone_rounded,
                color: AppColors.clueChip,
                size: 17,
              )
            : Text(
                code.toUpperCase(),
                style: const TextStyle(
                  color: AppColors.clueChip,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
      ),
      const SizedBox(width: 14),
      Expanded(
        child: Text(
          label,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AppColors.block,
            fontSize: 16,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ),
      if (selected)
        const Icon(
          Icons.check_circle_rounded,
          color: AppColors.blockTop,
          size: 22,
        ),
    ],
  );
}
