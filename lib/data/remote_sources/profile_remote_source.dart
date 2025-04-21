import '../../features/profile/data/models/edit_profile_response_model.dart';
import '../_bases/base_remote_source.dart';

abstract class ProfileRemoteSource extends BaseRemoteSource {

  Future<EditProfileResponseModel> editProfile(body);
  Future<bool> changePassword(body);
}