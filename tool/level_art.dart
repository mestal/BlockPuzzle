// Pixel art for the generated levels (see `generate_levels.dart`).
//
// Each picture is drawn with one letter per cell ('.' = empty) using the
// shared [artPalette]. Names follow [artLanguages] order (tr, en, de, fr,
// es, it, zh, ja, ru, ar, pt, pl, el, bg, ko, hi). Pictures are grouped by
// the world they belong to; the generator orders them by size and
// difficulty.
import 'art/w01_sunset.dart';
import 'art/w02_beach.dart';
import 'art/w03_forest.dart';
import 'art/w04_candy.dart';
import 'art/w05_desert.dart';
import 'art/w06_snow.dart';
import 'art/w07_reef.dart';
import 'art/w08_volcano.dart';
import 'art/w09_clouds.dart';
import 'art/w10_space.dart';
import 'art/w11_blossom.dart';
import 'art/w12_city.dart';
import 'art/w13_kitchen.dart';
import 'art/w14_farm.dart';
import 'art/w15_toys.dart';
import 'art/w16_kingdom.dart';
import 'art/w17_jungle.dart';
import 'art/w18_ruins.dart';
import 'art/w19_haunted.dart';
import 'art/w20_savanna.dart';
import 'art/w21_garden.dart';
import 'art/w22_carnival.dart';
import 'art/w23_pirate.dart';
import 'art/w24_sports.dart';
import 'art/w25_wonders.dart';

final class LevelArt {
  const LevelArt(this.world, this.names, this.pixels, {this.pinned = false});

  /// 1-based index of the world (map) in `assets/worlds/worlds.json`.
  final int world;

  /// One name per language, in [artLanguages] order.
  final List<String> names;
  final List<String> pixels;

  /// Kept at the start of its world in listed order instead of being
  /// sorted by difficulty (levels 1 and 2 carry the tutorial).
  final bool pinned;
}

/// Compact form used by worlds 11+: [names] joined with `|` in
/// [artLanguages] order.
LevelArt art(int world, String names, List<String> pixels) =>
    LevelArt(world, names.split('|'), pixels);

/// Order of [LevelArt.names]. New languages are appended at the end.
const artLanguages = [
  'tr', 'en', 'de', 'fr', 'es', 'it', 'zh', 'ja', 'ru', 'ar', 'pt', //
  'pl', 'el', 'bg', 'ko', 'hi', //
];

const artPalette = <String, String>{
  'A': '#F59E0B', // amber / gold
  'B': '#3B82F6', // blue
  'C': '#22D3EE', // cyan
  'D': '#15803D', // dark green
  'E': '#94A3B8', // grey
  'F': '#FBCFA5', // peach / skin
  'G': '#22C55E', // green
  'H': '#5B3410', // dark brown
  'I': '#BAE6FD', // ice blue
  'J': '#FBCFE8', // light pink
  'K': '#1F2937', // near black
  'L': '#E2E8F0', // light grey
  'M': '#DB2777', // magenta
  'N': '#1E3A8A', // navy
  'O': '#F97316', // orange
  'P': '#F472B6', // pink
  'Q': '#0D9488', // teal
  'R': '#E8453C', // red
  'S': '#FDE68A', // sand
  'T': '#92400E', // brown
  'U': '#5B21B6', // deep purple
  'V': '#8B5CF6', // violet
  'W': '#FFFFFF', // white
  'X': '#991B1B', // dark red
  'Y': '#FACC15', // yellow
  'Z': '#A3E635', // lime
};

final levelArt = <LevelArt>[
  ...sunsetArt,
  ...beachArt,
  ...forestArt,
  ...candyArt,
  ...desertArt,
  ...snowArt,
  ...reefArt,
  ...volcanoArt,
  ...cloudsArt,
  ...spaceArt,
  ...blossomArt,
  ...cityArt,
  ...kitchenArt,
  ...farmArt,
  ...toysArt,
  ...kingdomArt,
  ...jungleArt,
  ...ruinsArt,
  ...hauntedArt,
  ...savannaArt,
  ...gardenArt,
  ...carnivalArt,
  ...pirateArt,
  ...sportsArt,
  ...wondersArt,
];
