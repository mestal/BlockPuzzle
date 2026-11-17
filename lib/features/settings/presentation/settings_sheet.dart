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

    Widget languageTile(String? code, String label) => RadioListTile<String?>(
      value: code,
      title: Text(label, style: const TextStyle(color: AppColors.block)),
      activeColor: AppColors.blockTop,
      dense: true,
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
            RadioGroup<String?>(
              groupValue: settings.language,
              onChanged: controller.setLanguage,
              child: Column(
                children: [
                  languageTile(null, l10n.settingsLanguageDevice),
                  for (final MapEntry(:key, :value)
                      in supportedLanguages.entries)
                    languageTile(key, value),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
