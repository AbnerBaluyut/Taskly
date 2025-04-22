import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../../features/authentication/domain/entities/user_entity.dart';
import '../_bases/base_usecase.dart';

abstract class RegisterUseCase extends BaseUseCase {

  TaskEither<String, UserEntity> execute(
    {
      required String userName,
      required String userEmail,
      required String password,
      File? imageFile
    }
  );
}