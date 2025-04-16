import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../../../../../_di/injections.dart';
import '../../../../../core/utils/image_picker_manager.dart';
import '../../../../../core/utils/shared_preferences_manager.dart';
import '../../../../../data/usecases/edit_profile_usecase.dart';
import '../../../../authentication/domain/entities/user_entity.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {

  final SharedPreferenceManager _sharedPreferenceManager;
  final EditProfileUseCase _editProfileUseCase;

  CancelToken _cancelToken = CancelToken();

  EditProfileBloc(this._sharedPreferenceManager) :
    _editProfileUseCase = getIt(),
    super(LoadDataState(user: _sharedPreferenceManager.getUser)) {
      on<LoadDataEvent>(_loadData);
      on<UpdateProfileEvent>(_updateProfile);
      on<OpenGalleryEvent>(_openGallery);
      on<OpenCameraEvent>(_openCamera);
    }

  _loadData(LoadDataEvent event, Emitter<EditProfileState> emit) {
    emit(LoadDataState(
      user: _sharedPreferenceManager.getUser
    ));
  }

  _openGallery(OpenGalleryEvent event, Emitter<EditProfileState> emit) async {

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
  
  _openCamera(OpenCameraEvent event, Emitter<EditProfileState> emit) async {
    
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

  _updateProfile(UpdateProfileEvent event, Emitter<EditProfileState> emit) async {

    emit(SubmitProfileLoadingState());
    try {
      var user = await _editProfileUseCase.execute(name: event.name, file: event.file, _cancelToken);
      var updateUser = _sharedPreferenceManager.getUser.copyWith(name: event.name, image: user.image);
      _sharedPreferenceManager.setUser(updateUser);
      emit(LoadDataState(user: updateUser));
      emit(SubmitProfileSuccessState());
    } catch (e) {
      emit(SubmitProfileErrorState(e.toString()));
    }
  }

  void _cancel() {

    _cancelToken.cancel();
    _cancelToken = CancelToken();
  }

  @override
  Future<void> close() {
    _cancel();
    return super.close();
  }
}