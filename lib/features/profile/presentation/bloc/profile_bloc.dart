import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:taskly/core/extensions/int_extension.dart';
import 'package:taskly/core/utils/shared_preferences_manager.dart';
import '../../../../core/utils/image_picker_manager.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {

  final SharedPreferenceManager _sharedPreferenceManager;

  ProfileBloc() : 
    _sharedPreferenceManager = GetIt.I<SharedPreferenceManager>(),
    super(
      ProfileInitialState()
    ) {
      on<LoadUserDataEvent>(_loadData);
      on<UpdateProfileEvent>(_updateProfile);
      on<OpenGalleryEvent>(_openGallery);
      on<OpenCameraEvent>(_openCamera);
      on<LogOutEvent>(_logOut);
    }

  _loadData(LoadUserDataEvent event, Emitter<ProfileState> emit) {
    emit(GetUserDataState(
      user: _sharedPreferenceManager.getUser
    ));
  }

  _openGallery(OpenGalleryEvent event, Emitter<ProfileState> emit) async {

    emit(OpeningMediaState());
    try {
      var file = await ImagePickerManager.pickImage();
      if (file != null) {
        emit(UpdateUserImageSuccessState(imagePath: file.path));
      }
    } catch (e) {
      log("_openGallery err: $e");
      if (e.toString().contains("photo_access_denied")) {
        emit(UpdateUserImageErrorState("Allow access to gallery and photos")); 
      } else {
        emit(UpdateUserImageErrorState("Couldn't open or load image. Please try again"));
      }
    }
  }
  
  _openCamera(OpenCameraEvent event, Emitter<ProfileState> emit) async {
    
    emit(OpeningMediaState());
    try {
      var file = await ImagePickerManager.cameraPhoto();
      if (file != null) {
        emit(UpdateUserImageSuccessState(imagePath: file.path));
      }
    } catch (e) {
      log("_openCamera err: $e");
      if (e.toString().contains("camera_access_denied")) {
        emit(UpdateUserImageErrorState("Allow access to camera")); 
      } else {
        emit(UpdateUserImageErrorState("Couldn't open or load image. Please try again")); 
      }
    }
  }

  _updateProfile(UpdateProfileEvent event, Emitter<ProfileState> emit) async {
    
    var updateUser = _sharedPreferenceManager.getUser.copyWith(name: event.name, image: event.file?.path);
    _sharedPreferenceManager.setUser(updateUser);

    emit(SubmitProfileLoadingState());
    await Future.delayed(2.seconds());
    emit(GetUserDataState(user: updateUser));
    emit(SubmitProfileSuccessState());
  }

  _logOut(LogOutEvent event, Emitter<ProfileState> emit) {
    _sharedPreferenceManager.clear();
    emit(LogoutSuccessState());
  }
}