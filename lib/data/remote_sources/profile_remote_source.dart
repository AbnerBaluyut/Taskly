import 'package:fpdart/fpdart.dart';

import '../../features/profile/data/models/edit_profile_response_model.dart';
import '../_bases/base_remote_source.dart';

abstract class ProfileRemoteSource extends BaseRemoteSource {

  TaskEither<String, EditProfileResponseModel> editProfile(body);
  TaskEither<String, bool> changePassword(body);
}