import 'package:block_puzzle/app/router.dart';
import 'package:block_puzzle/app/theme.dart';
import 'package:block_puzzle/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BlockPuzzleApp extends ConsumerWidget {
  const BlockPuzzleApp({super.key});

  /// On wide screens (web/desktop preview) the game keeps phone proportions.
  static const _maxPhoneWidth = 440.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
      routerConfig: ref.watch(routerProvider),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('tr'),
      builder: (context, child) => ColoredBox(
        color: AppColors.skyTop,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: _maxPhoneWidth),
            child: child,
          ),
        ),
      ),
    );
  }
}
