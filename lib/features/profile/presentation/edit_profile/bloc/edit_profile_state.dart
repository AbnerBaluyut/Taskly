part of 'edit_profile_bloc.dart';

sealed class EditProfileState {}

class LoadDataState extends EditProfileState {
  final UserEntity user;
  LoadDataState({
    required this.user
  });
}
class SubmitProfileLoadingState extends EditProfileState {}
class SubmitProfileSuccessState extends EditProfileState {}
class SubmitProfileErrorState extends EditProfileState {
  final String errorMessage;
  SubmitProfileErrorState(this.errorMessage);
}

class OpeningMediaState extends EditProfileState {}
class UpdateUserImageSuccessState extends EditProfileState {
  final String imagePath;
  UpdateUserImageSuccessState({required this.imagePath});
}
class UpdateUserImageErrorState extends EditProfileState {
  final String errorMessage;
  UpdateUserImageErrorState(this.errorMessage);
}