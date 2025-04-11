import 'dart:io';

import 'package:dio/dio.dart';

import '../../features/authentication/domain/entities/user_entity.dart';

abstract class RegisterUseCase {

  Future<UserEntity> execute(
    CancelToken cancelToken,
    {
      required String userName,
      required String userEmail,
      required String password,
      File? imageFile
    }
  );
}