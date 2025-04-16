part of 'register_bloc.dart';

sealed class RegisterState {}

class RegisterInitialState extends RegisterState {}
class RegisterLoadingState extends RegisterState {}
class RegisterSuccessState extends RegisterState {}
class RegisterFailureState extends RegisterState {
  final String errorMessage;
  RegisterFailureState(this.errorMessage);
}

class OpeningMediaState extends RegisterState {}
class UploadImageSuccessState extends RegisterState {
  final String imagePath;
  UploadImageSuccessState({required this.imagePath});
}
class UploadImageErrorState extends RegisterState {
  final String errorMessage;
  UploadImageErrorState(this.errorMessage);
}