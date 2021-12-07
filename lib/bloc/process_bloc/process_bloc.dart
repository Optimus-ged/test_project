import 'package:ackaton_manage/bloc/process_bloc/process_event.dart';
import 'package:ackaton_manage/bloc/process_bloc/process_state.dart';
import 'package:ackaton_manage/data/repository/data_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateProcessBloc extends Bloc<CreateProcessEvent, CreateProcessState> {
  // get _api => locator.get<DataRepository>();
  CreateProcessBloc() : super(CreateProcessInitial());

  @override
  Stream<CreateProcessState> mapEventToState(CreateProcessEvent event) async* {
    if (event is CreateProcessButtonPressed) yield* _mapCreateProcessToState(event);
  }

  Stream<CreateProcessState> _mapCreateProcessToState(
      CreateProcessButtonPressed event) async* {
    try {
      yield CreateProcessInProgress();
      final process = await dataRepository.createProcess(event.submitData);
      if (process.data != null) {
        yield CreateProcessSuccess(processData: process);
      } else {
        yield CreateProcessFailure(message: 'erreur');
      }
    } catch (error, stackTrace) {
      yield CreateProcessFailure(message: "veuillez verifier votre connection");
      print(
          'Missions.MapEventToState ::: ERROR: $error, STACKTRACE: $stackTrace');
      return;
    }
  }
}
