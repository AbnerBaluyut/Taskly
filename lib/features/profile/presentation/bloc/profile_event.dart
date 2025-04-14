import 'dart:io';

abstract class ProfileEvent {}

class LoadUserDataEvent extends ProfileEvent {}
class UpdateProfileEvent extends ProfileEvent {
  final String name;
  final File? file;
  UpdateProfileEvent({
    required this.name,
    this.file
  });
}
class UpdatePasswordEvent extends ProfileEvent {
  final String currentPassword;
  final String newPassword;
  UpdatePasswordEvent({
    required this.currentPassword,
    required this.newPassword
  });
}
class OpenGalleryEvent extends ProfileEvent {}
class OpenCameraEvent extends ProfileEvent {}
class CancelEvent extends ProfileEvent {}
class LogOutEvent extends ProfileEvent {}