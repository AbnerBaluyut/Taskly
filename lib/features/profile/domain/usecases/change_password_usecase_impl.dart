import 'package:dio/dio.dart';

import '../../../../data/repositories/profile_repository.dart';
import '../../../../data/usecases/change_password_usecase.dart';
import '../payloads/change_password_param.dart';

class ChangePasswordUseCaseImpl implements ChangePasswordUseCase {

  final ProfileRepository repository;

  ChangePasswordUseCaseImpl({
    required this.repository
  });

  @override
  Future<bool> execute(CancelToken? cancelToken, {required String currentPassword, required String newPassword}) {
    var param = ChangePasswordParam(
      currentPassword: currentPassword,
      newPassword: newPassword
    );
    return repository.changePassword(param, cancelToken);
  }
}