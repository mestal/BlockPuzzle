import 'dart:async';

import 'package:block_puzzle/app/router.dart';
import 'package:block_puzzle/app/theme.dart';
import 'package:block_puzzle/core/languages.dart';
import 'package:block_puzzle/features/progress/slots_controller.dart';
import 'package:block_puzzle/features/settings/app_settings.dart';
import 'package:block_puzzle/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BlockPuzzleApp extends ConsumerStatefulWidget {
  const BlockPuzzleApp({super.key});

  /// On wide screens (web/desktop preview) the game keeps phone proportions.
  static const _maxPhoneWidth = 440.0;

  @override
  ConsumerState<BlockPuzzleApp> createState() => _BlockPuzzleAppState();
}

class _BlockPuzzleAppState extends ConsumerState<BlockPuzzleApp> {
  late final AppLifecycleListener _lifecycle;

  @override
  void initState() {
    super.initState();
    // Progress is saved with a short delay; write it before the app may be
    // killed in the background.
    _lifecycle = AppLifecycleListener(
      onStateChange: (state) {
        if (state != AppLifecycleState.resumed) {
          unawaited(ref.read(slotsProvider.notifier).flush());
        }
      },
    );
  }

  @override
  void dispose() {
    _lifecycle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final language = ref.watch(settingsProvider.select((s) => s.language));
    return MaterialApp.router(
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
      routerConfig: ref.watch(routerProvider),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      // Null follows the device; unsupported device languages get English.
      locale: language == null ? null : Locale(language),
      localeListResolutionCallback: (locales, supported) => Locale(
        resolveLanguage([
          for (final locale in locales ?? const <Locale>[]) locale.languageCode,
        ]),
      ),
      builder: (context, child) => ColoredBox(
        color: AppColors.skyTop,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: BlockPuzzleApp._maxPhoneWidth,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
