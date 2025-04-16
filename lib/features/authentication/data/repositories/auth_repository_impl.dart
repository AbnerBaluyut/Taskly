
import 'package:dio/dio.dart';
import 'package:taskly/features/authentication/data/models/refresh_token/refresh_token_response_model.dart';
import 'package:taskly/features/authentication/data/models/user/user_model.dart';

import '../../../../data/remote_sources/auth_remote_source.dart';
import '../../domain/entities/refresh_token_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../../../../data/repositories/auth_repository.dart';
import '../../domain/payloads/login_param.dart';
import '../../domain/payloads/refresh_token_param.dart';
import '../../domain/payloads/register_param.dart';

class AuthRepositoryImpl implements AuthRepository {

  final AuthRemoteSource remoteSource;

  AuthRepositoryImpl({
    required this.remoteSource,
  });
  
  @override
  Future<UserEntity> login(LoginParam param, CancelToken? cancelToken) async {
    final model = await remoteSource.login(param.toFormData(), cancelToken);
    return model.data.toEntity();
  }

  @override
  Future<UserEntity> register(RegisterParam param, CancelToken? cancelToken) async {
    final model = await remoteSource.register(param.toFormData(), cancelToken);
    return model.data.toEntity();
  }

  @override
  Future<RefreshTokenEntity> refreshToken(RefreshTokenParam param) async {
    final model = await remoteSource.refreshToken(param.toJson());
    return model.toEntity();
  }
}