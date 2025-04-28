import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taskly/core/extensions/int_ext.dart';

import '../../../_di/dependencies.dart';
import '../../../core/utils/secure_storage_manager.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {

  final SecureStorageManager _sharedPrefs = getIt();
  
  SplashBloc() : 
    super(SplashInitialState()) {
      on<LoadSplashEvent>(_init);
    }

  void _init(LoadSplashEvent event, Emitter<SplashState> emit) async {

    emit(SplashLoadingState());
    await Future.delayed(3.seconds());
    final isLoggedIn = await _sharedPrefs.isLoggedIn;
    final isCompleteOnBoarding = await _sharedPrefs.isSkipOnBoarding;
    if (isLoggedIn) {
      emit(GoToDashboardState());
    } else if (!isLoggedIn && isCompleteOnBoarding) {
      emit(GoToLoginState());
    } else {
      emit(GoToOnBoardingState());
    }
  }
}