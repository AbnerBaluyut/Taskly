
import 'package:bloc/bloc.dart';

import '../../../../_di/dependencies.dart';
import '../../../../core/utils/secure_storage_manager.dart';
part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  
  final SecureStorageManager _sharedPreferenceManager;

  WelcomeBloc() : 
    _sharedPreferenceManager = getIt(),
    super(WelcomeInitialState()) {
      on<OnTapGetStartedEvent>(_getStarted);
      on<OnTapLoginEvent>(_login);
    }

  void _getStarted(OnTapGetStartedEvent event, Emitter<WelcomeState> emit) async {
    _sharedPreferenceManager.setIsSkipOnBoarding(true);
    emit(OnTapGetStartedState());
  }

  void _login(OnTapLoginEvent event, Emitter<WelcomeState> emit) async {
    _sharedPreferenceManager.setIsSkipOnBoarding(true);
    emit(OnTapLoginState());
  } 
}