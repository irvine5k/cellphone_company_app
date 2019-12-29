import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:telzir_app/src/widgets/call_button.dart';
import 'package:telzir_app/src/widgets/custom_app_bar.dart';

void main() {
  testWidgets(
    'When create app bar without back button'
    'Should contains the correct values',
    (tester) async {
      await _createPage(tester, false);

      expect(find.text('TELZIR'), findsOneWidget);
      expect(find.byType(IconButton), findsNothing);
    },
  );

  testWidgets(
    'When create app bar with back button'
    'Should contains the correct values',
    (tester) async {
      await _createPage(tester, true);

      expect(find.text('TELZIR'), findsOneWidget);
      expect(find.byType(IconButton), findsOneWidget);
    },
  );
}

Future<void> _createPage(WidgetTester tester, bool backButton) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Material(
          child: CustomAppBar(
        'TELZIR',
        backButton: backButton,
      )),
    ),
  );

  await tester.pump();
}
