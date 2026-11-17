import 'dart:convert';
import 'dart:io';

import 'package:block_puzzle/core/languages.dart';
import 'package:block_puzzle/core/localized_text.dart';
import 'package:flutter_test/flutter_test.dart';

Map<String, Object?> _json(String path) =>
    jsonDecode(File(path).readAsStringSync()) as Map<String, Object?>;

void main() {
  test('resolves the device language or falls back to English', () {
    expect(resolveLanguage(['de', 'en']), 'de');
    expect(resolveLanguage(['ja', 'fr']), 'fr');
    expect(resolveLanguage(['ja']), fallbackLanguage);
    expect(resolveLanguage([]), fallbackLanguage);
  });

  test('LocalizedText falls back to English, then to any text', () {
    expect(LocalizedText.fromJson('Plain').of('tr'), 'Plain');
    const text = LocalizedText({'tr': 'Ev', 'en': 'House'});
    expect(text.of('tr'), 'Ev');
    expect(text.of('ja'), 'House');
    expect(const LocalizedText({'tr': 'Ev'}).of('de'), 'Ev');
  });

  test('every language has an ARB file with every key', () {
    Set<String> keys(Map<String, Object?> arb) =>
        arb.keys.where((k) => !k.startsWith('@')).toSet();
    final template = keys(_json('lib/l10n/app_tr.arb'));
    for (final lang in supportedLanguages.keys) {
      final path = 'lib/l10n/app_$lang.arb';
      expect(File(path).existsSync(), isTrue, reason: '$lang has no ARB');
      expect(keys(_json(path)), template, reason: '$path keys differ');
    }
  });

  test('every level and world is named in every language', () {
    final languages = supportedLanguages.keys.toSet();
    final levels = Directory(
      'assets/levels',
    ).listSync().whereType<File>().where((f) => f.path.endsWith('.json'));
    for (final file in levels) {
      final name = _json(file.path)['name']! as Map<String, Object?>;
      expect(name.keys.toSet(), languages, reason: file.path);
    }
    final worlds = _json('assets/worlds/worlds.json')['worlds']! as List;
    for (final world in worlds.cast<Map<String, Object?>>()) {
      final name = world['name']! as Map<String, Object?>;
      expect(name.keys.toSet(), languages, reason: '${world['id']}');
    }
  });
}
