import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:taskly/core/extensions/int_extension.dart';

import '../../../core/utils/shared_preferences_manager.dart';
import 'splash_event.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {

  final SharedPreferenceManager _sharedPreferenceManager;
  
  SplashBloc() : 
    _sharedPreferenceManager = GetIt.instance<SharedPreferenceManager>(),
    super(SplashInitialState()) {
      on<SplashEvent>(_init);
    }

  void _init(SplashEvent event, Emitter<SplashState> emit) async {

    emit(SplashLoadingState());
    await Future.delayed(3.seconds());
    emit(SplashLoadedState(
      isUserLoggedIn: _sharedPreferenceManager.isLoggedIn,
      isOnBoardingCompleted: _sharedPreferenceManager.isSkipOnBoarding
    ));
  }
}