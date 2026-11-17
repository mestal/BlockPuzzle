import 'dart:convert';

import 'package:block_puzzle/features/game/domain/puzzle.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Loads levels from `assets/levels/level_NNN.json`.
class LevelRepository {
  const LevelRepository(this._bundle);

  /// Levels shipped so far (`level_001` … `level_NNN`). The world catalog
  /// (`assets/worlds/worlds.json`) plans room for more.
  static const levelCount = 200;

  final AssetBundle _bundle;

  Future<Puzzle> load(int id) async {
    final path = 'assets/levels/level_${id.toString().padLeft(3, '0')}.json';
    final json = jsonDecode(await _bundle.loadString(path));
    return Puzzle.fromJson(json as Map<String, Object?>);
  }
}

final levelRepositoryProvider = Provider<LevelRepository>(
  (ref) => LevelRepository(rootBundle),
);

final puzzleProvider = FutureProvider.family<Puzzle, int>(
  (ref, id) => ref.watch(levelRepositoryProvider).load(id),
);
