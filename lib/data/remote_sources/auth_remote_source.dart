import 'package:dio/dio.dart';

import '../../features/authentication/data/models/login/login_response_model.dart';
import '../../features/authentication/data/models/register/register_response_model.dart';

abstract class AuthRemoteSource {

  Future<LoginResponseModel> login(body, CancelToken? cancelToken);
  Future<RegisterResponseModel> register(body, CancelToken? cancelToken);
}