import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:telzir_app/src/widgets/add_minutes_button.dart';

void main() {
  testWidgets(
    'When add minutes button'
    'Should contains the correct values',
    (tester) async {
      await _createPage(tester);

      expect(find.text('+10'), findsOneWidget);
    },
  );
}

Future<void> _createPage(WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Row(
        children: <Widget>[
          AddMinutesButton(
            onTap: (minutes) {},
            minutes: 10,
          ),
        ],
      ),
    ),
  );

  await tester.pump();
}
