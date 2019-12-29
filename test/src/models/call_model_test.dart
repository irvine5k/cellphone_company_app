import 'package:flutter_test/flutter_test.dart';
import 'package:telzir_app/src/models/call_model.dart';
import 'package:telzir_app/src/utils/plan_type.dart';

void main() {
  test(
    'When create a call model object '
    'Should show the correct attributes',
    () {
      final from = '011';
      final to = '018';
      final minutes = 10;
      final planType = PlanType.faleMais30;

      final model = CallModel(
        from: from,
        to: to,
        minutes: minutes,
        planType: planType,
      );

      expect(model.from, from);
      expect(model.to, to);
      expect(model.minutes, minutes);
      expect(model.planType, planType);
    },
  );

  test(
    'When get the base price'
    'Should return the correct value',
    () {
      final from = '011';
      final to = '018';
      final minutes = 10;

      final model = CallModel(
        from: from,
        to: to,
        minutes: minutes,
        planType: PlanType.faleMais30,
      );

      expect(model.basePrice, 0.90);
    },
  );

  test(
    'When get the base price'
    'And does not have the information in Map'
    'Should return 0',
    () {
      final from = '016';
      final to = '017';
      final minutes = 10;

      final model = CallModel(
        from: from,
        to: to,
        minutes: minutes,
        planType: PlanType.faleMais30,
      );

      expect(model.basePrice, 0);
    },
  );

  test(
    'When get the base price with excess'
    'Should return the correct value',
    () {
      final from = '011';
      final to = '017';
      final minutes = 10;

      final model = CallModel(
        from: from,
        to: to,
        minutes: minutes,
        planType: PlanType.faleMais30,
      );

      expect(model.basePriceWithExcess, 1.87);
    },
  );

  test(
    'When get the base price with excess'
    'And base price is 0'
    'Should return 0',
    () {
      final from = '016';
      final to = '017';
      final minutes = 10;

      final model = CallModel(
        from: from,
        to: to,
        minutes: minutes,
        planType: PlanType.faleMais30,
      );

      expect(model.basePriceWithExcess, 0);
    },
  );

  test(
    'When get the priceWithPlan'
    'And base price is 0'
    'Should return 0',
    () {
      final from = '016';
      final to = '017';
      final minutes = 10;

      final model = CallModel(
        from: from,
        to: to,
        minutes: minutes,
        planType: PlanType.faleMais30,
      );

      expect(model.priceWithPlan, 0);
    },
  );

  test(
    'When get the priceWithPlan '
    'And base price with excess is 0 '
    'Should return 0',
    () {
      final from = '016';
      final to = '017';
      final minutes = 10;

      final model = CallModel(
        from: from,
        to: to,
        minutes: minutes,
        planType: PlanType.faleMais30,
      );

      expect(model.priceWithoutPlan, 0);
    },
  );

  test(
    'When get the priceWithPlan from 011 to 016 '
    'and priceWithoutPlan '
    'Should return correct price',
    () {
      final from = '011';
      final to = '016';
      final minutes = 20;

      final model = CallModel(
        from: from,
        to: to,
        minutes: minutes,
        planType: PlanType.faleMais30,
      );

      expect(model.priceWithPlan, 0);
      expect(model.priceWithoutPlan, 38.0);
    },
  );

  test(
    'When get the priceWithPlan from 011 to 017 '
    'and priceWithoutPlan '
    'Should return correct price',
    () {
      final from = '011';
      final to = '017';
      final minutes = 80;

      final model = CallModel(
        from: from,
        to: to,
        minutes: minutes,
        planType: PlanType.faleMais60,
      );

      expect(model.priceWithPlan, 37.40);
      expect(model.priceWithoutPlan, 136.0);
    },
  );
}
