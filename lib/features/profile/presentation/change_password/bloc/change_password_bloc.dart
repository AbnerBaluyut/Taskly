import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../../../../../_di/injections.dart';
import '../../../../../core/styles/strings.dart';
import '../../../../../data/usecases/change_password_usecase.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';


class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> {

  final ChangePasswordUseCase _changePasswordUseCase;

  CancelToken _cancelToken = CancelToken();

  ChangePasswordBloc() :
    _changePasswordUseCase = getIt(),
    super(UpdatePasswordInitialState()) {
      on<UpdatePasswordEvent>(_changePassword);
    }

  _changePassword(UpdatePasswordEvent event, Emitter<ChangePasswordState> emit) async {

    emit(UpdatePasswordLoadingState());
    try {

      var isSuccess = await _changePasswordUseCase.execute(currentPassword: event.currentPassword, newPassword: event.newPassword, _cancelToken);

      if (isSuccess) {
        emit(UpdatePasswordSuccessState());
      } else {
        emit(UpdatePasswordErrorState(Strings.errorMessage));
      }
      
    } catch (e) {
      emit(UpdatePasswordErrorState(e.toString()));
    }
  }

  void _cancel() {

    _cancelToken.cancel();
    _cancelToken = CancelToken();
  }

  @override
  Future<void> close() {
    _cancel();
    return super.close();
  }
}