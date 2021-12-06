import 'package:ackaton_manage/data/repository/data_repository.dart';
import 'package:ackaton_manage/utils/setup_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'create_participant_events.dart';
import 'create_participant_state.dart';


class CreateParticipantBloc extends Bloc<CreateParticipantEvent, CreateParticipantState> {
  get _api => locator.get<DataRepository>();
  CreateParticipantBloc() : super(CreateParticipantInitial());

  @override
  Stream<CreateParticipantState> mapEventToState(
      CreateParticipantEvent event) async* {
    if (event is LoadParticipant)
      yield* _mapLoadParticipantToState(event);
  }

  Stream<CreateParticipantState> _mapLoadParticipantToState(
      LoadParticipant event) async* {
        

    try {
      yield CreateParticipantInProgress();
      final participants = await _api.createParticipants();
      if (participants.status == 200) {
        // yield LoadParticipantSuccess(login: login);

      } else {
        yield CreateParticipantFailure(message: 'erreur');
      }
    } catch (error, stackTrace) {
      yield CreateParticipantFailure(message: "veuillez verifier votre connection");
      print(
          'Participants.MapEventToState ::: ERROR: $error, STACKTRACE: $stackTrace');
      return;
    }
  }
}
