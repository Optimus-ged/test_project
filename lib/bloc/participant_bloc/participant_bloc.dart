import 'package:ackaton_manage/data/repository/data_repository.dart';
import 'package:ackaton_manage/utils/setup_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Participant_events.dart';
import 'Participant_state.dart';

class LoadParticipantBloc extends Bloc<GetParticipantEvent, LoadParticipantState> {
  get _api => locator.get<DataRepository>();
  LoadParticipantBloc() : super(LoadParticipantInitial());

  @override
  Stream<LoadParticipantState> mapEventToState(
      GetParticipantEvent event) async* {
    if (event is LoadParticipant)
      yield* _mapLoadParticipantToState(event);
  }

  Stream<LoadParticipantState> _mapLoadParticipantToState(
      LoadParticipant event) async* {
        

    try {
      yield LoadParticipantInProgress();
      final Participants = await _api.loadParticipants();
      if (Participants.status == 200) {
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
