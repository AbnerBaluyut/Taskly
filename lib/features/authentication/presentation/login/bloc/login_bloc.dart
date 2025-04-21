import 'package:bloc/bloc.dart';

import '../../../../../_di/injections.dart';
import '../../../../../core/utils/shared_preferences_manager.dart';
import '../../../../../data/usecases/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final LoginUseCase _loginUseCase;
  final SharedPreferenceManager _sharedPrefsManager;

  LoginBloc() : 
    _loginUseCase = getIt(),
    _sharedPrefsManager = getIt(),
    super(LoginInitialState()) {
      on<DoLoginEvent>(_login);
      on<CancelEvent>(_cancel);
    }

  void _login(DoLoginEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());
    try {
      final result = await _loginUseCase.execute(email: event.email, password: event.password);
      _sharedPrefsManager
        ..setUser(result)
        ..setIsLoggedIn(true);
      emit(LoginSuccessState());
    } catch (e) {
      emit(LoginFailureState(e.toString()));
    }
  }

  void _cancel(CancelEvent event, Emitter<LoginState> emit) {
    _loginUseCase.cancel();
    emit(CancelState());
  }
}