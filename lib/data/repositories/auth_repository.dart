import 'package:fpdart/fpdart.dart';

import '../../features/authentication/domain/entities/refresh_token_entity.dart';
import '../../features/authentication/domain/entities/user_entity.dart';
import '../../features/authentication/domain/payloads/login_param.dart';
import '../../features/authentication/domain/payloads/refresh_token_param.dart';
import '../../features/authentication/domain/payloads/register_param.dart';
import '../_bases/base_repository.dart';

abstract class AuthRepository extends BaseRepository {

  TaskEither<String, UserEntity> login(LoginParam param);
  TaskEither<String, UserEntity> register(RegisterParam param);
  TaskEither<String, RefreshTokenEntity> refreshToken(RefreshTokenParam param);
}