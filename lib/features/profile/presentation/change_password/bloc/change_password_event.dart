part of 'change_password_bloc.dart';

sealed class ChangePasswordEvent extends Equatable {
  const ChangePasswordEvent();
  @override
  List<Object?> get props => [];
}

class UpdatePasswordEvent extends ChangePasswordEvent {
  final String currentPassword;
  final String newPassword;
  const UpdatePasswordEvent({
    required this.currentPassword,
    required this.newPassword
  });
  @override
  List<Object?> get props => [currentPassword, newPassword];
}