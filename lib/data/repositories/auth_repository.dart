import 'package:dio/dio.dart';

import '../../features/authentication/domain/entities/refresh_token_entity.dart';
import '../../features/authentication/domain/entities/user_entity.dart';
import '../../features/authentication/domain/payloads/login_param.dart';
import '../../features/authentication/domain/payloads/refresh_token_param.dart';
import '../../features/authentication/domain/payloads/register_param.dart';

abstract class AuthRepository {

  Future<UserEntity> login(LoginParam param, CancelToken? cancelToken);
  Future<UserEntity> register(RegisterParam param, CancelToken? cancelToken);
  Future<RefreshTokenEntity> refreshToken(RefreshTokenParam param);
}