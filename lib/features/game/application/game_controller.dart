import 'dart:async';
import 'dart:math';

import 'package:block_puzzle/core/audio/sound_service.dart';
import 'package:block_puzzle/features/game/domain/board.dart';
import 'package:block_puzzle/features/game/domain/hint.dart';
import 'package:block_puzzle/features/game/domain/puzzle.dart';
import 'package:block_puzzle/features/game/domain/scoring.dart';
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
    this.points = 0,
  });

  final int seq;
  final int row;
  final int col;
  final bool mistake;
  final bool hint;
  final List<int> completedRows;
  final List<int> completedCols;
  final bool solved;

  /// Points this move earned (level bonus included when it solved the level).
  final int points;

  bool get completedLine =>
      completedRows.isNotEmpty || completedCols.isNotEmpty;
}

@immutable
final class GameState {
  const GameState({
    required this.board,
    required this.lives,
    required this.status,
    this.score = 0,
    this.combo = 0,
    this.mistakes = 0,
    this.fx,
    this.hint,
  });

  static const maxLives = 10;

  final Board board;
  final int lives;
  final GameStatus status;

  /// Points earned on this level so far.
  final int score;

  /// Correct fills in a row since the last mistake.
  final int combo;

  /// Mistakes made on this level (drives the star rating).
  final int mistakes;
  final MoveFx? fx;

  /// The last hint and its explanation; cleared by the player's next move.
  final Hint? hint;

  int get multiplier => Scoring.multiplier(combo);
  int get stars => Scoring.stars(mistakes);

  Puzzle get puzzle => board.puzzle;

  GameState copyWith({
    Board? board,
    int? lives,
    GameStatus? status,
    MoveFx? fx,
    Hint? Function()? hint,
  }) => GameState(
    board: board ?? this.board,
    lives: lives ?? this.lives,
    status: status ?? this.status,
    score: score,
    combo: combo,
    mistakes: mistakes,
    fx: fx ?? this.fx,
    hint: hint == null ? this.hint : hint(),
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
        score: snapshot.score,
        mistakes: snapshot.mistakes,
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

  SoundService get _sound => ref.read(soundServiceProvider);

  /// Applies a player move. [step] is how many cells the current drag has
  /// covered; it only shapes the sound. Returns false when a drag should stop
  /// (mistake made or game no longer in play).
  /// [quiet] skips the plain fill sound (already played by [previewFill]).
  bool mark(
    int r,
    int c,
    MoveAction action, {
    int step = 0,
    bool quiet = false,
  }) => _apply(r, c, action, MarkSource.user, step: step, quiet: quiet);

  /// Instant feedback for a tap whose fill is committed a moment later
  /// (after the double-tap window): plays the fill sound only.
  void previewFill(int r, int c) {
    if (state.status != GameStatus.playing) return;
    _sound.fill(min(state.combo + 1, SoundService.ladderSize - 1));
  }

  /// Reveals the next logical step (usually a block, sometimes an X) and
  /// keeps the explanation in [GameState.hint]. Returns false if the player
  /// has no hints.
  bool useHint() {
    final slot = _slot;
    if (slot == null || slot.hints <= 0) return false;
    if (state.status != GameStatus.playing) return true;
    final hint = findHint(state.board, seed: _random.nextInt(1 << 30));
    if (hint == null) return true;
    _editSlot((s) => s.copyWith(hints: s.hints - 1));
    _apply(
      hint.row,
      hint.col,
      hint.fill ? MoveAction.fill : MoveAction.cross,
      MarkSource.hint,
      hint: hint,
    );
    return true;
  }

  /// Hides the hint explanation.
  void dismissHint() {
    if (state.hint != null) state = state.copyWith(hint: () => null);
  }

  /// Remembers that this level's tutorial was finished or skipped.
  void finishTutorial() => _editSlot(
    (s) => s.tutorials.contains(puzzle.id)
        ? s
        : s.copyWith(tutorials: {...s.tutorials, puzzle.id}),
  );

  void grantHint() => _editSlot((s) => s.copyWith(hints: s.hints + 1));

  void grantLife() {
    state = state.copyWith(lives: state.lives + 1, status: GameStatus.playing);
    _saveSnapshot();
  }

  void restart() {
    state = _fresh();
    _saveSnapshot();
  }

  bool _apply(
    int r,
    int c,
    MoveAction action,
    MarkSource source, {
    int step = 0,
    bool quiet = false,
    Hint? hint,
  }) {
    if (state.status != GameStatus.playing) return false;
    final result = state.board.apply(r, c, action, source: source);
    if (!result.changed) return true;

    final lives = result.mistake ? state.lives - 1 : state.lives;
    final status = result.solved
        ? GameStatus.won
        : lives <= 0
        ? GameStatus.outOfLives
        : GameStatus.playing;

    // Scoring: hints are free but earn nothing; a mistake breaks the streak.
    final scored = action == MoveAction.fill && source == MarkSource.user;
    var combo = state.combo;
    final oldMultiplier = state.multiplier;
    var points = 0;
    if (result.mistake) {
      combo = 0;
    } else if (scored) {
      combo++;
      points += Scoring.fill(combo);
      final lineCount =
          result.completedRows.length + result.completedCols.length;
      if (lineCount > 0) points += Scoring.lines(lineCount, combo);
    }
    final mistakes = state.mistakes + (result.mistake ? 1 : 0);
    if (result.solved) {
      points += Scoring.levelBonus(lives: lives, mistakes: mistakes);
    }
    final score = state.score + points;

    state = GameState(
      board: result.board,
      lives: lives,
      status: status,
      score: score,
      combo: combo,
      mistakes: mistakes,
      hint: hint,
      fx: MoveFx(
        seq: (state.fx?.seq ?? 0) + 1,
        row: r,
        col: c,
        mistake: result.mistake,
        hint: source == MarkSource.hint,
        completedRows: result.completedRows,
        completedCols: result.completedCols,
        solved: result.solved,
        points: points,
      ),
    );

    _playSound(
      action,
      source,
      step: step,
      quiet: quiet,
      mistake: result.mistake,
      line: result.completedRows.isNotEmpty || result.completedCols.isNotEmpty,
      solved: result.solved,
      combo: combo,
      comboUp: Scoring.multiplier(combo) > oldMultiplier,
    );

    if (status == GameStatus.won) {
      _editSlot(
        (s) => s.copyWith(
          completed: {...s.completed, puzzle.id},
          stars: {
            ...s.stars,
            puzzle.id: max(s.stars[puzzle.id] ?? 0, Scoring.stars(mistakes)),
          },
          unlockedLevel: max(s.unlockedLevel, puzzle.id + 1),
          totalScore: s.totalScore + score,
          snapshot: () => null,
        ),
      );
    } else {
      _saveSnapshot();
    }
    // A drag keeps going through mistakes; each one costs a life.
    return status == GameStatus.playing;
  }

  void _playSound(
    MoveAction action,
    MarkSource source, {
    required int step,
    required bool quiet,
    required bool mistake,
    required bool line,
    required bool solved,
    required int combo,
    required bool comboUp,
  }) {
    final sound = _sound;
    if (solved) return sound.win();
    if (mistake) return sound.mistake();
    if (source == MarkSource.hint) return sound.hint();
    // A lone tap rises with the combo, a drag rises with its length.
    final rung = step > 0 ? step : min(combo, SoundService.ladderSize - 1);
    if (action != MoveAction.fill) return sound.cross(step);
    if (!quiet) sound.fill(rung);
    if (line) sound.line();
    if (comboUp) sound.combo();
  }

  void _saveSnapshot() => _editSlot(
    (s) => s.copyWith(
      snapshot: () => LevelSnapshot(
        levelId: puzzle.id,
        cells: state.board.encode(),
        lives: state.lives,
        score: state.score,
        mistakes: state.mistakes,
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
