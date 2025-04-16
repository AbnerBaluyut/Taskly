// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refresh_token_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RefreshTokenResponseModel {
  @JsonKey(name: 'refresh', defaultValue: '')
  String get refreshToken;
  @JsonKey(name: 'access', defaultValue: '')
  String get accessToken;

  /// Create a copy of RefreshTokenResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RefreshTokenResponseModelCopyWith<RefreshTokenResponseModel> get copyWith =>
      _$RefreshTokenResponseModelCopyWithImpl<RefreshTokenResponseModel>(
          this as RefreshTokenResponseModel, _$identity);

  /// Serializes this RefreshTokenResponseModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RefreshTokenResponseModel &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, refreshToken, accessToken);

  @override
  String toString() {
    return 'RefreshTokenResponseModel(refreshToken: $refreshToken, accessToken: $accessToken)';
  }
}

/// @nodoc
abstract mixin class $RefreshTokenResponseModelCopyWith<$Res> {
  factory $RefreshTokenResponseModelCopyWith(RefreshTokenResponseModel value,
          $Res Function(RefreshTokenResponseModel) _then) =
      _$RefreshTokenResponseModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'refresh', defaultValue: '') String refreshToken,
      @JsonKey(name: 'access', defaultValue: '') String accessToken});
}

/// @nodoc
class _$RefreshTokenResponseModelCopyWithImpl<$Res>
    implements $RefreshTokenResponseModelCopyWith<$Res> {
  _$RefreshTokenResponseModelCopyWithImpl(this._self, this._then);

  final RefreshTokenResponseModel _self;
  final $Res Function(RefreshTokenResponseModel) _then;

  /// Create a copy of RefreshTokenResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refreshToken = null,
    Object? accessToken = null,
  }) {
    return _then(_self.copyWith(
      refreshToken: null == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      accessToken: null == accessToken
          ? _self.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _RefreshTokenResponseModel implements RefreshTokenResponseModel {
  const _RefreshTokenResponseModel(
      {@JsonKey(name: 'refresh', defaultValue: '') required this.refreshToken,
      @JsonKey(name: 'access', defaultValue: '') required this.accessToken});
  factory _RefreshTokenResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseModelFromJson(json);

  @override
  @JsonKey(name: 'refresh', defaultValue: '')
  final String refreshToken;
  @override
  @JsonKey(name: 'access', defaultValue: '')
  final String accessToken;

  /// Create a copy of RefreshTokenResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RefreshTokenResponseModelCopyWith<_RefreshTokenResponseModel>
      get copyWith =>
          __$RefreshTokenResponseModelCopyWithImpl<_RefreshTokenResponseModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RefreshTokenResponseModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RefreshTokenResponseModel &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, refreshToken, accessToken);

  @override
  String toString() {
    return 'RefreshTokenResponseModel(refreshToken: $refreshToken, accessToken: $accessToken)';
  }
}

/// @nodoc
abstract mixin class _$RefreshTokenResponseModelCopyWith<$Res>
    implements $RefreshTokenResponseModelCopyWith<$Res> {
  factory _$RefreshTokenResponseModelCopyWith(_RefreshTokenResponseModel value,
          $Res Function(_RefreshTokenResponseModel) _then) =
      __$RefreshTokenResponseModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'refresh', defaultValue: '') String refreshToken,
      @JsonKey(name: 'access', defaultValue: '') String accessToken});
}

/// @nodoc
class __$RefreshTokenResponseModelCopyWithImpl<$Res>
    implements _$RefreshTokenResponseModelCopyWith<$Res> {
  __$RefreshTokenResponseModelCopyWithImpl(this._self, this._then);

  final _RefreshTokenResponseModel _self;
  final $Res Function(_RefreshTokenResponseModel) _then;

  /// Create a copy of RefreshTokenResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? refreshToken = null,
    Object? accessToken = null,
  }) {
    return _then(_RefreshTokenResponseModel(
      refreshToken: null == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      accessToken: null == accessToken
          ? _self.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
