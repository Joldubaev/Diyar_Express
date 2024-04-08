part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInLoading extends SignInState {}

final class SignInSuccessWithUser extends SignInState {}

final class SignOutSuccess extends SignInState {}

final class FogotPasswordSuccess extends SignInState {}

final class ResetPasswordSuccess extends SignInState {}

final class SignInFailure extends SignInState {
  final String message;
  SignInFailure(this.message);
}
