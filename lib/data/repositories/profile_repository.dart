
import 'package:dio/dio.dart';

import '../../features/authentication/domain/entities/user_entity.dart';
import '../../features/profile/domain/payloads/change_password_param.dart';
import '../../features/profile/domain/payloads/edit_profile_param.dart';

abstract class ProfileRepository {

  Future<UserEntity> editProfile(EditProfileParam param, CancelToken? cancelToken);
  Future<bool> changePassword(ChangePasswordParam param, CancelToken? cancelToken);
}