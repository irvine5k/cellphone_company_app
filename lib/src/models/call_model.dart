import 'package:meta/meta.dart';
import 'package:telzir_app/src/utils/plan_type.dart';

class CallModel {
  final String from;
  final String to;
  final int minutes;
  final PlanType planType;

  CallModel({
    @required this.from,
    @required this.to,
    @required this.minutes,
    @required this.planType,
  });

  /// Return a double rounded to 2 decimals
  /// with the price without plan value.
  double get priceWithoutPlan => num.parse(
        (minutes * basePrice).toStringAsFixed(2),
      );

  /// Return a double rounded to 2 decimals
  /// with the price with plan value.
  double get priceWithPlan => num.parse(
        _getPriceWithPlan().toStringAsFixed(2),
      );

  /// Find the base price inside base prices map
  /// If does not find in base prices map return 0
  double get basePrice => _basePrices[from][to] ?? 0.0;

  /// Return base price with 10 addition
  double get basePriceWithExcess => basePrice * 1.1;

  Map<String, dynamic> _basePrices = {
    '011': {
      '016': 1.90,
      '017': 1.70,
      '018': 0.90,
    },
    '016': {
      '011': 2.90,
    },
    '017': {
      '011': 2.70,
    },
    '018': {
      '011': 1.90,
    }
  };

  double _getPriceWithPlan() {
    final finalMinutes =
        minutes < planType.freeMinutes ? 0 : minutes - planType.freeMinutes;

    // print(final)

    return finalMinutes * basePriceWithExcess;
  }
}
