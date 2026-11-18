import 'package:block_puzzle/features/settings/presentation/settings_sheet.dart';
import 'package:block_puzzle/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Future<List<String?>> pick(
    WidgetTester tester, {
    required String? current,
    required String tap,
  }) async {
    final picked = <String?>[];
    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: LanguageDropdown(value: current, onChanged: picked.add),
        ),
      ),
    );
    await tester.tap(find.byType(LanguageDropdown));
    await tester.pumpAndSettle();
    // The open menu scrolls to the current choice; scroll back to the top.
    await tester.drag(find.byType(Scrollable).last, const Offset(0, 2000));
    await tester.pumpAndSettle();
    // The menu is long and builds lazily: scroll down to the wanted entry.
    await tester.scrollUntilVisible(
      find.text(tap),
      100,
      scrollable: find.byType(Scrollable).last,
    );
    await tester.tap(find.text(tap).last);
    await tester.pumpAndSettle();
    return picked;
  }

  testWidgets('picks a language from the menu', (tester) async {
    expect(await pick(tester, current: null, tap: 'Polski'), ['pl']);
  });

  testWidgets('device language maps back to null', (tester) async {
    expect(await pick(tester, current: 'de', tap: 'Device language'), [null]);
  });
}
