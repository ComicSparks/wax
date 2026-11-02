import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:wax/main.dart' as app;
import 'package:wax/screens/browser_screen.dart';
import 'package:wax/screens/calculator_screen.dart';
import 'package:wax/screens/settings_screen.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('list and settings open', (tester) async {
    await app.main();
    await _until(
      tester,
      () =>
          find.byType(BrowserScreen).evaluate().isNotEmpty ||
          find.byType(CalculatorScreen).evaluate().isNotEmpty,
    );
    if (find.byType(CalculatorScreen).evaluate().isNotEmpty) {
      for (final key in ['8', '8', '2', '2', '9', '9', '加']) {
        await tester.tap(find.widgetWithText(MaterialButton, key));
        await tester.pump();
      }
      await _until(tester, () => find.byType(BrowserScreen).evaluate().isNotEmpty);
    }
    expect(find.byType(BrowserScreen), findsOneWidget);
    await tester.tap(find.byIcon(Icons.settings));
    await tester.pump();
    await _until(tester, () => find.byType(SettingsScreen).evaluate().isNotEmpty);
    expect(find.byType(SettingsScreen), findsOneWidget);
  });
}

Future<void> _until(WidgetTester tester, bool Function() ready) async {
  for (var i = 0; i < 40; i++) {
    if (ready()) {
      return;
    }
    await tester.pump(const Duration(milliseconds: 500));
  }
  final texts = tester
      .widgetList<Text>(find.byType(Text))
      .map((text) => text.data)
      .whereType<String>()
      .take(30)
      .join(' | ');
  fail('screen did not appear. texts: $texts');
}
