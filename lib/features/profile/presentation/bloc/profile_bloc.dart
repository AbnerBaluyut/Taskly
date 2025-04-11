import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:taskly/core/utils/shared_preferences_manager.dart';
import '../../../../core/styles/strings.dart';
import '../../../../core/utils/image_picker_manager.dart';
import '../../../../data/usecases/change_password_usecase.dart';
import '../../../../data/usecases/edit_profile_usecase.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {

  final SharedPreferenceManager sharedPreferenceManager;
  final EditProfileUseCase _editProfileUseCase;
  final ChangePasswordUseCase _changePasswordUseCase;

  final CancelToken _editProfileCancelToken = CancelToken();
  final CancelToken _changePasswordCancelToken = CancelToken();

  ProfileBloc({required this.sharedPreferenceManager}) :
    _editProfileUseCase = GetIt.instance<EditProfileUseCase>(),
    _changePasswordUseCase = GetIt.instance<ChangePasswordUseCase>(),
    super(GetUserDataState(user: sharedPreferenceManager.getUser)) {
      on<LoadUserDataEvent>(_loadData);
      on<UpdateProfileEvent>(_updateProfile);
      on<UpdatePasswordEvent>(_changePassword);
      on<OpenGalleryEvent>(_openGallery);
      on<OpenCameraEvent>(_openCamera);
      on<LogOutEvent>(_logOut);
    }

  _loadData(LoadUserDataEvent event, Emitter<ProfileState> emit) {
    emit(GetUserDataState(
      user: sharedPreferenceManager.getUser
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

    emit(SubmitProfileLoadingState());
    try {
      var user = await _editProfileUseCase.execute(name: event.name, file: event.file, _editProfileCancelToken);
      var updateUser = sharedPreferenceManager.getUser.copyWith(name: event.name, image: user.image);
      sharedPreferenceManager.setUser(updateUser);
      emit(GetUserDataState(user: updateUser));
      emit(SubmitProfileSuccessState());
    } catch (e) {
      emit(SubmitProfileErrorState(e.toString()));
    }
  }

  _changePassword(UpdatePasswordEvent event, Emitter<ProfileState> emit) async {

    emit(UpdatePasswordLoadingState());
    try {

      var isSuccess = await _changePasswordUseCase.execute(currentPassword: event.currentPassword, newPassword: event.newPassword, _changePasswordCancelToken);

      if (isSuccess) {
        emit(UpdatePasswordSuccessState());
      } else {
        emit(UpdatePasswordErrorState(Strings.errorMessage));
      }
      
    } catch (e) {
      emit(UpdatePasswordErrorState(e.toString()));
    }
  }

  _logOut(LogOutEvent event, Emitter<ProfileState> emit) {
    sharedPreferenceManager.clear();
    emit(LogoutSuccessState());
  }
}