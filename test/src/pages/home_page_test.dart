import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:telzir_app/src/pages/home_page.dart';
import 'package:telzir_app/src/widgets/add_minutes_button.dart';
import 'package:telzir_app/src/widgets/call_button.dart';

void main() {
  testWidgets(
    'When create home page'
    'Should contains the correct widgets',
    (tester) async {
      await _createPage(tester);

      expect(find.text('TELZIR'), findsOneWidget);
      expect(find.text('ORIGEM'), findsOneWidget);
      expect(find.text('DESTINO'), findsOneWidget);
      expect(find.text('PLANOS'), findsOneWidget);
      expect(find.text('MINUTOS'), findsOneWidget);
      expect(find.byType(CallButton), findsOneWidget);
      expect(find.byType(AddMinutesButton), findsWidgets);
    },
  );
}

Future<void> _createPage(WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: HomePage(),
    ),
  );

  await tester.pump();
}
