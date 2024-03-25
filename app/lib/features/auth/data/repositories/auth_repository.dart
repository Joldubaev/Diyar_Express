import 'package:diyar_express/features/auth/data/datasources/datasources.dart';
import 'package:diyar_express/features/auth/data/models/sign_up_model.dart';

abstract class AuthRepository {
  // Future<void> confirmEmail(String email, int code);
  // Future<void> confirmResetPassword({
  //   required String email,
  //   required String otpCode,
  //   required String newPassword,
  // });
  Future<void> login(UserModel user);
  Future<void> register(UserModel user);
  Future<void> sendForgotPasswordCodeToEmail(String email);
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);

  // @override
  // Future<void> confirmEmail(String email, int code) async {
  //   return _remoteDataSource.confirmEmail(email, code);
  // }

  // @override
  // Future<void> confirmResetPassword({
  //   required String email,
  //   required String otpCode,
  //   required String newPassword,
  // }) async {
  //   return _remoteDataSource.confirmResetPassword(
  //     email: email,
  //     otpCode: otpCode,
  //     newPassword: newPassword,
  //   );
  // }

  @override
  Future<void> login(UserModel user) async {
    return _remoteDataSource.login(user);
  }

  @override
  Future<void> register(UserModel user) async {
    return _remoteDataSource.register(user);
  }

  @override
  Future<void> sendForgotPasswordCodeToEmail(String email) async {
    return _remoteDataSource.sendForgotPasswordCodeToEmail(email);
  }
}
