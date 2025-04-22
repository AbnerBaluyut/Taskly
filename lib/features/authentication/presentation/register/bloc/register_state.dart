part of 'register_bloc.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();
  @override
  List<Object?> get props => [];
}

class RegisterInitialState extends RegisterState {}
class RegisterLoadingState extends RegisterState {}
class RegisterSuccessState extends RegisterState {}
class RegisterFailureState extends RegisterState {
  final String errorMessage;
  const RegisterFailureState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class OpeningMediaState extends RegisterState {}
class UploadImageSuccessState extends RegisterState {
  final String imagePath;
  const UploadImageSuccessState({required this.imagePath});

  @override
  List<Object?> get props => [imagePath];
}
class UploadImageErrorState extends RegisterState {
  final String errorMessage;
  const UploadImageErrorState(this.errorMessage);
  
  @override
  List<Object?> get props => [errorMessage];
}