// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
      userId: (json['user_id'] as num?)?.toInt(),
      userEmail: json['user_email'] as String?,
      userName: json['user_name'] as String?,
      userImage: json['user_image'] as String?,
      accessToken: json['access'] as String?,
      refreshToken: json['refresh'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      if (instance.userId case final value?) 'user_id': value,
      if (instance.userEmail case final value?) 'user_email': value,
      if (instance.userName case final value?) 'user_name': value,
      if (instance.userImage case final value?) 'user_image': value,
      if (instance.accessToken case final value?) 'access': value,
      if (instance.refreshToken case final value?) 'refresh': value,
    };
