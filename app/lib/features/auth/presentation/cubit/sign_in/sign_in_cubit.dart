import 'package:bloc/bloc.dart';
import 'package:diyar_express/features/auth/data/models/user_mpdel.dart';
import 'package:diyar_express/features/auth/data/repositories/auth_repository.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(
    this.authRepository,
  ) : super(SignInInitial());

  final AuthRepository authRepository;

  void signInUser(UserModel model) async {
    emit(SignInLoading());
    try {
      await authRepository.login(model);
      emit(SignInSuccessWithUser());
    } catch (e) {
      emit(SignInFailure(e.toString()));
    }
  }

  void sendCodeToEmail(String email) async {
    emit(SignInLoading());
    try {
      await authRepository.sendForgotPasswordCodeToEmail(email);
      emit(FogotPasswordSuccess());
    } catch (e) {
      emit(SignInFailure(e.toString()));
    }
  }

  Future logout() async => await authRepository.logout();
}
