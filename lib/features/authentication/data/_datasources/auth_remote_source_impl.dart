

import 'package:dio/dio.dart';

import '../../../../core/constants/endpoints.dart';
import '../../../../core/error/unknown_exception.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/styles/strings.dart';
import '../../../../data/_datasources/auth_remote_source.dart';
import '../models/login/login_response_model.dart';

class AuthRemoteSourceImpl implements AuthRemoteSource {

  final DioClient client;

  AuthRemoteSourceImpl({
    required this.client
  });

  @override
  Future<LoginResponseModel> login(Map<String, dynamic> param, CancelToken? cancelToken) async {
    
    try {
      
      final response = await client.instance.post(
        Endpoints.login,
        data: FormData.fromMap(param),
        cancelToken: cancelToken
      );

      return LoginResponseModel.fromJson(response.data);

    } on DioException catch (e) {
      throw e.error ?? UnknownException(Strings.errorMessage);
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }
}