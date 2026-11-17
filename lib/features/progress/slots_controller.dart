import 'dart:async';

import 'package:block_puzzle/features/progress/progress_repository.dart';
import 'package:block_puzzle/features/progress/slot_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final progressRepositoryProvider = Provider<ProgressRepository>(
  (ref) => SharedPrefsProgressRepository(),
);

/// All three player slots (null = empty).
///
/// [edit] updates the state at once but writes to disk after
/// [saveDelay]: a drag edits the slot on every cell and writing each step
/// would flood the platform channel. [flush] writes pending edits now (the
/// app calls it when it goes to the background).
class SlotsController extends AsyncNotifier<List<SlotData?>> {
  static const saveDelay = Duration(milliseconds: 600);

  final _pending = <int, Timer>{};

  @override
  Future<List<SlotData?>> build() {
    final repository = ref.watch(progressRepositoryProvider);
    ref.onDispose(() {
      // Last chance to keep pending edits; `ref` is unusable from here on.
      final slots = state.value;
      for (final index in [..._pending.keys]) {
        _pending.remove(index)?.cancel();
        if (slots != null) unawaited(repository.save(index, slots[index]));
      }
    });
    return repository.loadAll();
  }

  Future<void> create(int index, {required String name, required int color}) =>
      _write(index, SlotData(name: name, colorIndex: color));

  Future<void> delete(int index) => _write(index, null);

  /// Applies [change] to the slot at [index] and persists it.
  Future<void> edit(int index, SlotData Function(SlotData) change) async {
    final current = state.requireValue[index];
    if (current == null) return;
    _set(index, change(current));
    _pending[index]?.cancel();
    _pending[index] = Timer(saveDelay, () => unawaited(_persist(index)));
  }

  /// Writes every pending edit now.
  Future<void> flush() async {
    final indexes = [..._pending.keys];
    for (final index in indexes) {
      await _persist(index);
    }
  }

  Future<void> _write(int index, SlotData? slot) async {
    _set(index, slot);
    await _persist(index);
  }

  void _set(int index, SlotData? slot) {
    final slots = [...state.requireValue];
    slots[index] = slot;
    state = AsyncData(slots);
  }

  Future<void> _persist(int index) async {
    _pending.remove(index)?.cancel();
    final slots = state.value;
    if (slots == null) return;
    await ref.read(progressRepositoryProvider).save(index, slots[index]);
  }
}

final slotsProvider = AsyncNotifierProvider<SlotsController, List<SlotData?>>(
  SlotsController.new,
);

/// Index of the slot currently playing.
class ActiveSlotIndex extends Notifier<int?> {
  @override
  int? build() => null;

  int? get index => state;
  set index(int? value) => state = value;
}

final activeSlotIndexProvider = NotifierProvider<ActiveSlotIndex, int?>(
  ActiveSlotIndex.new,
);

/// The active player's data, or null when no slot is chosen.
final activeSlotProvider = Provider<SlotData?>((ref) {
  final index = ref.watch(activeSlotIndexProvider);
  final slots = ref.watch(slotsProvider).value;
  if (index == null || slots == null) return null;
  return slots[index];
});
