import 'package:dio/dio.dart';

abstract class ChangePasswordUseCase {

  Future<bool> execute(
    CancelToken? cancelToken, 
    {
      required String currentPassword, 
      required String newPassword
    }
  );
}