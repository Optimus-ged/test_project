import 'package:ackaton_manage/bloc/create_participant_bloc/participant_state.dart';
import 'package:ackaton_manage/data/repository/data_repository.dart';
import 'package:ackaton_manage/utils/setup_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'create_task_events.dart';


class LoadParticipantBloc extends Bloc<CreateParticipantEvent, LoadParticipantState> {
  get _api => locator.get<DataRepository>();
  LoadParticipantBloc() : super(LoadParticipantInitial());

  @override
  Stream<LoadParticipantState> mapEventToState(
      CreateParticipantEvent event) async* {
    if (event is LoadParticipant)
      yield* _mapLoadParticipantToState(event);
  }

  Stream<LoadParticipantState> _mapLoadParticipantToState(
      LoadParticipant event) async* {
        

    try {
      yield LoadParticipantInProgress();
      final participants = await _api.loadParticipants();
      if (participants.status == 200) {
        // yield LoadParticipantSuccess(login: login);

      } else {
        yield LoadParticipantFailure(message: 'erreur');
      }
    } catch (error, stackTrace) {
      yield LoadParticipantFailure(message: "veuillez verifier votre connection");
      print(
          'Participants.MapEventToState ::: ERROR: $error, STACKTRACE: $stackTrace');
      return;
    }
  }
}
