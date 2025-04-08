
import 'package:dio/dio.dart';

import '../../../../data/repositories/auth_repository.dart';
import '../../../../data/usecases/login_usecase.dart';
import '../entities/user_entity.dart';
import '../payloads/login_param.dart';

class LoginUseCaseImpl implements LoginUseCase {

  final AuthRepository repository;

  LoginUseCaseImpl({
    required this.repository,
  });

  @override
  Future<UserEntity> execute(CancelToken? cancelToken, {required String email, required String password}) {
    final param = LoginParam(email: email, password: password);
    return repository.login(param, cancelToken);
  }
}