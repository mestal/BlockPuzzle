import 'dart:async';
import 'dart:math';

import 'package:block_puzzle/features/game/domain/board.dart';
import 'package:block_puzzle/features/game/domain/puzzle.dart';
import 'package:block_puzzle/features/progress/slot_data.dart';
import 'package:block_puzzle/features/progress/slots_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta/meta.dart';

enum GameStatus { playing, outOfLives, won }

/// What the last move did, so the UI can play matching effects.
/// [seq] grows with every move and lets widgets replay animations.
@immutable
final class MoveFx {
  const MoveFx({
    required this.seq,
    required this.row,
    required this.col,
    this.mistake = false,
    this.hint = false,
    this.completedRows = const [],
    this.completedCols = const [],
    this.solved = false,
  });

  final int seq;
  final int row;
  final int col;
  final bool mistake;
  final bool hint;
  final List<int> completedRows;
  final List<int> completedCols;
  final bool solved;

  bool get completedLine =>
      completedRows.isNotEmpty || completedCols.isNotEmpty;
}

@immutable
final class GameState {
  const GameState({
    required this.board,
    required this.lives,
    required this.status,
    this.fx,
  });

  static const maxLives = 3;

  final Board board;
  final int lives;
  final GameStatus status;
  final MoveFx? fx;

  Puzzle get puzzle => board.puzzle;

  GameState copyWith({
    Board? board,
    int? lives,
    GameStatus? status,
    MoveFx? fx,
  }) => GameState(
    board: board ?? this.board,
    lives: lives ?? this.lives,
    status: status ?? this.status,
    fx: fx ?? this.fx,
  );
}

class GameController extends Notifier<GameState> {
  GameController(this.puzzle);

  final Puzzle puzzle;
  final _random = Random();

  int? get _slotIndex => ref.read(activeSlotIndexProvider);
  SlotData? get _slot => ref.read(activeSlotProvider);

  @override
  GameState build() {
    final snapshot = _slot?.snapshot;
    if (snapshot != null && snapshot.levelId == puzzle.id) {
      final board = Board.decode(puzzle, snapshot.cells);
      return GameState(
        board: board,
        lives: snapshot.lives,
        status: snapshot.lives <= 0
            ? GameStatus.outOfLives
            : GameStatus.playing,
      );
    }
    return _fresh();
  }

  GameState _fresh() => GameState(
    board: Board.start(puzzle),
    lives: GameState.maxLives,
    status: GameStatus.playing,
  );

  /// Applies a player move. Returns false when a drag should stop
  /// (mistake made or game no longer in play).
  bool mark(int r, int c, MoveAction action) =>
      _apply(r, c, action, MarkSource.user);

  /// Reveals one filled cell. Returns false if the player has no hints.
  bool useHint() {
    final slot = _slot;
    if (slot == null || slot.hints <= 0) return false;
    if (state.status != GameStatus.playing) return true;
    final cell = state.board.hintCell(_random.nextInt(1 << 30));
    if (cell == null) return true;
    _editSlot((s) => s.copyWith(hints: s.hints - 1));
    final (r, c) = cell;
    _apply(r, c, MoveAction.fill, MarkSource.hint);
    return true;
  }

  void grantHint() => _editSlot((s) => s.copyWith(hints: s.hints + 1));

  void grantLife() {
    state = state.copyWith(lives: state.lives + 1, status: GameStatus.playing);
    _saveSnapshot();
  }

  void restart() {
    state = _fresh();
    _saveSnapshot();
  }

  bool _apply(int r, int c, MoveAction action, MarkSource source) {
    if (state.status != GameStatus.playing) return false;
    final result = state.board.apply(r, c, action, source: source);
    if (!result.changed) return true;

    final lives = result.mistake ? state.lives - 1 : state.lives;
    final status = result.solved
        ? GameStatus.won
        : lives <= 0
        ? GameStatus.outOfLives
        : GameStatus.playing;

    state = GameState(
      board: result.board,
      lives: lives,
      status: status,
      fx: MoveFx(
        seq: (state.fx?.seq ?? 0) + 1,
        row: r,
        col: c,
        mistake: result.mistake,
        hint: source == MarkSource.hint,
        completedRows: result.completedRows,
        completedCols: result.completedCols,
        solved: result.solved,
      ),
    );

    if (status == GameStatus.won) {
      _editSlot(
        (s) => s.copyWith(
          completed: {...s.completed, puzzle.id},
          unlockedLevel: max(s.unlockedLevel, puzzle.id + 1),
          snapshot: () => null,
        ),
      );
    } else {
      _saveSnapshot();
    }
    return !result.mistake && status == GameStatus.playing;
  }

  void _saveSnapshot() => _editSlot(
    (s) => s.copyWith(
      snapshot: () => LevelSnapshot(
        levelId: puzzle.id,
        cells: state.board.encode(),
        lives: state.lives,
      ),
    ),
  );

  void _editSlot(SlotData Function(SlotData) change) {
    final index = _slotIndex;
    if (index == null) return;
    unawaited(ref.read(slotsProvider.notifier).edit(index, change));
  }
}

final gameControllerProvider = NotifierProvider.autoDispose
    .family<GameController, GameState, Puzzle>(GameController.new);
