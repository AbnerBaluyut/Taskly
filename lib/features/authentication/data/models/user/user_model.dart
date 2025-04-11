import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: 'user_id', includeIfNull: false) int? userId,
    @JsonKey(name: 'user_email', includeIfNull: false) String? userEmail,
    @JsonKey(name: 'user_name', includeIfNull: false) String? userName,
    @JsonKey(name: 'user_image', includeIfNull: false) String? userImage,
    @JsonKey(name: "access", includeIfNull: false) String? accessToken,
    @JsonKey(name: "refresh", includeIfNull: false)  String? refreshToken
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

extension UserModelX on UserModel {
  
  UserEntity toEntity() => UserEntity(
    id: userId ?? 0,
    email: userEmail ?? "",
    name: userName ?? "",
    image: userImage ?? "",
    accessToken: accessToken ?? "",
    refreshToken: refreshToken ?? ""
  );
}