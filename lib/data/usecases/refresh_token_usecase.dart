import 'package:fpdart/fpdart.dart';

import '../../features/authentication/domain/entities/refresh_token_entity.dart';

abstract class RefreshTokenUseCase {

  TaskEither<String, RefreshTokenEntity> execute({required String refreshToken});
}