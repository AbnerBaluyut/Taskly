part of 'change_password_bloc.dart';

sealed class ChangePasswordState extends Equatable {
  const ChangePasswordState();
  @override
  List<Object?> get props => [];
}

class UpdatePasswordInitialState extends ChangePasswordState {}
class UpdatePasswordLoadingState extends ChangePasswordState {}
class UpdatePasswordSuccessState extends ChangePasswordState {}
class UpdatePasswordErrorState extends ChangePasswordState {
  final String errorMessage;
  const UpdatePasswordErrorState(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}