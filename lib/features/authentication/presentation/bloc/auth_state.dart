abstract class AuthState {}

class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthSuccess extends AuthState {}

class AuthFailure extends AuthState {
  final String errorMessage;

  AuthFailure(this.errorMessage);
}

class AuthCancel extends AuthState {}


class RegisterInitialState extends AuthState {}
class RegisterLoadingState extends AuthState {}
class RegisterSuccessState extends AuthState {}
class RegisterFailureState extends AuthState {
  final String errorMessage;
  RegisterFailureState(this.errorMessage);
}
class RegisterCancelState extends AuthState {}

class OpeningMediaState extends AuthState {}
class UploadImageSuccessState extends AuthState {
  final String imagePath;
  UploadImageSuccessState({required this.imagePath});
}
class UploadImageErrorState extends AuthState {
  final String errorMessage;
  UploadImageErrorState(this.errorMessage);
}