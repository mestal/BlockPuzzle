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

ThemeData buildTheme() {
  final base = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.blockTop,
      primary: AppColors.block,
    ),
  );
  return base.copyWith(
    textTheme: GoogleFonts.fredokaTextTheme(base.textTheme),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size(0, 52),
        textStyle: GoogleFonts.fredoka(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.board,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
    ),
  );
}
