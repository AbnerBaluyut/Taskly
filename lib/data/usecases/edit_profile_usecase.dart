import 'dart:io';

import 'package:dio/dio.dart';

import '../../features/authentication/domain/entities/user_entity.dart';

abstract class EditProfileUseCase {
  
  Future<UserEntity> execute(
    CancelToken? cancelToken,
    {
      required String name,
      File? file,
    }
  );
}