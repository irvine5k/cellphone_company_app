import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:telzir_app/src/models/call_model.dart';
import 'package:telzir_app/src/pages/home_page.dart';
import 'package:telzir_app/src/pages/result_page.dart';
import 'package:telzir_app/src/utils/plan_type.dart';
import 'package:telzir_app/src/widgets/add_minutes_button.dart';
import 'package:telzir_app/src/widgets/call_button.dart';

void main() {
  testWidgets(
    'When create home page'
    'Should contains the correct widgets',
    (tester) async {
      await _createPage(tester);

      expect(find.text('TELZIR'), findsOneWidget);
      expect(find.byType(IconButton), findsOneWidget);
      expect(find.text('SEM PLANO'), findsOneWidget);
      expect(find.text('COM PLANO'), findsOneWidget);
      expect(find.text('R\$ 38.0'), findsOneWidget);
      expect(find.text('R\$ 0.0'), findsOneWidget);
      
    },
  );
}

Future<void> _createPage(WidgetTester tester) async {
  final model = CallModel(
    from: '011',
    to: '016',
    minutes: 20,
    planType: PlanType.faleMais30,
  );

  await tester.pumpWidget(
    MaterialApp(
      home: ResultPage(callModel: model),
    ),
  );

  await tester.pump();
}
