import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/constants/endpoints.dart';
import '../../../../core/services/dio_client.dart';
import '../../../../core/styles/strings.dart';
import '../../../../core/utils/secure_storage_manager.dart';
import '../../../../data/remote_sources/profile_remote_source.dart';
import '../models/edit_profile_response_model.dart';

class ProfileRemoteSourceImpl implements ProfileRemoteSource {

  final DioClient client;
  final SecureStorageManager sharedPreferenceManager;

  ProfileRemoteSourceImpl({
    required this.client,
    required this.sharedPreferenceManager
  });

  @override
  TaskEither<String, EditProfileResponseModel> editProfile(body) {

    return TaskEither.tryCatch(() async {

      final user = await sharedPreferenceManager.getUser;
      final response = await client.patch(
        "${Endpoints.editProfile}${user.id}/",
        body: body,
      );
      return EditProfileResponseModel.fromJson(response.data);
    }, (err, _) {
      log("editProfile err: $err");
      if (err is DioException) {
        return err.error.toString();
      }
      return Strings.errorMessage;
    });
  }
  
  @override
  TaskEither<String, bool> changePassword(body) {

    return TaskEither.tryCatch(() async {
      final response = await client.patch(
        Endpoints.changePassword,
        body: body
      );
      return response.statusCode == 200;
    }, (err, _) {
      log("changePassword err: $err");
      if (err is DioException) {
        return err.error.toString();
      }
      return Strings.errorMessage;
    });
  }
  
  @override
  void cancel() => client.cancelRequest();
}