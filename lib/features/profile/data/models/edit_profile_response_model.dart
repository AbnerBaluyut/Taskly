
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_response_model.freezed.dart';
part 'edit_profile_response_model.g.dart';

@freezed
abstract class EditProfileResponseModel with _$EditProfileResponseModel {

  const factory EditProfileResponseModel({
    required String message
  }) = _EditProfileResponseModel;

  factory EditProfileResponseModel.fromJson(Map<String, dynamic> json) => _$EditProfileResponseModelFromJson(json);
}