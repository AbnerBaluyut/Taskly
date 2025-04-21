import '../../features/authentication/domain/entities/refresh_token_entity.dart';
import '../../features/authentication/domain/entities/user_entity.dart';
import '../../features/authentication/domain/payloads/login_param.dart';
import '../../features/authentication/domain/payloads/refresh_token_param.dart';
import '../../features/authentication/domain/payloads/register_param.dart';
import '../_bases/base_repository.dart';

abstract class AuthRepository extends BaseRepository {

  Future<UserEntity> login(LoginParam param);
  Future<UserEntity> register(RegisterParam param);
  Future<RefreshTokenEntity> refreshToken(RefreshTokenParam param);
}