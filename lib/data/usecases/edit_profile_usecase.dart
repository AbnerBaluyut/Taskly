import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../../features/authentication/domain/entities/user_entity.dart';
import '../_bases/base_usecase.dart';

abstract class EditProfileUseCase extends BaseUseCase {
  
  TaskEither<String, UserEntity> execute(
    {
      required String name,
      File? file,
    }
  );
}