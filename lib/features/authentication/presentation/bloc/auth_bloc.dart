import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/utils/image_picker_manager.dart';
import '../../../../core/utils/shared_preferences_manager.dart';
import '../../../../data/usecases/login_usecase.dart';
import '../../../../data/usecases/register_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final SharedPreferenceManager sharedPrefsManager;

  CancelToken _cancelToken = CancelToken();
  CancelToken _registerToken = CancelToken();

  AuthBloc() : 
    loginUseCase = GetIt.I<LoginUseCase>(),
    registerUseCase = GetIt.I<RegisterUseCase>(),
    sharedPrefsManager = GetIt.I<SharedPreferenceManager>(),
    super(AuthInitial()) {
      on<LoginEvent>(_login);
      on<RegisterEvent>(_register);
      on<CancelEvent>(_cancelRequest);
      on<OpenCameraEvent>(_openCamera);
      on<OpenGalleryEvent>(_openGallery);
    }

  void _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final result = await loginUseCase.execute(email: event.email, password: event.password, _cancelToken);
      sharedPrefsManager
        ..setUser(result)
        ..setIsLoggedIn(true);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  void _register(RegisterEvent event, Emitter<AuthState> emit) async {

    emit(RegisterLoadingState());

    try {

      final result = await registerUseCase.execute(
        userName: event.name, 
        userEmail: event.email, 
        password: event.password,
        imageFile: event.imageFile,
        _registerToken
      );
      sharedPrefsManager
        ..setUser(result)
        ..setIsLoggedIn(true);
      emit(RegisterSuccessState());
    } catch (e) {
      emit(RegisterFailureState(e.toString()));
    }
  }

  _openGallery(OpenGalleryEvent event, Emitter<AuthState> emit) async {

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
  
  _openCamera(OpenCameraEvent event, Emitter<AuthState> emit) async {
    
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

  void _cancelRequest(CancelEvent event, Emitter<AuthState> emit) {
    _cancelToken.cancel();
    _cancelToken = CancelToken();

    _registerToken.cancel();
    _registerToken = CancelToken();
    emit(AuthCancel());
  }
}