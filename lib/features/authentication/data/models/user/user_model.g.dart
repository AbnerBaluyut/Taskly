// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
      userId: (json['user_id'] as num?)?.toInt() ?? 0,
      userEmail: json['user_email'] as String? ?? '',
      userName: json['user_name'] as String? ?? '',
      userImage: json['user_image'] as String? ?? '',
      accessToken: json['access'] as String? ?? '',
      refreshToken: json['refresh'] as String? ?? '',
    );

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'user_email': instance.userEmail,
      'user_name': instance.userName,
      'user_image': instance.userImage,
      'access': instance.accessToken,
      'refresh': instance.refreshToken,
    };
