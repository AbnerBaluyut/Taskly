part of 'login_bloc.dart';

sealed class LoginEvent {}

class DoLoginEvent extends LoginEvent {
  final String email;
  final String password;

  DoLoginEvent({required this.email, required this.password});
}


class CancelEvent extends LoginEvent {}
