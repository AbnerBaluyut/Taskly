import 'package:fpdart/fpdart.dart';

import '../../features/authentication/data/models/login/login_response_model.dart';
import '../../features/authentication/data/models/refresh_token/refresh_token_response_model.dart';
import '../../features/authentication/data/models/register/register_response_model.dart';
import '../_bases/base_remote_source.dart';

abstract class AuthRemoteSource extends BaseRemoteSource {

  TaskEither<String, LoginResponseModel> login(body);
  TaskEither<String, RegisterResponseModel> register(body);
  TaskEither<String, RefreshTokenResponseModel> refreshToken(body);
}