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

  static const confetti = [
    Color(0xFFFBBF24),
    Color(0xFF60A5FA),
    Color(0xFFF472B6),
    Color(0xFF34D399),
    Color(0xFFFFFFFF),
    Color(0xFFA78BFA),
  ];
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
