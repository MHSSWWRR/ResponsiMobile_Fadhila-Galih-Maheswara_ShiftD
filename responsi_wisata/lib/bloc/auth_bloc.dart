import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../helpers/user_info.dart';

import '../helpers/api.dart';
import '../helpers/api_url.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginEvent) {
      yield AuthLoading();

      try {
        final response = await Api().post(ApiUrl.createDestination, {
          'email': event.email,
          'password': event.password,
        });

        if (response['status'] == true) {
          await UserInfo.saveUserInfo(response['token'], event.email);
          yield Authenticated();
        } else {
          yield AuthError("Login failed");
        }
      } catch (e) {
        yield AuthError("Failed to login");
      }
    } else if (event is LogoutEvent) {
      await UserInfo.clearUserInfo();
      yield Unauthenticated();
    }
  }
}
