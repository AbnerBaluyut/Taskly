import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../../../../../_di/injections.dart';
import '../../../../../core/utils/shared_preferences_manager.dart';
import '../../../../../data/usecases/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final LoginUseCase _loginUseCase;
  final SharedPreferenceManager _sharedPrefsManager;

  CancelToken _cancelToken = CancelToken();

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
      final result = await _loginUseCase.execute(email: event.email, password: event.password, _cancelToken);
      _sharedPrefsManager
        ..setUser(result)
        ..setIsLoggedIn(true);
      emit(LoginSuccessState());
    } catch (e) {
      emit(LoginFailureState(e.toString()));
    }
  }

  void _cancel(CancelEvent event, Emitter<LoginState> emit) {
    _cancelToken.cancel();
    _cancelToken = CancelToken();
    emit(CancelState());
  }
}