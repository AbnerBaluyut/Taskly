import '../../features/authentication/data/models/login/login_response_model.dart';
import '../../features/authentication/data/models/refresh_token/refresh_token_response_model.dart';
import '../../features/authentication/data/models/register/register_response_model.dart';
import '../_bases/base_remote_source.dart';

abstract class AuthRemoteSource extends BaseRemoteSource {

  Future<LoginResponseModel> login(body);
  Future<RegisterResponseModel> register(body);
  Future<RefreshTokenResponseModel> refreshToken(body);
}