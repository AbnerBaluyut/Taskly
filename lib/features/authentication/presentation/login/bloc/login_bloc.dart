import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../_di/dependencies.dart';
import '../../../../../core/utils/secure_storage_manager.dart';
import '../../../../../data/usecases/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final LoginUseCase _loginUseCase;
  final SecureStorageManager _sharedPrefsManager;

  LoginBloc() : 
    _loginUseCase = getIt(),
    _sharedPrefsManager = getIt(),
    super(LoginInitialState()) {
      on<DoLoginEvent>(_login);
      on<CancelEvent>(_cancel);
    }

  void _login(DoLoginEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());
    final result = await _loginUseCase.execute(email: event.email, password: event.password).run();
    result.match((err) {
      emit(LoginFailureState(err));
    }, (user) {
      _sharedPrefsManager
        ..setUser(user)
        ..setIsLoggedIn(true);
      emit(LoginSuccessState());
    });
  }

  void _cancel(CancelEvent event, Emitter<LoginState> emit) {
    _loginUseCase.cancel();
    emit(CancelState());
  }
}