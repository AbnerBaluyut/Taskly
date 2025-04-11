import 'package:dio/dio.dart';

class ChangePasswordParam {

  final String currentPassword;
  final String newPassword;

  ChangePasswordParam({
    required this.currentPassword,
    required this.newPassword
  });

  Map<String, dynamic> toJson() => {
    'old_password': currentPassword,
    'new_password': newPassword
  };

  FormData toFormData() => FormData.fromMap(toJson());
}