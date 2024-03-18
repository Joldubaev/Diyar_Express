import 'package:bloc/bloc.dart';
import 'package:diyar_express/features/auth/data/models/sign_up_model.dart';
import 'package:diyar_express/features/auth/data/repositories/auth_repository.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(
    this.authRepository,
  ) : super(SignInInitial());

  final AuthRepositoryImpl authRepository;

  void signInUser(UserModel model) async {
    emit(SignInLoading());
    try {
      final user = await authRepository.login(
        model,
      );

      emit(SignInSuccessWithUser());
      return user;
    } catch (e) {
      emit(SignInFailure(e.toString()));
      rethrow;
    }
  }
}
