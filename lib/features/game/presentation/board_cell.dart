import 'dart:async';
import 'dart:math';

import 'package:block_puzzle/app/theme.dart';
import 'package:block_puzzle/core/widgets/jelly_block.dart';
import 'package:block_puzzle/features/game/domain/board.dart';
import 'package:flutter/material.dart';

/// One grid cell with its own entrance, flash and reveal animations so the
/// rest of the board never rebuilds for an effect.
class BoardCell extends StatefulWidget {
  const BoardCell({
    required this.cell,
    required this.size,
    this.pressed = false,
    this.entranceDelay = Duration.zero,
    this.flashSeq,
    this.flashDelay = Duration.zero,
    this.revealColor,
    this.revealDelay = Duration.zero,
    super.key,
  });

  final Cell cell;
  final double size;
  final bool pressed;
  final Duration entranceDelay;

  /// Changing this replays the line-complete flash after [flashDelay].
  final int? flashSeq;
  final Duration flashDelay;

  /// Set once the level is won: blocks flip into this picture colour and
  /// X marks fade out (they receive a transparent colour).
  final Color? revealColor;
  final Duration revealDelay;

  @override
  State<BoardCell> createState() => _BoardCellState();
}

class _BoardCellState extends State<BoardCell> with TickerProviderStateMixin {
  late final _entrance = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 520),
    value: 1,
  );
  late final _flash = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 650),
  );
  late final _reveal = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 560),
  );
  final _timers = <Timer>[];

  @override
  void initState() {
    super.initState();
    if (widget.revealColor != null) _reveal.value = 1;
  }

  @override
  void didUpdateWidget(BoardCell old) {
    super.didUpdateWidget(old);
    if (old.cell != widget.cell && widget.cell.isOpen) {
      _entrance.value = 0;
      _after(widget.entranceDelay, () => _entrance.forward(from: 0));
    }
    if (old.flashSeq != widget.flashSeq && widget.flashSeq != null) {
      _after(widget.flashDelay, () => _flash.forward(from: 0));
    }
    if (old.revealColor == null && widget.revealColor != null) {
      _after(widget.revealDelay, () => _reveal.forward(from: 0));
    }
  }

  void _after(Duration delay, VoidCallback action) {
    if (delay == Duration.zero) {
      action();
      return;
    }
    _timers.add(
      Timer(delay, () {
        if (mounted) action();
      }),
    );
  }

  @override
  void dispose() {
    for (final t in _timers) {
      t.cancel();
    }
    _entrance.dispose();
    _flash.dispose();
    _reveal.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SizedBox.square(
    dimension: widget.size,
    child: AnimatedBuilder(
      animation: Listenable.merge([_entrance, _flash, _reveal]),
      builder: (context, _) => switch (widget.cell.mark) {
        CellMark.empty => _empty(),
        CellMark.filled => _filled(),
        CellMark.crossed => _crossed(),
      },
    ),
  );

  Widget _empty() => AnimatedContainer(
    duration: const Duration(milliseconds: 120),
    margin: EdgeInsets.all(widget.size * 0.06),
    decoration: BoxDecoration(
      color: widget.pressed ? AppColors.blockShine : AppColors.emptyCell,
      borderRadius: BorderRadius.circular(widget.size * 0.22),
    ),
  );

  Widget _filled() {
    final pop = Curves.elasticOut.transform(_entrance.value);
    final flash = sin(_flash.value * pi);
    final reveal = _reveal.value;
    final flipped = reveal > 0.5;
    final angle = reveal * pi;
    final revealColor = widget.revealColor;

    final source = widget.cell.source;
    Widget block = CustomPaint(
      size: Size.square(widget.size),
      painter: flipped && revealColor != null
          ? JellyPainter(color: revealColor)
          : JellyPainter.blue(glow: flash),
    );

    if (source == MarkSource.mistake && _entrance.value < 1) {
      block = _overlay(block, AppColors.mistake, 1 - _entrance.value);
    } else if (source == MarkSource.hint && _entrance.value < 1) {
      block = _overlay(block, AppColors.gold, 1 - _entrance.value);
    }

    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.002)
        ..rotateY(flipped ? angle - pi : angle)
        ..scaleByDouble(
          (0.4 + 0.6 * pop) * (1 + 0.14 * flash),
          (0.4 + 0.6 * pop) * (1 + 0.14 * flash),
          1,
          1,
        ),
      child: block,
    );
  }

  Widget _overlay(Widget child, Color color, double strength) => Stack(
    children: [
      child,
      Positioned.fill(
        child: Container(
          margin: EdgeInsets.all(widget.size * 0.02),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.size * 0.26),
            border: Border.all(
              color: color.withValues(alpha: strength),
              width: widget.size * 0.08,
            ),
          ),
        ),
      ),
    ],
  );

  Widget _crossed() {
    final (color, thickness) = switch (widget.cell.source) {
      MarkSource.auto => (AppColors.crossAuto, 0.08),
      MarkSource.mistake => (AppColors.mistake, 0.13),
      MarkSource.user || MarkSource.hint => (AppColors.crossUser, 0.13),
    };
    final shake = widget.cell.source == MarkSource.mistake
        ? sin(_entrance.value * pi * 8) * (1 - _entrance.value) * 4
        : 0.0;
    return Opacity(
      opacity: 1 - _reveal.value,
      child: Transform.translate(
        offset: Offset(shake, 0),
        child: CustomPaint(
          size: Size.square(widget.size),
          painter: CrossPainter(
            color: color,
            thickness: thickness,
            progress: Curves.easeOut.transform(
              min(_entrance.value * 1.6, 1),
            ),
          ),
        ),
      ),
    );
  }
}
