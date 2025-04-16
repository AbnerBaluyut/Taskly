part of 'change_password_bloc.dart';

sealed class ChangePasswordEvent {}

class UpdatePasswordEvent extends ChangePasswordEvent {
  final String currentPassword;
  final String newPassword;
  UpdatePasswordEvent({
    required this.currentPassword,
    required this.newPassword
  });
}