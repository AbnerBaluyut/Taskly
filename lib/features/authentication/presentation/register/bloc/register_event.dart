part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();
  @override
  List<Object?> get props => [];
}

class OpenGalleryEvent extends RegisterEvent {}
class OpenCameraEvent extends RegisterEvent {}
class DoRegisterEvent extends RegisterEvent {
  final String name;
  final String email;
  final String password;
  final File? imageFile;
  const DoRegisterEvent({
    required this.name,
    required this.email,
    required this.password,
    this.imageFile
  });

  @override
  List<Object?> get props => [
    name,
    email,
    password,
    imageFile,
  ];
}