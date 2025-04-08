import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:taskly/core/extensions/int_extension.dart';
import 'package:taskly/core/utils/shared_preferences_manager.dart';

import 'edit_profile_event.dart';
import 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {

  final SharedPreferenceManager _sharedPreferenceManager;

  EditProfileBloc() : 
    _sharedPreferenceManager = GetIt.instance<SharedPreferenceManager>(),
    super(InitialState()) {
      on<LoadUserDataEvent>(_loadData);
      on<UpdateProfileEvent>(_updateProfile);
      on<OpenGalleryEvent>(_openGallery);
      on<OpenCameraEvent>(_openCamera);
    }

  _loadData(LoadUserDataEvent event, Emitter<EditProfileState> emit) {
    emit(UserDataState(
      user: _sharedPreferenceManager.getUser
    ));
  }

  _openGallery(OpenGalleryEvent event, Emitter<EditProfileState> emit) async {
    
    emit(OpenGalleryState());
  }
  
  _openCamera(OpenCameraEvent event, Emitter<EditProfileState> emit) async {
    
    emit(OpenCameraState());
  }

  _updateProfile(UpdateProfileEvent event, Emitter<EditProfileState> emit) async {
    // Handle save edit profile event
    emit(LoadingState());
    await Future.delayed(3.seconds());
    emit(SuccessState());
  }
}