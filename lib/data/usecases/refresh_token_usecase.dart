import '../../features/authentication/domain/entities/refresh_token_entity.dart';

abstract class RefreshTokenUseCase {

  Future<RefreshTokenEntity> execute({required String refreshToken});
}