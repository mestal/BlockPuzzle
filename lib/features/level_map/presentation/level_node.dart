import 'package:block_puzzle/app/theme.dart';
import 'package:block_puzzle/core/widgets/jelly_block.dart';
import 'package:block_puzzle/core/widgets/picture_view.dart';
import 'package:block_puzzle/features/levels/level_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum NodeKind {
  /// Finished: shows the revealed picture and the best stars.
  done,

  /// The next level to play.
  current,

  /// Not reached yet.
  locked,

  /// Reached but not shipped yet.
  soon,
}

/// One level stop on the world map.
class LevelNode extends ConsumerWidget {
  const LevelNode({
    required this.level,
    required this.kind,
    this.stars = 0,
    this.onTap,
    super.key,
  });

  final int level;
  final NodeKind kind;
  final int stars;
  final VoidCallback? onTap;

  static const size = 72.0;
  static const currentSize = 86.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final body = switch (kind) {
      NodeKind.done => _DoneTile(level: level, stars: stars),
      NodeKind.current => _CurrentTile(level: level),
      NodeKind.locked => _FlatTile(
        // Expand to the whole tile so the lock sits in the tile's corner,
        // not on top of the number.
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Center(
              child: Text('$level', style: _numberStyle(Colors.white, 24)),
            ),
            const Positioned(
              right: 6,
              bottom: 6,
              child: Icon(Icons.lock_rounded, size: 14, color: Colors.white54),
            ),
          ],
        ),
      ),
      NodeKind.soon => _FlatTile(
        faint: true,
        child: Text('?', style: _numberStyle(Colors.white54, 26)),
      ),
    };
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: body,
    );
  }
}

TextStyle _numberStyle(Color color, double size) => TextStyle(
  color: color,
  fontSize: size,
  fontWeight: FontWeight.w700,
  height: 1,
);

class _DoneTile extends ConsumerWidget {
  const _DoneTile({required this.level, required this.stars});

  final int level;
  final int stars;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final puzzle = ref.watch(puzzleProvider(level)).value;
    return SizedBox.square(
      dimension: LevelNode.size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.board,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: AppColors.gold, width: 3),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.blockShadow,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(11),
                child: Center(
                  child: puzzle == null
                      ? Text('$level', style: _numberStyle(AppColors.block, 26))
                      : PictureThumbnail(puzzle: puzzle),
                ),
              ),
            ),
          ),
          Positioned(
            left: -6,
            top: -6,
            child: _Badge(label: '$level'),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -16,
            child: _StarRow(stars: stars),
          ),
        ],
      ),
    );
  }
}

class _CurrentTile extends StatelessWidget {
  const _CurrentTile({required this.level});

  final int level;

  @override
  Widget build(BuildContext context) =>
      DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.gold,
                  blurRadius: 22,
                  spreadRadius: 3,
                ),
              ],
            ),
            child: SizedBox.square(
              dimension: LevelNode.currentSize,
              child: CustomPaint(
                painter: JellyPainter.blue(),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      '$level',
                      style: _numberStyle(Colors.white, 34),
                    ),
                  ),
                ),
              ),
            ),
          )
          .animate(onPlay: (c) => c.repeat(reverse: true))
          .scaleXY(end: 1.08, duration: 750.ms, curve: Curves.easeInOut);
}

class _FlatTile extends StatelessWidget {
  const _FlatTile({required this.child, this.faint = false});

  final Widget child;
  final bool faint;

  @override
  Widget build(BuildContext context) => Container(
    width: LevelNode.size,
    height: LevelNode.size,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: faint ? AppColors.soonNode : AppColors.lockedNode,
      borderRadius: BorderRadius.circular(22),
      border: Border.all(color: Colors.white38, width: 2),
    ),
    child: child,
  );
}

class _Badge extends StatelessWidget {
  const _Badge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) => Container(
    constraints: const BoxConstraints(minWidth: 24),
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
    decoration: BoxDecoration(
      color: AppColors.blockTop,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.white, width: 2),
    ),
    child: Text(
      label,
      textAlign: TextAlign.center,
      style: _numberStyle(Colors.white, 12),
    ),
  );
}

/// Three stars in a slight arc, the middle one raised.
class _StarRow extends StatelessWidget {
  const _StarRow({required this.stars});

  final int stars;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      for (var i = 0; i < 3; i++)
        Transform.translate(
          offset: Offset(0, i == 1 ? -4 : 0),
          child: Icon(
            Icons.star_rounded,
            size: i == 1 ? 24 : 20,
            color: i < stars ? AppColors.gold : AppColors.lockedNode,
            shadows: const [
              Shadow(color: AppColors.blockShadow, offset: Offset(0, 1.5)),
            ],
          ),
        ),
    ],
  );
}
