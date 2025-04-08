// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
      userId: (json['user_id'] as num).toInt(),
      userEmail: json['user_email'] as String,
      userName: json['user_name'] as String,
      userImage: json['user_image'] as String,
      userSessionId: json['user_session_id'] as String,
    );

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'user_email': instance.userEmail,
      'user_name': instance.userName,
      'user_image': instance.userImage,
      'user_session_id': instance.userSessionId,
    };
