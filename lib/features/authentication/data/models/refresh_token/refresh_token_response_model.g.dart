// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RefreshTokenResponseModel _$RefreshTokenResponseModelFromJson(
        Map<String, dynamic> json) =>
    _RefreshTokenResponseModel(
      refreshToken: json['refresh'] as String? ?? '',
      accessToken: json['access'] as String? ?? '',
    );

Map<String, dynamic> _$RefreshTokenResponseModelToJson(
        _RefreshTokenResponseModel instance) =>
    <String, dynamic>{
      'refresh': instance.refreshToken,
      'access': instance.accessToken,
    };
