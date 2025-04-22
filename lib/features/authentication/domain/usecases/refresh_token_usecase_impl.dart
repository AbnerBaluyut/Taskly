import 'package:fpdart/fpdart.dart';

import '../../../../data/repositories/auth_repository.dart';
import '../../../../data/usecases/refresh_token_usecase.dart';
import '../entities/refresh_token_entity.dart';
import '../payloads/refresh_token_param.dart';


class RefreshTokenUseCaseImpl implements RefreshTokenUseCase {

  final AuthRepository repository;

  RefreshTokenUseCaseImpl({
    required this.repository,
  });
  
  @override
  TaskEither<String, RefreshTokenEntity> execute({required String refreshToken}) {
    var param = RefreshTokenParam(
      refreshToken: refreshToken
    );
    return repository.refreshToken(param);
  }
}