import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../authentication/domain/entities/user_entity.dart';
import '../../../../../core/utils/secure_storage_manager.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {

  final SecureStorageManager _sharedPreferenceManager;

  ProfileBloc(this._sharedPreferenceManager) :
    super(ProfileInitialState()) {
      on<LoadDataEvent>(_loadData);
      on<LogOutEvent>(_logOut);
    }

  _loadData(LoadDataEvent event, Emitter<ProfileState> emit) async {
    emit(LoadDataState(
      user: await _sharedPreferenceManager.getUser
    ));
  }

  _logOut(LogOutEvent event, Emitter<ProfileState> emit) {
    _sharedPreferenceManager.clearAll();
    emit(LogOutSuccessState());
  }
}