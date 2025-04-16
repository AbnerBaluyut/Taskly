part of 'edit_profile_bloc.dart';

sealed class EditProfileEvent {}

class LoadDataEvent extends EditProfileEvent {}
class UpdateProfileEvent extends EditProfileEvent {
  final String name;
  final File? file;
  UpdateProfileEvent({
    required this.name,
    this.file
  });
}

class OpenGalleryEvent extends EditProfileEvent {}
class OpenCameraEvent extends EditProfileEvent {}