part of 'edit_profile_bloc.dart';

sealed class EditProfileEvent extends Equatable {
  const EditProfileEvent();
  @override
  List<Object?> get props => [];
}

class LoadDataEvent extends EditProfileEvent {}
class UpdateProfileEvent extends EditProfileEvent {
  final String name;
  final File? file;
  const UpdateProfileEvent({
    required this.name,
    this.file
  });
  @override
  List<Object?> get props => [name, file];
}

class OpenGalleryEvent extends EditProfileEvent {}
class OpenCameraEvent extends EditProfileEvent {}