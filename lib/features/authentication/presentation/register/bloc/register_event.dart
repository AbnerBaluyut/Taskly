part of 'register_bloc.dart';

sealed class RegisterEvent {}

class OpenGalleryEvent extends RegisterEvent {}
class OpenCameraEvent extends RegisterEvent {}
class DoRegisterEvent extends RegisterEvent {
  final String name;
  final String email;
  final String password;
  final File? imageFile;
  DoRegisterEvent({
    required this.name,
    required this.email,
    required this.password,
    this.imageFile
  });
}