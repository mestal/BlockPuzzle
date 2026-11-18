import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Single source of truth for game colours (see CLAUDE.md §2).
abstract final class AppColors {
  static const blockTop = Color(0xFF2563EB);
  static const block = Color(0xFF1E3A8A);
  static const blockShadow = Color(0xFF172554);
  static const blockShine = Color(0xFF93C5FD);

  static const board = Color(0xFFF8FAFF);
  static const emptyCell = Color(0xFFE6ECF8);
  static const clueChip = Color(0xFFFFFFFF);
  static const clueText = Color(0xFF1E3A8A);

  static const crossUser = Color(0xFF1E3A8A);
  static const crossAuto = Color(0xFF94A3B8);

  /// X marks of a completed row/column.
  static const crossDone = Color(0xFF22C55E);
  static const mistake = Color(0xFFEF4444);

  static const gold = Color(0xFFFBBF24);
  static const goldDeep = Color(0xFFB45309);
  static const heart = Color(0xFFF43F5E);

  static const skyTop = Color(0xFF3B0764);
  static const skyMiddle = Color(0xFFBE185D);
  static const skyBottom = Color(0xFFFB923C);

  static const avatars = [
    Color(0xFF2563EB),
    Color(0xFFE11D48),
    Color(0xFF16A34A),
    Color(0xFFF59E0B),
    Color(0xFF9333EA),
    Color(0xFF0891B2),
  ];

  /// Map themes, keyed by the `theme` field of `assets/worlds/worlds.json`.
  /// A new world can reuse any of these or add its own entry here.
  static const worldThemes = <String, WorldPalette>{
    'sunset': WorldPalette(
      sky: [skyTop, skyMiddle, skyBottom],
      ground: Color(0xFF9D174D),
      motif: SceneryMotif.hills,
    ),
    'beach': WorldPalette(
      sky: [Color(0xFF0C4A6E), Color(0xFF0EA5E9), Color(0xFFFDE68A)],
      ground: Color(0xFFF59E0B),
      motif: SceneryMotif.waves,
    ),
    'forest': WorldPalette(
      sky: [Color(0xFF1E1B4B), Color(0xFF4338CA), Color(0xFF2DD4BF)],
      ground: Color(0xFF134E4A),
      motif: SceneryMotif.pines,
    ),
    'candy': WorldPalette(
      sky: [Color(0xFF831843), Color(0xFFEC4899), Color(0xFFFBCFE8)],
      ground: Color(0xFFBE185D),
      motif: SceneryMotif.bubbles,
    ),
    'desert': WorldPalette(
      sky: [Color(0xFF7C2D12), Color(0xFFEA580C), Color(0xFFFDE047)],
      ground: Color(0xFFB45309),
      motif: SceneryMotif.hills,
    ),
    'snow': WorldPalette(
      sky: [Color(0xFF1E3A8A), Color(0xFF3B82F6), Color(0xFFE0F2FE)],
      ground: Color(0xFFF8FAFC),
      motif: SceneryMotif.mountains,
    ),
    'reef': WorldPalette(
      sky: [Color(0xFF082F49), Color(0xFF0369A1), Color(0xFF22D3EE)],
      ground: Color(0xFF0E7490),
      motif: SceneryMotif.bubbles,
    ),
    'volcano': WorldPalette(
      sky: [Color(0xFF1C1917), Color(0xFF7F1D1D), Color(0xFFF97316)],
      ground: Color(0xFF292524),
      motif: SceneryMotif.mountains,
    ),
    'clouds': WorldPalette(
      sky: [Color(0xFF6D28D9), Color(0xFFA78BFA), Color(0xFFFBCFE8)],
      ground: Color(0xFFFFFFFF),
      motif: SceneryMotif.clouds,
    ),
    'space': WorldPalette(
      sky: [Color(0xFF020617), Color(0xFF1E1B4B), Color(0xFF6D28D9)],
      ground: Color(0xFF4C1D95),
      motif: SceneryMotif.space,
    ),
    'farm': WorldPalette(
      sky: [Color(0xFF0369A1), Color(0xFF38BDF8), Color(0xFFFEF08A)],
      ground: Color(0xFF4D7C0F),
      motif: SceneryMotif.hills,
    ),
    'garden': WorldPalette(
      sky: [Color(0xFF831843), Color(0xFFF472B6), Color(0xFFFEF9C3)],
      ground: Color(0xFF166534),
      motif: SceneryMotif.bubbles,
    ),
    'jungle': WorldPalette(
      sky: [Color(0xFF052E16), Color(0xFF047857), Color(0xFFA3E635)],
      ground: Color(0xFF14532D),
      motif: SceneryMotif.pines,
    ),
    'blossom': WorldPalette(
      sky: [Color(0xFF4C1D95), Color(0xFFDB2777), Color(0xFFFBCFE8)],
      ground: Color(0xFF9D174D),
      motif: SceneryMotif.mountains,
    ),
    'kitchen': WorldPalette(
      sky: [Color(0xFF7C2D12), Color(0xFFF59E0B), Color(0xFFFEF3C7)],
      ground: Color(0xFF92400E),
      motif: SceneryMotif.bubbles,
    ),
    'pirate': WorldPalette(
      sky: [Color(0xFF0F172A), Color(0xFF0E7490), Color(0xFFFCD34D)],
      ground: Color(0xFF78350F),
      motif: SceneryMotif.waves,
    ),
    'toys': WorldPalette(
      sky: [Color(0xFF1D4ED8), Color(0xFFEC4899), Color(0xFFFDE047)],
      ground: Color(0xFF7C3AED),
      motif: SceneryMotif.bubbles,
    ),
    'savanna': WorldPalette(
      sky: [Color(0xFF9A3412), Color(0xFFF97316), Color(0xFFFDE68A)],
      ground: Color(0xFFA16207),
      motif: SceneryMotif.hills,
    ),
    'haunted': WorldPalette(
      sky: [Color(0xFF020617), Color(0xFF312E81), Color(0xFF7C3AED)],
      ground: Color(0xFF1E1B4B),
      motif: SceneryMotif.pines,
    ),
    'carnival': WorldPalette(
      sky: [Color(0xFF581C87), Color(0xFFC026D3), Color(0xFFFDBA74)],
      ground: Color(0xFF701A75),
      motif: SceneryMotif.bubbles,
    ),
    'sports': WorldPalette(
      sky: [Color(0xFF075985), Color(0xFF0EA5E9), Color(0xFFBBF7D0)],
      ground: Color(0xFF15803D),
      motif: SceneryMotif.hills,
    ),
    'kingdom': WorldPalette(
      sky: [Color(0xFF312E81), Color(0xFF818CF8), Color(0xFFFDE68A)],
      ground: Color(0xFF4338CA),
      motif: SceneryMotif.clouds,
    ),
    'city': WorldPalette(
      sky: [Color(0xFF0F172A), Color(0xFF7E22CE), Color(0xFFF472B6)],
      ground: Color(0xFF1E293B),
      motif: SceneryMotif.space,
    ),
    'ruins': WorldPalette(
      sky: [Color(0xFF422006), Color(0xFFB45309), Color(0xFFFDE68A)],
      ground: Color(0xFF57534E),
      motif: SceneryMotif.mountains,
    ),
    'wonders': WorldPalette(
      sky: [Color(0xFF1E3A8A), Color(0xFF7C3AED), Color(0xFFF9A8D4)],
      ground: Color(0xFF312E81),
      motif: SceneryMotif.clouds,
    ),
  };

  static WorldPalette worldTheme(String key) =>
      worldThemes[key] ?? worldThemes['sunset']!;

  /// The road on the map and its dashes.
  static const mapRoad = Color(0x66FFFFFF);
  static const mapRoadEdge = Color(0x33000000);

  /// Opaque, so the road does not show through unreached stops.
  static const lockedNode = Color(0xFF3730A3);
  static const soonNode = Color(0xFF1E1B4B);
  static const scrim = Color(0xB3000000);

  static const confetti = [
    Color(0xFFFBBF24),
    Color(0xFF60A5FA),
    Color(0xFFF472B6),
    Color(0xFF34D399),
    Color(0xFFFFFFFF),
    Color(0xFFA78BFA),
  ];
}

/// Decorations painted behind a world map.
enum SceneryMotif { hills, waves, pines, mountains, bubbles, clouds, space }

/// Colours and scenery of one world map.
@immutable
final class WorldPalette {
  const WorldPalette({
    required this.sky,
    required this.ground,
    required this.motif,
  });

  /// Top → bottom background gradient.
  final List<Color> sky;

  /// Colour of the scenery shapes (hills, trees, ...).
  final Color ground;
  final SceneryMotif motif;
}

/// Fredoka only covers basic Latin; Nunito (bundled) supplies ş, ğ, İ, ...
const _fontFallback = ['Nunito'];

TextTheme _withFallback(TextTheme t) {
  TextStyle? f(TextStyle? s) => s?.copyWith(fontFamilyFallback: _fontFallback);
  return t.copyWith(
    displayLarge: f(t.displayLarge),
    displayMedium: f(t.displayMedium),
    displaySmall: f(t.displaySmall),
    headlineLarge: f(t.headlineLarge),
    headlineMedium: f(t.headlineMedium),
    headlineSmall: f(t.headlineSmall),
    titleLarge: f(t.titleLarge),
    titleMedium: f(t.titleMedium),
    titleSmall: f(t.titleSmall),
    bodyLarge: f(t.bodyLarge),
    bodyMedium: f(t.bodyMedium),
    bodySmall: f(t.bodySmall),
    labelLarge: f(t.labelLarge),
    labelMedium: f(t.labelMedium),
    labelSmall: f(t.labelSmall),
  );
}

ThemeData buildTheme() {
  final base = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.blockTop,
      primary: AppColors.block,
    ),
  );
  return base.copyWith(
    textTheme: _withFallback(GoogleFonts.fredokaTextTheme(base.textTheme)),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size(0, 52),
        textStyle: GoogleFonts.fredoka(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ).copyWith(fontFamilyFallback: _fontFallback),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.board,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
    ),
  );
}
