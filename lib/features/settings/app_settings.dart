import 'dart:async';
import 'dart:convert';

import 'package:block_puzzle/core/languages.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Device-wide preferences (shared by all player slots).
@immutable
final class AppSettings {
  const AppSettings({this.language, this.sound = true});

  factory AppSettings.fromJson(Map<String, Object?> json) {
    final language = json['language'] as String?;
    return AppSettings(
      language: supportedLanguages.containsKey(language) ? language : null,
      sound: json['sound'] as bool? ?? true,
    );
  }

  /// Chosen language code, or null to follow the device language.
  final String? language;
  final bool sound;

  AppSettings copyWith({String? Function()? language, bool? sound}) =>
      AppSettings(
        language: language == null ? this.language : language(),
        sound: sound ?? this.sound,
      );

  Map<String, Object?> toJson() => {'language': language, 'sound': sound};

  @override
  bool operator ==(Object other) =>
      other is AppSettings &&
      other.language == language &&
      other.sound == sound;

  @override
  int get hashCode => Object.hash(language, sound);
}

abstract interface class SettingsRepository {
  Future<AppSettings> load();

  Future<void> save(AppSettings settings);
}

class SharedPrefsSettingsRepository implements SettingsRepository {
  SharedPrefsSettingsRepository([SharedPreferencesAsync? prefs])
    : _prefs = prefs ?? SharedPreferencesAsync();

  final SharedPreferencesAsync _prefs;

  static const _key = 'settings_v1';

  @override
  Future<AppSettings> load() async {
    try {
      final raw = await _prefs.getString(_key);
      if (raw == null) return const AppSettings();
      return AppSettings.fromJson(jsonDecode(raw) as Map<String, Object?>);
    } on Object {
      return const AppSettings();
    }
  }

  @override
  Future<void> save(AppSettings settings) =>
      _prefs.setString(_key, jsonEncode(settings.toJson()));
}

final settingsRepositoryProvider = Provider<SettingsRepository>(
  (ref) => SharedPrefsSettingsRepository(),
);

/// Settings read before `runApp` (see `main.dart`) so the first frame is
/// already in the right language.
final initialSettingsProvider = Provider<AppSettings>(
  (ref) => const AppSettings(),
);

class SettingsController extends Notifier<AppSettings> {
  @override
  AppSettings build() => ref.read(initialSettingsProvider);

  /// [language] null follows the device language.
  void setLanguage(String? language) =>
      _update(state.copyWith(language: () => language));

  void setSound({required bool on}) => _update(state.copyWith(sound: on));

  void _update(AppSettings next) {
    if (next == state) return;
    state = next;
    unawaited(ref.read(settingsRepositoryProvider).save(next));
  }
}

final settingsProvider = NotifierProvider<SettingsController, AppSettings>(
  SettingsController.new,
);
