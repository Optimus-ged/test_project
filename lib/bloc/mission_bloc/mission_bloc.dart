import 'package:flutter_bloc/flutter_bloc.dart';

import 'mission_events.dart';
import 'mission_state.dart';

class LoadMissionBloc extends Bloc<LoadMissionEvent, LoadMissionState> {
  LoadMissionBloc() : super(LoadMissionInitial());
}
