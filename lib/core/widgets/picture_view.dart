import 'dart:ui';

import 'package:block_puzzle/app/theme.dart';
import 'package:block_puzzle/core/widgets/jelly_block.dart';
import 'package:block_puzzle/features/game/domain/puzzle.dart';
import 'package:flutter/material.dart';

/// The finished picture of [puzzle]. With [silhouette] it shows only a
/// blurred shape, used to tease the next level.
class PictureView extends StatelessWidget {
  const PictureView({
    required this.puzzle,
    this.cellSize = 24,
    this.silhouette = false,
    super.key,
  });

  final Puzzle puzzle;
  final double cellSize;
  final bool silhouette;

  @override
  Widget build(BuildContext context) {
    final grid = SizedBox(
      width: puzzle.cols * cellSize,
      height: puzzle.rows * cellSize,
      child: Stack(
        children: [
          for (var r = 0; r < puzzle.rows; r++)
            for (var c = 0; c < puzzle.cols; c++)
              if (puzzle.isFilled(r, c))
                Positioned(
                  left: c * cellSize,
                  top: r * cellSize,
                  width: cellSize,
                  height: cellSize,
                  child: CustomPaint(
                    painter: silhouette
                        ? JellyPainter(color: AppColors.crossAuto)
                        : JellyPainter(color: Color(puzzle.colorAt(r, c)!)),
                  ),
                ),
        ],
      ),
    );
    if (!silhouette) return grid;
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
      child: Opacity(opacity: 0.7, child: grid),
    );
  }
}
