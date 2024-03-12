import 'package:bloc/bloc.dart';
import 'package:diyar_express/app/service/app_service.dart';
import 'package:diyar_express/model/auth/user_model.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this.appService, {
    required this.storage,
  }) : super(AuthenticatedState()) {
    on<AuthEvent>((event, emit) {});
  }

  final SharedPreferences storage;
  final AppService appService;

  void signUp({
    required String username,
    required String phoneNumber,
    required String email,
    required String password,
  }) async {
    // final success = await appService.setUserServer(
    //   name: username,
    //   email: email,
    //   phoneNumber: phoneNumber,
    //   password: password,
    // );
  }
}
