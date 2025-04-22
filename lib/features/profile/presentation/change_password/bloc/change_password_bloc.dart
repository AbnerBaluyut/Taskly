import 'package:bloc/bloc.dart';

import '../../../../../_di/dependencies.dart';
import '../../../../../core/styles/strings.dart';
import '../../../../../data/usecases/change_password_usecase.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';


class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> {

  final ChangePasswordUseCase _changePasswordUseCase;

  ChangePasswordBloc() :
    _changePasswordUseCase = getIt(),
    super(UpdatePasswordInitialState()) {
      on<UpdatePasswordEvent>(_changePassword);
    }

  _changePassword(UpdatePasswordEvent event, Emitter<ChangePasswordState> emit) async {

    emit(UpdatePasswordLoadingState());
    var result = await _changePasswordUseCase.execute(currentPassword: event.currentPassword, newPassword: event.newPassword).run();
    result.match((err) {
      emit(UpdatePasswordErrorState(err));
    }, (isSuccess) {
      if (isSuccess) {
        emit(UpdatePasswordSuccessState());
      } else {
        emit(UpdatePasswordErrorState(Strings.errorMessage));
      }
    });
  }

  @override
  Future<void> close() {
    _changePasswordUseCase.cancel();
    return super.close();
  }
}