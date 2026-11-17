import 'package:block_puzzle/features/progress/progress_repository.dart';
import 'package:block_puzzle/features/progress/slot_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final progressRepositoryProvider = Provider<ProgressRepository>(
  (ref) => SharedPrefsProgressRepository(),
);

/// All three player slots (null = empty).
class SlotsController extends AsyncNotifier<List<SlotData?>> {
  @override
  Future<List<SlotData?>> build() =>
      ref.watch(progressRepositoryProvider).loadAll();

  Future<void> create(int index, {required String name, required int color}) =>
      _write(index, SlotData(name: name, colorIndex: color));

  Future<void> delete(int index) => _write(index, null);

  /// Applies [change] to the slot at [index] and persists it.
  Future<void> edit(int index, SlotData Function(SlotData) change) async {
    final current = state.requireValue[index];
    if (current == null) return;
    await _write(index, change(current));
  }

  Future<void> _write(int index, SlotData? slot) async {
    final slots = [...state.requireValue];
    slots[index] = slot;
    state = AsyncData(slots);
    await ref.read(progressRepositoryProvider).save(index, slot);
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
