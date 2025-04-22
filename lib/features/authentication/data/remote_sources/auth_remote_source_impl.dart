

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/constants/endpoints.dart';
import '../../../../core/services/dio_client.dart';
import '../../../../core/styles/strings.dart';
import '../../../../data/remote_sources/auth_remote_source.dart';
import '../models/login/login_response_model.dart';
import '../models/refresh_token/refresh_token_response_model.dart';
import '../models/register/register_response_model.dart';

class AuthRemoteSourceImpl implements AuthRemoteSource {

  final DioClient client;

  AuthRemoteSourceImpl({
    required this.client
  });

  @override
  TaskEither<String, LoginResponseModel> login(body) {

    return TaskEither.tryCatch(() async {
      final response = await client.post(
        Endpoints.login,
        body: body
      );
      return LoginResponseModel.fromJson(response.data);
    }, (err, _) {
      log("login err: $err");
      if (err is DioException) {
        return err.error.toString();
      }
      return Strings.errorMessage;
    });
  }

  @override
  TaskEither<String, RegisterResponseModel> register(body) {

    return TaskEither.tryCatch(() async {
      final response = await client.post(
        Endpoints.register,
        body: body,
      );
      return RegisterResponseModel.fromJson(response.data);
    }, (err, _) {
      log("register err: $err");
      if (err is DioException) {
        return err.error.toString();
      }
      return Strings.errorMessage;
    });
  }
  
  @override
  TaskEither<String, RefreshTokenResponseModel> refreshToken(body) {

    return TaskEither.tryCatch(() async {
      final response = await client.post(
        Endpoints.refreshToken,
        body: body
      );
      return RefreshTokenResponseModel.fromJson(response.data);
    }, (err, _) {
      log("refreshToken err: $err");
      if (err is DioException) {
        return err.error.toString();
      }
      return Strings.errorMessage;
    });
  }
  
  @override
  void cancel() => client.cancelRequest();
}