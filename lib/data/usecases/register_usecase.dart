import 'dart:io';

import '../../features/authentication/domain/entities/user_entity.dart';
import '../_bases/base_usecase.dart';

abstract class RegisterUseCase extends BaseUseCase {

  Future<UserEntity> execute(
    {
      required String userName,
      required String userEmail,
      required String password,
      File? imageFile
    }
  );
}