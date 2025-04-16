part of 'login_bloc.dart';

sealed class LoginState {}

class LoginInitialState extends LoginState {}
class LoginLoadingState extends LoginState {}
class LoginSuccessState extends LoginState {}

class LoginFailureState extends LoginState {
  final String errorMessage;

  LoginFailureState(this.errorMessage);
}

class CancelState extends LoginState {}
