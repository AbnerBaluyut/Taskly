import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:taskly/core/utils/shared_preferences_manager.dart';

import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {

  final SharedPreferenceManager _sharedPreferenceManager;

  ProfileBloc() : 
    _sharedPreferenceManager = GetIt.I<SharedPreferenceManager>(),
    super(
      ProfileInitial()
    ) {
      on<LogoutEvent>((event, emit) {
        _sharedPreferenceManager.clear();
        emit(LogoutSuccessState());
      });
    }
}