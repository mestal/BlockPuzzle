import 'package:block_puzzle/core/widgets/jelly_block.dart';
import 'package:block_puzzle/features/game/domain/puzzle.dart';
import 'package:flutter/material.dart';

/// A cheap, single-painter miniature of [puzzle]'s picture that scales to
/// fit its box. Used on map nodes and world cards, where many are visible.
class PictureThumbnail extends StatelessWidget {
  const PictureThumbnail({required this.puzzle, super.key});

  final Puzzle puzzle;

  @override
  Widget build(BuildContext context) => AspectRatio(
    aspectRatio: puzzle.cols / puzzle.rows,
    child: CustomPaint(painter: _ThumbnailPainter(puzzle)),
  );
}

class _ThumbnailPainter extends CustomPainter {
  _ThumbnailPainter(this.puzzle);

  final Puzzle puzzle;

  @override
  void paint(Canvas canvas, Size size) {
    final cell = size.width / puzzle.cols;
    final gap = cell * 0.08;
    final radius = Radius.circular(cell * 0.25);
    final paint = Paint();
    for (var r = 0; r < puzzle.rows; r++) {
      for (var c = 0; c < puzzle.cols; c++) {
        final color = puzzle.colorAt(r, c);
        if (color == null) continue;
        paint.color = Color(color);
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(
              c * cell + gap,
              r * cell + gap,
              cell - gap * 2,
              cell - gap * 2,
            ),
            radius,
          ),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(_ThumbnailPainter old) => old.puzzle != puzzle;
}

/// The finished picture of [puzzle].
class PictureView extends StatelessWidget {
  const PictureView({
    required this.puzzle,
    this.cellSize = 24,
    super.key,
  });

  final Puzzle puzzle;
  final double cellSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                    painter: JellyPainter(
                      color: Color(puzzle.colorAt(r, c)!),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
