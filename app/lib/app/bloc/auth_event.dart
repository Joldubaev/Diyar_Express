part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthInitialEvent extends AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  AuthLoginEvent({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}

class AuthRegisterEvent extends AuthEvent {
  AuthRegisterEvent({
    required this.email,
    required this.password,
    required this.name,
    required this.phoneNumber,
  });

  final String email;
  final String password;
  final String name;
  final String phoneNumber;
}

class AuthLogoutEvent extends AuthEvent {}
