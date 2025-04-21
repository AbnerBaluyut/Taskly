import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../core/constants/endpoints.dart';
import '../../../../core/services/dio_client.dart';
import '../../../../core/services/errors/unknown_exception.dart';
import '../../../../core/styles/strings.dart';
import '../../../../core/utils/shared_preferences_manager.dart';
import '../../../../data/remote_sources/profile_remote_source.dart';
import '../models/edit_profile_response_model.dart';

class ProfileRemoteSourceImpl implements ProfileRemoteSource {

  final DioClient client;
  final SharedPreferenceManager sharedPreferenceManager;

  ProfileRemoteSourceImpl({
    required this.client,
    required this.sharedPreferenceManager
  });

  @override
  Future<EditProfileResponseModel> editProfile(body) async {

    try {
      
      final response = await client.patch(
        "${Endpoints.editProfile}${sharedPreferenceManager.getUser.id}/",
        body: body,
      );

      return EditProfileResponseModel.fromJson(response.data);

    } on DioException catch (e) {
      throw e.error ?? UnknownException(Strings.errorMessage);
    } catch (e) {
      log("editProfile err: $e");
      throw Exception(Strings.errorMessage);
    }
  }
  
  @override
  Future<bool> changePassword(body) async {

    try {
      
      final response = await client.patch(
        Endpoints.changePassword,
        body: body
      );

      return response.statusCode == 200;

    } on DioException catch (e) {
      throw e.error ?? UnknownException(Strings.errorMessage);
    } catch (e) {
      log("changePassword err: $e");
      throw Exception(Strings.errorMessage);
    }
  }
  
  @override
  void cancel() => client.cancelRequest();
}