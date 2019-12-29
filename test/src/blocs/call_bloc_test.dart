import 'package:flutter_test/flutter_test.dart';
import 'package:telzir_app/src/blocs/call_bloc.dart';
import 'package:telzir_app/src/models/call_model.dart';
import 'package:telzir_app/src/utils/plan_type.dart';

void main() {
  test(
    'When init bloc'
    'Should emits the correct initial state',
    () {
      final bloc = CallBloc();

      expect(bloc.getFromDDD, emits('011'));
      expect(bloc.getToDDD, emits('011'));
      expect(bloc.getPlanType, emits(PlanType.faleMais30));
      expect(bloc.getMinutes, emits(0));
    },
  );

  test(
    'When add a new from DDD'
    'Should emits the correct value',
    () {
      final bloc = CallBloc();

      bloc.addFromDDD.add('016');

      expect(bloc.getFromDDD, emits('016'));
    },
  );

  test(
    'When add a new to DDD'
    'Should emits the correct value',
    () {
      final bloc = CallBloc();

      bloc.addToDDD.add('016');

      expect(bloc.getToDDD, emits('016'));
    },
  );

  test(
    'When add a new plan type'
    'Should emits the correct value',
    () {
      final bloc = CallBloc();

      bloc.addPlanType.add(PlanType.faleMais60);

      expect(bloc.getPlanType, emits(PlanType.faleMais60));
    },
  );

  test(
    'When add a new minutes'
    'Should return the correct value',
    () {
      final bloc = CallBloc();

      bloc.addMinutes(10);

      expect(bloc.getMinutes, emits(10));
    },
  );

  test(
    'When change values'
    'Should emits a new call model',
    () {
      final bloc = CallBloc();

      bloc.addFromDDD.add('011');
      bloc.addToDDD.add('016');
      bloc.addPlanType.add(PlanType.faleMais30);
      bloc.addMinutes(20);

      expect(bloc.getCallModel, emits(isA<CallModel>()));
    },
  );
}
