import 'package:bloc/bloc.dart';
import 'package:taskly/core/extensions/int_ext.dart';

import '../../../_di/dependencies.dart';
import '../../../core/utils/shared_preferences_manager.dart';
import '../../../data/usecases/refresh_token_usecase.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {

  final SharedPreferenceManager _sharedPrefs;
  final RefreshTokenUseCase _refreshTokenUseCase;
  
  SplashBloc() : 
  _sharedPrefs = getIt(),
  _refreshTokenUseCase = getIt(),
    super(SplashInitialState()) {
      on<SplashEvent>(_init);
      on<ClearPrefsEvent>(_clearPrefs);
    }

  void _init(SplashEvent event, Emitter<SplashState> emit) async {

    emit(SplashLoadingState());
    await Future.delayed(3.seconds());
    if (!_sharedPrefs.isLoggedIn) {
      emit(SplashLoadedState());
      return;
    }

    var result = await _refreshTokenUseCase.execute(refreshToken: _sharedPrefs.getUser.refreshToken).run();
    result.match((err) {
      emit(SplashErrorState(err.toString().toLowerCase()));
    }, (data) {
      _sharedPrefs.getUser.copyWith(
        accessToken: data.accessToken,
        refreshToken: data.refreshToken
      );
      emit(SplashLoadedState());
    });
  }

  _clearPrefs(ClearPrefsEvent event, Emitter<SplashState> emit) async {
    await _sharedPrefs.clear();
  }
}