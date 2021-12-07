import 'package:ackaton_manage/data/repository/data_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'load_process_events.dart';
import 'load_process_state.dart';

class LoadProcessBloc extends Bloc<LoadProcessEvent, LoadProcessState> {
  // get _api => locator.get<DataRepository>();
  LoadProcessBloc() : super(LoadProcessInitial());

  @override
  Stream<LoadProcessState> mapEventToState(LoadProcessEvent event) async* {
    if (event is LoadProcesssLoaded) yield* _mapLoadProcessToState(event);
  }

  Stream<LoadProcessState> _mapLoadProcessToState(
      LoadProcessEvent event) async* {
    try {
      yield LoadProcessInProgress();
      final processs = await dataRepository.getAllProcesss();
      if (processs.data != null) {
        yield LoadProcessSuccess(procResp: processs);
      } else {
        yield LoadProcessFailure(message: 'erreur');
      }
    } catch (error, stackTrace) {
      yield LoadProcessFailure(message: "veuillez verifier votre connection");
      print(
          'Processs.MapEventToState ::: ERROR: $error, STACKTRACE: $stackTrace');
      return;
    }
  }
}
