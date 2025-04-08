import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/utils/shared_preferences_manager.dart';
import '../../../../data/usecases/login_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final LoginUseCase loginUseCase;
  final SharedPreferenceManager sharedPrefsManager;

  CancelToken _cancelToken = CancelToken();

  AuthBloc() : 
    loginUseCase = GetIt.I<LoginUseCase>(),
    sharedPrefsManager = GetIt.I<SharedPreferenceManager>(),
    super(AuthInitial()) {
      on<LoginEvent>(_login);
      on<CancelEvent>(_cancelRequest);
    }

  void _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final result = await loginUseCase.execute(email: event.email, password: event.password, _cancelToken);
      sharedPrefsManager
        ..setUser(result)
        ..setIsLoggedIn(true);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  void _cancelRequest(CancelEvent event, Emitter<AuthState> emit) {
    _cancelToken.cancel();
    _cancelToken = CancelToken();
    emit(AuthCancel());
  }
}