
import 'package:fpdart/fpdart.dart';

import '../../features/authentication/domain/entities/user_entity.dart';
import '../../features/profile/domain/payloads/change_password_param.dart';
import '../../features/profile/domain/payloads/edit_profile_param.dart';
import '../_bases/base_repository.dart';

abstract class ProfileRepository extends BaseRepository {

  TaskEither<String, UserEntity> editProfile(EditProfileParam param);
  TaskEither<String, bool> changePassword(ChangePasswordParam param);
}