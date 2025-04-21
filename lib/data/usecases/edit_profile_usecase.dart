import 'dart:io';

import '../../features/authentication/domain/entities/user_entity.dart';
import '../_bases/base_usecase.dart';

abstract class EditProfileUseCase extends BaseUseCase {
  
  Future<UserEntity> execute(
    {
      required String name,
      File? file,
    }
  );
}