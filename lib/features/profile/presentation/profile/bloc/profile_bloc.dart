import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../authentication/domain/entities/user_entity.dart';
import '../../../../../core/utils/shared_preferences_manager.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {

  final SharedPreferenceManager _sharedPreferenceManager;

  ProfileBloc(this._sharedPreferenceManager) :
    super(LoadDataState(user: _sharedPreferenceManager.getUser)) {
      on<LoadDataEvent>(_loadData);
      on<LogOutEvent>(_logOut);
    }

  _loadData(LoadDataEvent event, Emitter<ProfileState> emit) {
    emit(LoadDataState(
      user: _sharedPreferenceManager.getUser
    ));
  }

  _logOut(LogOutEvent event, Emitter<ProfileState> emit) {
    _sharedPreferenceManager.clear();
    emit(LogOutSuccessState());
  }
}