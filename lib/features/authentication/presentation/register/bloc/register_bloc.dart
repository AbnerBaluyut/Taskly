import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../_di/dependencies.dart';
import '../../../../../core/utils/image_picker_manager.dart';
import '../../../../../core/utils/secure_storage_manager.dart';
import '../../../../../data/usecases/register_usecase.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {

  final RegisterUseCase _registerUseCase;
  final SecureStorageManager _sharedPrefsManager;

  RegisterBloc() : 
    _registerUseCase = getIt(),
    _sharedPrefsManager = getIt(),
    super(RegisterInitialState()) {
      on<DoRegisterEvent>(_register);
      on<OpenCameraEvent>(_openCamera);
      on<OpenGalleryEvent>(_openGallery);
    }

  void _register(DoRegisterEvent event, Emitter<RegisterState> emit) async {

    emit(RegisterLoadingState());

    final result = await _registerUseCase.execute(
      userName: event.name, 
      userEmail: event.email, 
      password: event.password,
      imageFile: event.imageFile
    ).run();

    result.match((err) {
      emit(RegisterFailureState(err));
    }, (user) {
      _sharedPrefsManager
        ..setUser(user)
        ..setIsLoggedIn(true);
      emit(RegisterSuccessState());
    });
  }

  _openGallery(OpenGalleryEvent event, Emitter<RegisterState> emit) async {

    emit(OpeningMediaState());
    try {
      var file = await ImagePickerManager.pickImage();
      if (file != null) {
        emit(UploadImageSuccessState(imagePath: file.path));
      }
    } catch (e) {
      log("_openGallery err: $e");
      if (e.toString().contains("photo_access_denied")) {
        emit(UploadImageErrorState("Allow access to gallery and photos")); 
      } else {
        emit(UploadImageErrorState("Couldn't open or load image. Please try again"));
      }
    }
  }
  
  _openCamera(OpenCameraEvent event, Emitter<RegisterState> emit) async {
    
    emit(OpeningMediaState());
    try {
      var file = await ImagePickerManager.cameraPhoto();
      if (file != null) {
        emit(UploadImageSuccessState(imagePath: file.path));
      }
    } catch (e) {
      log("_openCamera err: $e");
      if (e.toString().contains("camera_access_denied")) {
        emit(UploadImageErrorState("Allow access to camera")); 
      } else {
        emit(UploadImageErrorState("Couldn't open or load image. Please try again")); 
      }
    }
  }

  @override
  Future<void> close() {
    _registerUseCase.cancel();
    return super.close();
  }
}