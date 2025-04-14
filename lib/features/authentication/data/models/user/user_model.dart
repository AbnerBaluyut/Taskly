import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: 'user_id', defaultValue: 0) required int userId,
    @JsonKey(name: 'user_email', defaultValue: "") required String userEmail,
    @JsonKey(name: 'user_name', defaultValue: "") required String userName,
    @JsonKey(name: 'user_image', defaultValue: "") required String userImage,
    @JsonKey(name: "access", defaultValue: "") required String accessToken,
    @JsonKey(name: "refresh", defaultValue: "") required String refreshToken
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

extension UserModelX on UserModel {
  
  UserEntity toEntity() => UserEntity(
    id: userId,
    email: userEmail,
    name: userName,
    image: userImage,
    accessToken: accessToken,
    refreshToken: refreshToken
  );
}