import 'package:dio/dio.dart';

import '../../features/authentication/domain/entities/user_entity.dart';

abstract class LoginUseCase {

  Future<UserEntity> execute(
    CancelToken? cancelToken,
    {
      required String email,
      required String password
    }
  );
}