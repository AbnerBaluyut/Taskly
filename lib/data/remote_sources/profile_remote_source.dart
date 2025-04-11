import 'package:dio/dio.dart';

import '../../features/profile/data/models/edit_profile_response_model.dart';

abstract class ProfileRemoteSource {

  Future<EditProfileResponseModel> editProfile(body, CancelToken? cancelToken);
  Future<bool> changePassword(body, CancelToken? cancelToken);
}