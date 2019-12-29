enum PlanType {
  faleMais30,
  faleMais60,
  faleMais120,
}

extension PlanTypeExtension on PlanType {
  static const freeMinutesList = {
    PlanType.faleMais30: 30,
    PlanType.faleMais60: 60,
    PlanType.faleMais120: 120,
  };

  int get freeMinutes => freeMinutesList[this];
}