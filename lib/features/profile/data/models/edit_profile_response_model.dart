import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../authentication/data/models/user/user_model.dart';

part 'edit_profile_response_model.freezed.dart';
part 'edit_profile_response_model.g.dart';

@freezed
abstract class EditProfileResponseModel with _$EditProfileResponseModel {

  const factory EditProfileResponseModel({
    @JsonKey(name: 'message') required String message,
    @JsonKey(name: 'data') required UserModel data
  }) = _EditProfileResponseModel;

  factory EditProfileResponseModel.fromJson(Map<String, dynamic> json) => _$EditProfileResponseModelFromJson(json);
}