import 'package:block_puzzle/core/localized_text.dart';
import 'package:meta/meta.dart';

/// One map ("world") of the level journey: a themed region holding a
/// contiguous run of levels. Worlds unlock one after another.
@immutable
final class World {
  const World({
    required this.index,
    required this.id,
    required this.name,
    required this.theme,
    required this.firstLevel,
    required this.levelCount,
  });

  /// 1-based position in the catalog.
  final int index;

  /// Stable identifier (never shown to the player).
  final String id;

  /// Display name per language; like level names it lives in the data file.
  final LocalizedText name;

  /// Key of the visual theme in `AppColors.worldThemes`.
  final String theme;
  final int firstLevel;
  final int levelCount;

  int get lastLevel => firstLevel + levelCount - 1;

  bool contains(int level) => level >= firstLevel && level <= lastLevel;

  List<int> get levels => [for (var i = 0; i < levelCount; i++) firstLevel + i];

  /// How many of this world's levels are in [completed].
  int completedIn(Set<int> completed) =>
      levels.where(completed.contains).length;

  /// Stars collected in this world.
  int starsIn(Map<int, int> stars) =>
      levels.fold(0, (sum, level) => sum + (stars[level] ?? 0));

  int get maxStars => levelCount * 3;
}

/// All worlds in play order. Levels are numbered globally and each world
/// takes the next `levels` of them, so adding a world is one new JSON entry.
@immutable
final class WorldCatalog {
  WorldCatalog(List<World> worlds) : worlds = List.unmodifiable(worlds) {
    if (worlds.isEmpty) throw const FormatException('No worlds defined');
    var expected = 1;
    for (final (i, w) in worlds.indexed) {
      if (w.index != i + 1 || w.firstLevel != expected || w.levelCount < 1) {
        throw FormatException('World ${w.id} breaks the level sequence');
      }
      expected = w.lastLevel + 1;
    }
    if (worlds.map((w) => w.id).toSet().length != worlds.length) {
      throw const FormatException('World ids must be unique');
    }
  }

  factory WorldCatalog.fromJson(Map<String, Object?> json) {
    final worlds = <World>[];
    var next = 1;
    for (final (i, raw) in (json['worlds']! as List).indexed) {
      final w = raw as Map<String, Object?>;
      final count = w['levels']! as int;
      worlds.add(
        World(
          index: i + 1,
          id: w['id']! as String,
          name: LocalizedText.fromJson(w['name']),
          theme: w['theme']! as String,
          firstLevel: next,
          levelCount: count,
        ),
      );
      next += count;
    }
    return WorldCatalog(worlds);
  }

  final List<World> worlds;

  /// Total levels the catalog has room for (shipped or not).
  int get plannedLevelCount => worlds.last.lastLevel;

  /// The world holding [level]; levels past the end map to the last world.
  World worldOf(int level) => worlds.firstWhere(
    (w) => level <= w.lastLevel,
    orElse: () => worlds.last,
  );

  /// World by 1-based [index], or null when out of range.
  World? byIndex(int index) =>
      index >= 1 && index <= worlds.length ? worlds[index - 1] : null;

  World? after(World world) => byIndex(world.index + 1);
  World? before(World world) => byIndex(world.index - 1);
}

/// Where a world stands for one player.
enum WorldAccess {
  /// Open and at least one of its levels is shipped.
  open,

  /// The previous world is not finished yet.
  locked,

  /// Reached, but none of its levels are shipped yet.
  comingSoon,
}

/// Access to [world] for a player who may open levels up to [unlockedLevel],
/// when [shippedLevels] levels exist in the game.
WorldAccess worldAccess(
  World world, {
  required int unlockedLevel,
  required int shippedLevels,
}) {
  if (world.firstLevel > shippedLevels) return WorldAccess.comingSoon;
  if (unlockedLevel < world.firstLevel) return WorldAccess.locked;
  return WorldAccess.open;
}

/// The level the player should play next: the highest unlocked one, capped
/// to what has shipped.
int currentLevel({required int unlockedLevel, required int shippedLevels}) =>
    unlockedLevel.clamp(1, shippedLevels);
