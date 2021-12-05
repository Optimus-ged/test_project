import 'package:ackaton_manage/bloc/mission_bloc/mission_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';
import 'bloc/login_bloc/login_bloc.dart';
import 'utils/observer.dart';
import 'utils/setup_locator.dart';
import 'package:bloc/bloc.dart';

void main() async {
  try {
    Bloc.observer = SimpleBlocObserver();

    WidgetsFlutterBinding.ensureInitialized();

    setup();
    await SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown
      ],
    ).then(
      (_) => runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
            BlocProvider<LoadMissionBloc>(
              create: (context) => LoadMissionBloc(),
            ),
          ],
          child: MyApp(),
        ),
      ),
    );
  } catch (error, stacktrace) {
    debugPrint('Main.Main ::: ERROR: $error & STACKTRACE: $stacktrace');
  }
}
