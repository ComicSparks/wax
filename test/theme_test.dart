import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wax/configs/themes.dart';

void main() {
  testWidgets('pink titles stay white and dividers stay hairline', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: lightTheme,
        home: Scaffold(
          appBar: AppBar(title: const Text('标题')),
          body: const Column(children: [Divider(), Text('正文')]),
        ),
      ),
    );

    final title = tester.widget<RichText>(
      find.descendant(of: find.text('标题'), matching: find.byType(RichText)),
    );
    expect(title.text.style?.color, Colors.white);

    final context = tester.element(find.byType(Divider));
    final side = Divider.createBorderSide(context);
    expect(Theme.of(context).useMaterial3, isFalse);
    expect(side.width, 0);
    expect(side.color, Colors.grey.shade200);
  });
}
