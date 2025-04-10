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
class OpenGalleryEvent extends ProfileEvent {}
class OpenCameraEvent extends ProfileEvent {}
class LogOutEvent extends ProfileEvent {}