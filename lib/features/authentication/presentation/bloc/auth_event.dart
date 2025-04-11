import 'dart:io';

abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
}


class OpenGalleryEvent extends AuthEvent {}
class OpenCameraEvent extends AuthEvent {}
class RegisterEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final File? imageFile;
  RegisterEvent({
    required this.name,
    required this.email,
    required this.password,
    this.imageFile
  });
}

class CancelEvent extends AuthEvent {}