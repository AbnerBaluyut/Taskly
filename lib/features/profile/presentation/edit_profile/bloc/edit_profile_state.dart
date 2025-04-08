import '../../../../authentication/domain/entities/user_entity.dart';

abstract class EditProfileState {}

class InitialState extends EditProfileState {}
class UserDataState extends EditProfileState {

  final UserEntity user;
  
  UserDataState({
    required this.user,
  });
}

// Update Avatar
class OpenCameraState extends EditProfileState {}
class OpenGalleryState extends EditProfileState {}
class LoadingAvatarState extends EditProfileState {}
class UpdateAvatarSuccess extends EditProfileState {
  final String imagePath;
  UpdateAvatarSuccess({required this.imagePath});
}
class ErrorAvatarState extends EditProfileState {
  final String errorMessage;
  ErrorAvatarState(this.errorMessage);
}

// Update Profile
class LoadingState extends EditProfileState {}
class SuccessState extends EditProfileState {}
class ErrorState extends EditProfileState {
  final String errorMessage;
  ErrorState(this.errorMessage);
}
