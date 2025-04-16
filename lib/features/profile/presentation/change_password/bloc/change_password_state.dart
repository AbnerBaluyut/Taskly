part of 'change_password_bloc.dart';

sealed class ChangePasswordState {}

class UpdatePasswordInitialState extends ChangePasswordState {}
class UpdatePasswordLoadingState extends ChangePasswordState {}
class UpdatePasswordSuccessState extends ChangePasswordState {}
class UpdatePasswordErrorState extends ChangePasswordState {
  final String errorMessage;
  UpdatePasswordErrorState(this.errorMessage);
}