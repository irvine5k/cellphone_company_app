import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:telzir_app/src/widgets/call_button.dart';

void main() {
  testWidgets(
    'When create call button'
    'Should contains the correct values',
    (tester) async {
      await _createPage(tester);

      expect(find.text('FAZER CHAMADA'), findsOneWidget);
      expect(find.byType(Icon), findsOneWidget);
    },
  );
}

Future<void> _createPage(WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Row(
        children: <Widget>[
          CallButton(
            onTap: () {},
          ),
        ],
      ),
    ),
  );

  await tester.pump();
}
