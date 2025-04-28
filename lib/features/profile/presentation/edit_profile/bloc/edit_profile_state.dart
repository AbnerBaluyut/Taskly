part of 'edit_profile_bloc.dart';

sealed class EditProfileState extends Equatable {
  const EditProfileState();
  @override
  List<Object?> get props => [];
}

class EditProfileInitialState extends EditProfileState {}

class LoadDataState extends EditProfileState {
  final UserEntity user;
  const LoadDataState({
    required this.user
  });
  @override
  List<Object?> get props => [user];
}
class SubmitProfileLoadingState extends EditProfileState {}
class SubmitProfileSuccessState extends EditProfileState {}
class SubmitProfileErrorState extends EditProfileState {
  final String errorMessage;
  const SubmitProfileErrorState(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}

class LoadingImageState extends EditProfileState {}
class DismissDialogState extends EditProfileState {}
class UpdateUserImageSuccessState extends EditProfileState {
  final String imagePath;
  const UpdateUserImageSuccessState({required this.imagePath});
  @override
  List<Object?> get props => [imagePath];
}
class UpdateUserImageErrorState extends EditProfileState {
  final String errorMessage;
  const UpdateUserImageErrorState(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}