import 'dart:io';

import 'package:dio/dio.dart';

class RegisterParam {

  final File? imageFile;
  final String userName;  
  final String userEmail;
  final String password;
  final String confirmPassword;

  const RegisterParam({
    this.imageFile,
    required this.userName,
    required this.userEmail,
    required this.password,
    required this.confirmPassword
  });

  FormData toFormData() {

     Map<String, dynamic> map = {
      'username': userName,
      'email': userEmail,
      'password': password,
      'confirm_password': confirmPassword
    };

    if (imageFile != null) {
      map.addAll({
        'picture': MultipartFile.fromFileSync(
          imageFile!.path, 
          filename: (imageFile!.path).split('/').last
        )
      });
    }

    return FormData.fromMap(map);
  }
}