import 'package:dio/dio.dart';

import '../../features/authentication/domain/entities/user_entity.dart';
import '../../features/authentication/domain/payloads/login_param.dart';

abstract class AuthRepository {

  Future<UserEntity> login(LoginParam param, CancelToken? cancelToken);
}