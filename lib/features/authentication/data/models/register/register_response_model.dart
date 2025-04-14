import 'package:freezed_annotation/freezed_annotation.dart';

import '../user/user_model.dart';

part 'register_response_model.freezed.dart';
part 'register_response_model.g.dart';

@freezed
abstract class RegisterResponseModel with _$RegisterResponseModel {

  const factory RegisterResponseModel({
    @JsonKey(name: 'status', defaultValue: 0) required int status,
    @JsonKey(name: 'message') required String message,
    @JsonKey(name: 'data') required UserModel data,
  }) = _RegisterResponseModel;
 
  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) => _$RegisterResponseModelFromJson(json); 
}