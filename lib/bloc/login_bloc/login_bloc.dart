
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  // get _api => locator.get<DataRepository>();
  LoginBloc() : super(LoginInitial());

  // @override
  // Stream<LoginState> mapEventToState(LoginEvent event) async* {
  //   if (event is LoginButtonPressed)
  //     yield* _mapLoginButtonPressedToState(event);
  // }

  // Stream<LoginState> _mapLoginButtonPressedToState(
  //     LoginButtonPressed event) async* {

  //   try {
  //     yield LoginInProgress();
  //     final login = await _api.loginUser(event.submitData);
  //     if (login.status == 200) {
  //       yield LoginSuccess(login: login);
        
  //     } else {
  //       yield LoginFailure(login: login.message);
  //     }
  //   } catch (error, stackTrace) {
  //     yield LoginFailure(login: "$error");
  //     print(
  //         'LoginBloc.MapEventToState ::: ERROR: $error, STACKTRACE: $stackTrace');
  //     return;
  //   }
  // }
}
