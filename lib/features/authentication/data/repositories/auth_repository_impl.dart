
import 'package:fpdart/fpdart.dart';
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
  TaskEither<String, UserEntity> login(LoginParam param) {
    final result = remoteSource.login(param.toFormData()).map((model) => model.data.toEntity());
    return result;
  }

  @override
  TaskEither<String, UserEntity> register(RegisterParam param)  {
    final result = remoteSource.register(param.toFormData()).map((model) => model.data.toEntity());
    return result;
  }

  @override
  TaskEither<String, RefreshTokenEntity> refreshToken(RefreshTokenParam param)  {
    final result = remoteSource.refreshToken(param.toJson()).map((model) => model.toEntity());
    return result;
  }
  
  @override
  void cancel() => remoteSource.cancel();
}