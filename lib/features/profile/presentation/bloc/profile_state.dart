import '../../../authentication/domain/entities/user_entity.dart';

abstract class ProfileState {}

// Profile
class GetUserDataState extends ProfileState {
  final UserEntity user;
  GetUserDataState({
    required this.user
  });
}
class LogoutSuccessState extends ProfileState {}



// Edit Profile
class SubmitProfileLoadingState extends ProfileState {}
class SubmitProfileSuccessState extends ProfileState {}
class SubmitProfileErrorState extends ProfileState {
  final String errorMessage;
  SubmitProfileErrorState(this.errorMessage);
}

class OpeningMediaState extends ProfileState {}
class UpdateUserImageSuccessState extends ProfileState {
  final String imagePath;
  UpdateUserImageSuccessState({required this.imagePath});
}
class UpdateUserImageErrorState extends ProfileState {
  final String errorMessage;
  UpdateUserImageErrorState(this.errorMessage);
}





