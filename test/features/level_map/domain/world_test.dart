import 'dart:convert';
import 'dart:io';

import 'package:block_puzzle/app/theme.dart';
import 'package:block_puzzle/core/localized_text.dart';
import 'package:block_puzzle/features/level_map/domain/map_layout.dart';
import 'package:block_puzzle/features/level_map/domain/world.dart';
import 'package:block_puzzle/features/levels/level_repository.dart';
import 'package:block_puzzle/features/progress/slot_data.dart';
import 'package:flutter_test/flutter_test.dart';

WorldCatalog _catalog(List<int> sizes) => WorldCatalog.fromJson({
  'worlds': [
    for (final (i, n) in sizes.indexed)
      {'id': 'w$i', 'name': 'World $i', 'theme': 'sunset', 'levels': n},
  ],
});

void main() {
  group('WorldCatalog', () {
    final catalog = _catalog([3, 5, 2]);

    test('gives each world the next run of levels', () {
      expect(catalog.worlds.map((w) => (w.firstLevel, w.lastLevel)), [
        (1, 3),
        (4, 8),
        (9, 10),
      ]);
      expect(catalog.plannedLevelCount, 10);
      expect(catalog.worlds[1].levels, [4, 5, 6, 7, 8]);
    });

    test('finds the world of a level', () {
      expect(catalog.worldOf(1).index, 1);
      expect(catalog.worldOf(3).index, 1);
      expect(catalog.worldOf(4).index, 2);
      expect(catalog.worldOf(10).index, 3);
      expect(catalog.worldOf(99).index, 3, reason: 'past the end → last');
    });

    test('navigates by index', () {
      expect(catalog.byIndex(0), isNull);
      expect(catalog.byIndex(4), isNull);
      expect(catalog.after(catalog.worlds[0])?.index, 2);
      expect(catalog.after(catalog.worlds[2]), isNull);
      expect(catalog.before(catalog.worlds[0]), isNull);
    });

    test('rejects broken catalogs', () {
      expect(() => WorldCatalog(const []), throwsFormatException);
      expect(() => _catalog([3, 0]), throwsFormatException);
      expect(
        () => WorldCatalog(const [
          World(
            index: 1,
            id: 'a',
            name: LocalizedText({'en': 'A'}),
            theme: 'sunset',
            firstLevel: 2,
            levelCount: 3,
          ),
        ]),
        throwsFormatException,
      );
      expect(
        () => WorldCatalog.fromJson(const {
          'worlds': [
            {'id': 'x', 'name': 'X', 'theme': 't', 'levels': 1},
            {'id': 'x', 'name': 'Y', 'theme': 't', 'levels': 1},
          ],
        }),
        throwsFormatException,
      );
    });

    test('counts progress and stars inside a world', () {
      final w = catalog.worlds[1];
      expect(w.completedIn({1, 2, 4, 5, 9}), 2);
      expect(w.starsIn({1: 3, 4: 2, 6: 1}), 3);
      expect(w.maxStars, 15);
    });
  });

  group('worldAccess', () {
    final catalog = _catalog([3, 3, 3]);
    WorldAccess access(int world, int unlocked, {int shipped = 9}) =>
        worldAccess(
          catalog.worlds[world - 1],
          unlockedLevel: unlocked,
          shippedLevels: shipped,
        );

    test('a world opens once the previous one is finished', () {
      expect(access(1, 1), WorldAccess.open);
      expect(access(2, 3), WorldAccess.locked);
      expect(access(2, 4), WorldAccess.open);
      expect(access(3, 4), WorldAccess.locked);
    });

    test('worlds without shipped levels are coming soon', () {
      expect(access(2, 4, shipped: 3), WorldAccess.comingSoon);
      expect(access(3, 1, shipped: 3), WorldAccess.comingSoon);
      expect(access(2, 4, shipped: 4), WorldAccess.open);
    });

    test('current level is capped to shipped levels', () {
      expect(currentLevel(unlockedLevel: 2, shippedLevels: 3), 2);
      expect(currentLevel(unlockedLevel: 4, shippedLevels: 3), 3);
    });
  });

  group('MapLayout', () {
    const layout = MapLayout(count: 20, width: 400);

    test('climbs from the bottom to the top, inside the width', () {
      for (var i = 0; i < 20; i++) {
        final p = layout.node(i);
        expect(p.x, inInclusiveRange(40, 360));
        expect(p.y, inInclusiveRange(0, layout.height));
        if (i > 0) expect(p.y, lessThan(layout.node(i - 1).y));
      }
      expect(layout.start.y, greaterThan(layout.node(0).y));
      expect(layout.goal.y, lessThan(layout.node(19).y));
      expect(layout.goal.y, greaterThan(0));
      expect(layout.pathPoints, hasLength(22));
    });

    test('scroll offset centres a node and never goes negative', () {
      expect(layout.offsetFor(0, 800), 0);
      final top = layout.offsetFor(19, 800);
      expect(top, closeTo(layout.height - layout.node(19).y - 400, 1e-9));
    });
  });

  group('worlds.json', () {
    final catalog = WorldCatalog.fromJson(
      jsonDecode(File('assets/worlds/worlds.json').readAsStringSync())
          as Map<String, Object?>,
    );

    test('plans the full game and covers every shipped level', () {
      expect(catalog.plannedLevelCount, 200);
      expect(
        catalog.plannedLevelCount,
        greaterThanOrEqualTo(LevelRepository.levelCount),
      );
    });

    test('uses only defined themes', () {
      for (final world in catalog.worlds) {
        expect(
          AppColors.worldThemes.containsKey(world.theme),
          isTrue,
          reason: '${world.id} uses unknown theme "${world.theme}"',
        );
      }
    });
  });

  test('SlotData keeps stars and reads old saves without them', () {
    const slot = SlotData(name: 'A', colorIndex: 0, stars: {1: 3, 12: 2});
    final back = SlotData.fromJson(
      jsonDecode(jsonEncode(slot.toJson())) as Map<String, Object?>,
    );
    expect(back.stars, {1: 3, 12: 2});

    final old = slot.toJson()..remove('stars');
    expect(SlotData.fromJson(old).stars, isEmpty);
  });
}
