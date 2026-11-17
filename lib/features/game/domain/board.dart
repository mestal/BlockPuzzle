import 'package:block_puzzle/features/game/domain/puzzle.dart';
import 'package:meta/meta.dart';

enum CellMark { empty, filled, crossed }

/// Who produced a mark. Drives how the cell is drawn.
enum MarkSource { user, auto, mistake, hint }

/// What the player tried to do on a cell. [erase] removes a manual X.
enum MoveAction { fill, cross, erase }

@immutable
final class Cell {
  const Cell(this.mark, [this.source = MarkSource.user]);

  static const empty = Cell(CellMark.empty);

  final CellMark mark;
  final MarkSource source;

  /// Whether the cell carries any mark.
  bool get isOpen => mark != CellMark.empty;

  /// Whether this is an X the player placed (and may remove again).
  bool get isUserCross => mark == CellMark.crossed && source == MarkSource.user;

  /// A cell the player can no longer change. A plain user X is only a note
  /// (it may sit on a filled cell): it can be removed, but a tap does not
  /// fill over it - the player has to take the X away first.
  bool get isLocked =>
      mark == CellMark.filled ||
      (mark == CellMark.crossed && source != MarkSource.user);

  @override
  bool operator ==(Object other) =>
      other is Cell && other.mark == mark && other.source == source;

  @override
  int get hashCode => Object.hash(mark, source);
}

/// Result of applying one move to the board.
@immutable
final class MoveResult {
  const MoveResult({
    required this.board,
    this.changed = false,
    this.mistake = false,
    this.completedRows = const [],
    this.completedCols = const [],
    this.solved = false,
  });

  final Board board;
  final bool changed;
  final bool mistake;
  final List<int> completedRows;
  final List<int> completedCols;
  final bool solved;
}

/// Immutable board state for one puzzle. All rules live here.
@immutable
final class Board {
  const Board._(this.puzzle, this.cells, this.solvedRows, this.solvedCols);

  /// A fresh board. Lines whose clue is empty are crossed out automatically.
  factory Board.start(Puzzle puzzle) {
    final cells = List.filled(puzzle.rows * puzzle.cols, Cell.empty);
    final solvedRows = <int>{};
    final solvedCols = <int>{};
    for (var r = 0; r < puzzle.rows; r++) {
      if (puzzle.rowClues[r].isEmpty) {
        solvedRows.add(r);
        for (var c = 0; c < puzzle.cols; c++) {
          cells[r * puzzle.cols + c] = const Cell(
            CellMark.crossed,
            MarkSource.auto,
          );
        }
      }
    }
    for (var c = 0; c < puzzle.cols; c++) {
      if (puzzle.colClues[c].isEmpty) {
        solvedCols.add(c);
        for (var r = 0; r < puzzle.rows; r++) {
          cells[r * puzzle.cols + c] = const Cell(
            CellMark.crossed,
            MarkSource.auto,
          );
        }
      }
    }
    return Board._(puzzle, List.unmodifiable(cells), solvedRows, solvedCols);
  }

  /// Restores a board from [encode]. Falls back to a fresh board when the
  /// snapshot does not fit the puzzle.
  factory Board.decode(Puzzle puzzle, String encoded) {
    if (encoded.length != puzzle.rows * puzzle.cols) {
      return Board.start(puzzle);
    }
    final cells = [for (final ch in encoded.split('')) _decodeCell(ch)];
    final board = Board._(puzzle, List.unmodifiable(cells), const {}, const {});
    final rows = {
      for (var r = 0; r < puzzle.rows; r++)
        if (board._rowDone(r)) r,
    };
    final cols = {
      for (var c = 0; c < puzzle.cols; c++)
        if (board._colDone(c)) c,
    };
    // A board saved mid-drag may still owe the X marks of finished lines.
    return Board._(puzzle, board.cells, rows, cols).settled();
  }

  final Puzzle puzzle;
  final List<Cell> cells;
  final Set<int> solvedRows;
  final Set<int> solvedCols;

  Cell at(int r, int c) => cells[r * puzzle.cols + c];

  bool get isSolved => _filledCorrect == puzzle.filledCount;

  int get _filledCorrect =>
      cells.where((cell) => cell.mark == CellMark.filled).length;

  /// Filling is checked against the solution immediately: filling an empty
  /// cell is a mistake and leaves a [MarkSource.mistake] X. Crossing is never
  /// a mistake - an X is just a note and may be wrong; it is replaced by an
  /// automatic X once its line is complete. A player's own X blocks the
  /// player's fills (it must be erased first); a hint may fill over it.
  ///
  /// With [settle] false a finished line is reported (and counted as solved)
  /// but its remaining cells are left open until [settled] is called: while
  /// the player's finger is still dragging, the cells it reaches next are
  /// real fill attempts, not free X marks.
  MoveResult apply(
    int r,
    int c,
    MoveAction action, {
    MarkSource source = MarkSource.user,
    bool settle = true,
  }) {
    final existing = at(r, c);
    if (existing.isLocked || isSolved) return MoveResult(board: this);

    final cells = [...this.cells];
    if (action == MoveAction.erase) {
      if (existing.mark != CellMark.crossed) return MoveResult(board: this);
      cells[r * puzzle.cols + c] = Cell.empty;
      return MoveResult(
        board: Board._(
          puzzle,
          List.unmodifiable(cells),
          solvedRows,
          solvedCols,
        ),
        changed: true,
      );
    }
    if (action == MoveAction.cross) {
      if (existing.isOpen) return MoveResult(board: this);
      cells[r * puzzle.cols + c] = Cell(CellMark.crossed, source);
      return MoveResult(
        board: Board._(
          puzzle,
          List.unmodifiable(cells),
          solvedRows,
          solvedCols,
        ),
        changed: true,
      );
    }

    if (existing.isUserCross && source == MarkSource.user) {
      return MoveResult(board: this);
    }
    final shouldFill = puzzle.isFilled(r, c);
    cells[r * puzzle.cols + c] = Cell(
      shouldFill ? CellMark.filled : CellMark.crossed,
      shouldFill ? source : MarkSource.mistake,
    );
    var next = Board._(puzzle, cells, solvedRows, solvedCols);

    final completedRows = <int>[];
    final completedCols = <int>[];
    if (!solvedRows.contains(r) && next._rowDone(r)) completedRows.add(r);
    if (!solvedCols.contains(c) && next._colDone(c)) completedCols.add(c);

    if (settle) {
      for (final row in completedRows) {
        for (var col = 0; col < puzzle.cols; col++) {
          _autoCross(cells, row, col);
        }
      }
      for (final col in completedCols) {
        for (var row = 0; row < puzzle.rows; row++) {
          _autoCross(cells, row, col);
        }
      }
    }

    next = Board._(
      puzzle,
      List.unmodifiable(cells),
      {...solvedRows, ...completedRows},
      {...solvedCols, ...completedCols},
    );

    final solved = next.isSolved;
    if (solved) {
      for (var row = 0; row < puzzle.rows; row++) {
        for (var col = 0; col < puzzle.cols; col++) {
          _autoCross(cells, row, col);
        }
      }
      next = Board._(
        puzzle,
        List.unmodifiable(cells),
        {for (var i = 0; i < puzzle.rows; i++) i},
        {for (var i = 0; i < puzzle.cols; i++) i},
      );
    }

    return MoveResult(
      board: next,
      changed: true,
      mistake: !shouldFill,
      completedRows: completedRows,
      completedCols: completedCols,
      solved: solved,
    );
  }

  /// Crosses out the open cells of every finished line (those left open by
  /// `apply(settle: false)`). Returns this board when nothing changes.
  Board settled() {
    final cells = [...this.cells];
    for (final row in solvedRows) {
      for (var col = 0; col < puzzle.cols; col++) {
        _autoCross(cells, row, col);
      }
    }
    for (final col in solvedCols) {
      for (var row = 0; row < puzzle.rows; row++) {
        _autoCross(cells, row, col);
      }
    }
    for (var i = 0; i < cells.length; i++) {
      if (cells[i] != this.cells[i]) {
        return Board._(
          puzzle,
          List.unmodifiable(cells),
          solvedRows,
          solvedCols,
        );
      }
    }
    return this;
  }

  /// A random filled cell the player has not found yet, or null.
  (int, int)? hintCell(int seed) {
    final candidates = <(int, int)>[
      for (var r = 0; r < puzzle.rows; r++)
        for (var c = 0; c < puzzle.cols; c++)
          if (puzzle.isFilled(r, c) && at(r, c).mark != CellMark.filled) (r, c),
    ];
    if (candidates.isEmpty) return null;
    return candidates[seed % candidates.length];
  }

  String encode() => cells.map(_encodeCell).join();

  bool _rowDone(int r) => [
    for (var c = 0; c < puzzle.cols; c++) c,
  ].every((c) => !puzzle.isFilled(r, c) || at(r, c).mark == CellMark.filled);

  bool _colDone(int c) => [
    for (var r = 0; r < puzzle.rows; r++) r,
  ].every((r) => !puzzle.isFilled(r, c) || at(r, c).mark == CellMark.filled);

  void _autoCross(List<Cell> cells, int r, int c) {
    final i = r * puzzle.cols + c;
    final cell = cells[i];
    if (!cell.isOpen || (cell.mark == CellMark.crossed && !cell.isLocked)) {
      cells[i] = const Cell(CellMark.crossed, MarkSource.auto);
    }
  }

  static String _encodeCell(Cell cell) => switch ((cell.mark, cell.source)) {
    (CellMark.empty, _) => '.',
    (CellMark.filled, MarkSource.hint) => 'H',
    (CellMark.filled, MarkSource.mistake) => 'M',
    (CellMark.filled, _) => 'F',
    (CellMark.crossed, MarkSource.auto) => 'a',
    (CellMark.crossed, MarkSource.mistake) => 'm',
    (CellMark.crossed, MarkSource.hint) => 'h',
    (CellMark.crossed, _) => 'x',
  };

  static Cell _decodeCell(String ch) => switch (ch) {
    'F' => const Cell(CellMark.filled),
    'H' => const Cell(CellMark.filled, MarkSource.hint),
    'M' => const Cell(CellMark.filled, MarkSource.mistake),
    'x' => const Cell(CellMark.crossed),
    'a' => const Cell(CellMark.crossed, MarkSource.auto),
    'm' => const Cell(CellMark.crossed, MarkSource.mistake),
    'h' => const Cell(CellMark.crossed, MarkSource.hint),
    _ => Cell.empty,
  };
}
