import 'package:rxdart/rxdart.dart';

import 'package:telzir_app/src/models/call_model.dart';
import 'package:telzir_app/src/utils/plan_type.dart';

class CallBloc {
  CallBloc() {
    reactions();
  }

  void reactions() {
    getFromDDD.listen((_) => updateCallModel());
    getToDDD.listen((_) => updateCallModel());
    getPlanType.listen((_) => updateCallModel());
    getMinutes.listen((_) => updateCallModel());
  }

  final _callController = BehaviorSubject<CallModel>();
  Sink<CallModel> get addCallModel => _callController.sink;
  Stream<CallModel> get getCallModel => _callController.stream;

  final _fromDDDController = BehaviorSubject<String>.seeded('011');
  Sink<String> get addFromDDD => _fromDDDController.sink;
  Stream<String> get getFromDDD => _fromDDDController.stream;

  final _toDDDController = BehaviorSubject<String>.seeded('011');
  Sink<String> get addToDDD => _toDDDController.sink;
  Stream<String> get getToDDD => _toDDDController.stream;

  final _planController = BehaviorSubject<PlanType>.seeded(PlanType.faleMais30);
  Sink<PlanType> get addPlanType => _planController.sink;
  Stream<PlanType> get getPlanType => _planController.stream;

  final _minutesController = BehaviorSubject<int>.seeded(0);
  Stream<int> get getMinutes => _minutesController.stream;

  void addMinutes(int minutes) =>
      _minutesController.sink.add(_minutesController.value + minutes);

  void updateCallModel() {
    final callModel = CallModel(
      from: _fromDDDController.value,
      to: _toDDDController.value,
      planType: _planController.value,
      minutes: _minutesController.value,
    );

    _callController.add(callModel);
  }

  void close() {
    _callController.close();
    _minutesController.close();
    _fromDDDController.close();
    _planController.close();
    _toDDDController.close();
  }
}
