import 'package:flutter_test/flutter_test.dart';
import 'package:telzir_app/src/utils/plan_type.dart';

void main() {
  test(
    'When call freeMinutes '
    'should return the correct number',
    () {
      final planType30 = PlanType.faleMais30;
      final planType60 = PlanType.faleMais60;
      final planType120 = PlanType.faleMais120;

      expect(planType30.freeMinutes, 30.0);
      expect(planType60.freeMinutes, 60.0);
      expect(planType120.freeMinutes, 120.0);
    },
  );
}
