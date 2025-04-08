import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../core/utils/shared_preferences_manager.dart';
import 'welcome_event.dart';
import 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  
  final SharedPreferenceManager _sharedPreferenceManager;

  WelcomeBloc() : 
    _sharedPreferenceManager = GetIt.instance<SharedPreferenceManager>(),
    super(WelcomeInitial()) {
      on<OnTapGetStarted>(_getStarted);
      on<OnTapLogin>(_login);
    }

  void _getStarted(OnTapGetStarted event, Emitter<WelcomeState> emit) async {
    _sharedPreferenceManager.setIsSkipOnBoarding(true);
    emit(OnTapGetStartedState());
  }

  void _login(OnTapLogin event, Emitter<WelcomeState> emit) async {
    _sharedPreferenceManager.setIsSkipOnBoarding(true);
    emit(OnTapLoginState());
  } 
}