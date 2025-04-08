import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'user_email') required String userEmail,
    @JsonKey(name: 'user_name') required String userName,
    @JsonKey(name: 'user_image') required String userImage,
    @JsonKey(name: 'user_session_id') required String userSessionId,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

extension UserModelX on UserModel {
  
  UserEntity toEntity() => UserEntity(
    id: userId,
    email: userEmail,
    name: userName,
    image: userImage,
    sessionId: userSessionId,
  );
}