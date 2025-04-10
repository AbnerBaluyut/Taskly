import 'package:dio/dio.dart';

class LoginParam {

  final String email;
  final String password;

  LoginParam({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
  };

  FormData toFormData() => FormData.fromMap(toJson());
}