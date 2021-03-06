import 'package:ackaton_manage/data/repository/data_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'mission_events.dart';
import 'mission_state.dart';

class LoadMissionBloc extends Bloc<LoadMissionEvent, LoadMissionState> {
  LoadMissionBloc() : super(LoadMissionInitial());

  @override
  Stream<LoadMissionState> mapEventToState(LoadMissionEvent event) async* {
    if (event is LoadMissionsLoaded) yield* _mapLoadMissionToState(event);
  }

  Stream<LoadMissionState> _mapLoadMissionToState(
      LoadMissionEvent event) async* {
    try {
      yield LoadMissionInProgress();
      final missions = await dataRepository.getAllMissions();
      if (missions.data != null) {
        yield LoadMissionSuccess(missions: missions);
      } else {
        yield LoadMissionFailure(message: 'erreur');
      }
    } catch (error, stackTrace) {
      yield LoadMissionFailure(message: "veuillez verifier votre connection");
      print(
          'Missions.MapEventToState ::: ERROR: $error, STACKTRACE: $stackTrace');
      return;
    }
  }
}
