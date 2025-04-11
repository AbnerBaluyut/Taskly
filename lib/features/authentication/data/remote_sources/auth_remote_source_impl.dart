

import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../core/constants/endpoints.dart';
import '../../../../core/errors/unknown_exception.dart';
import '../../../../core/services/dio_client.dart';
import '../../../../core/styles/strings.dart';
import '../../../../data/remote_sources/auth_remote_source.dart';
import '../models/login/login_response_model.dart';
import '../models/register/register_response_model.dart';

class AuthRemoteSourceImpl implements AuthRemoteSource {

  final DioClient client;

  AuthRemoteSourceImpl({
    required this.client
  });

  @override
  Future<LoginResponseModel> login(body, CancelToken? cancelToken) async {
    
    try {
      
      final response = await client.instance.post(
        Endpoints.login,
        data: body,
        cancelToken: cancelToken
      );

      return LoginResponseModel.fromJson(response.data);

    } on DioException catch (e) {
      throw e.error ?? UnknownException(Strings.errorMessage);
    } catch (e) {
      log("login err: $e");
      throw Exception(Strings.errorMessage);
    }
  }

  @override
  Future<RegisterResponseModel> register(body, CancelToken? cancelToken) async {
   
    try {
      
      final response = await client.instance.post(
        Endpoints.register,
        data: body,
        cancelToken: cancelToken
      );

      return RegisterResponseModel.fromJson(response.data);

    } on DioException catch (e) {
      throw e.error ?? UnknownException(Strings.errorMessage);
    } catch (e) {
      log("register err: $e");
      throw Exception(Strings.errorMessage);
    }
  }
}