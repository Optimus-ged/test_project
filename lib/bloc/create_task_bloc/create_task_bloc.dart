import 'package:ackaton_manage/data/repository/data_repository.dart';
import 'package:ackaton_manage/utils/setup_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'create_task_events.dart';
import 'create_task_state.dart';


class CreateTaskBloc extends Bloc<CreateTaskEvent, CreateTaskState> {
  get _api => locator.get<DataRepository>();
  CreateTaskBloc() : super(CreateTaskInitial());

  @override
  Stream<CreateTaskState> mapEventToState(
      CreateTaskEvent event) async* {
    if (event is LoadTask)
      yield* _mapLoadTaskToState(event);
  }

  Stream<CreateTaskState> _mapLoadTaskToState(
      LoadTask event) async* {
        

    try {
      yield CreateTaskInProgress();
      final Tasks = await _api.createTasks();
      if (Tasks.status == 200) {
        // yield LoadTaskSuccess(login: login);

      } else {
        yield CreateTaskFailure(message: 'erreur');
      }
    } catch (error, stackTrace) {
      yield CreateTaskFailure(message: "veuillez verifier votre connection");
      print(
          'Tasks.MapEventToState ::: ERROR: $error, STACKTRACE: $stackTrace');
      return;
    }
  }
}
