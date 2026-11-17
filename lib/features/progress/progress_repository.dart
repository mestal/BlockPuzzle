import 'dart:convert';

import 'package:block_puzzle/features/progress/slot_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Stores the player slots on the device only.
abstract interface class ProgressRepository {
  static const slotCount = 3;

  Future<List<SlotData?>> loadAll();

  Future<void> save(int index, SlotData? slot);
}

class SharedPrefsProgressRepository implements ProgressRepository {
  SharedPrefsProgressRepository([SharedPreferencesAsync? prefs])
    : _prefs = prefs ?? SharedPreferencesAsync();

  final SharedPreferencesAsync _prefs;

  static String _key(int index) => 'slot_v1_$index';

  @override
  Future<List<SlotData?>> loadAll() async => [
    for (var i = 0; i < ProgressRepository.slotCount; i++) await _load(i),
  ];

  Future<SlotData?> _load(int index) async {
    final raw = await _prefs.getString(_key(index));
    if (raw == null) return null;
    try {
      return SlotData.fromJson(jsonDecode(raw) as Map<String, Object?>);
    } on Object {
      // Corrupt data: treat the slot as empty rather than crashing.
      return null;
    }
  }

  @override
  Future<void> save(int index, SlotData? slot) => slot == null
      ? _prefs.remove(_key(index))
      : _prefs.setString(_key(index), jsonEncode(slot.toJson()));
}
