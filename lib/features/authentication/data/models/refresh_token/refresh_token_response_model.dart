
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/refresh_token_entity.dart';

part 'refresh_token_response_model.freezed.dart';
part 'refresh_token_response_model.g.dart';

@freezed
abstract class RefreshTokenResponseModel with _$RefreshTokenResponseModel {

  const factory RefreshTokenResponseModel({
    @JsonKey(name: 'refresh', defaultValue: '') required String refreshToken,
    @JsonKey(name: 'access', defaultValue: '') required String accessToken 
  }) = _RefreshTokenResponseModel;

  factory RefreshTokenResponseModel.fromJson(Map<String, dynamic> json) => _$RefreshTokenResponseModelFromJson(json);
}

extension RefreshTokenResponseModelX on RefreshTokenResponseModel {

  RefreshTokenEntity toEntity() => RefreshTokenEntity(
    accessToken: (accessToken.trim().isNotEmpty) ? accessToken : null,
    refreshToken: (refreshToken.trim().isNotEmpty) ? refreshToken : null
  );
}
