import 'package:dio/dio.dart';

import '../../features/authentication/data/models/login/login_response_model.dart';

abstract class AuthRemoteSource {

  Future<LoginResponseModel> login(Map<String, dynamic> param, CancelToken? cancelToken);
}