

import 'package:freezed_annotation/freezed_annotation.dart';

import '../user/user_model.dart';

part 'login_response_model.freezed.dart';
part 'login_response_model.g.dart';

@freezed
abstract class LoginResponseModel with _$LoginResponseModel {
  
  const factory LoginResponseModel({
    @JsonKey(name: 'status') required int status,
    @JsonKey(name: 'message') required String message,
    @JsonKey(name: 'data') required UserModel data,
  }) = _LoginResponseModel;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => _$LoginResponseModelFromJson(json);
}