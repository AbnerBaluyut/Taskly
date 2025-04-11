// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {
  @JsonKey(name: 'user_id', includeIfNull: false)
  int? get userId;
  @JsonKey(name: 'user_email', includeIfNull: false)
  String? get userEmail;
  @JsonKey(name: 'user_name', includeIfNull: false)
  String? get userName;
  @JsonKey(name: 'user_image', includeIfNull: false)
  String? get userImage;
  @JsonKey(name: "access", includeIfNull: false)
  String? get accessToken;
  @JsonKey(name: "refresh", includeIfNull: false)
  String? get refreshToken;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<UserModel> get copyWith =>
      _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userImage, userImage) ||
                other.userImage == userImage) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, userEmail, userName,
      userImage, accessToken, refreshToken);

  @override
  String toString() {
    return 'UserModel(userId: $userId, userEmail: $userEmail, userName: $userName, userImage: $userImage, accessToken: $accessToken, refreshToken: $refreshToken)';
  }
}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) =
      _$UserModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id', includeIfNull: false) int? userId,
      @JsonKey(name: 'user_email', includeIfNull: false) String? userEmail,
      @JsonKey(name: 'user_name', includeIfNull: false) String? userName,
      @JsonKey(name: 'user_image', includeIfNull: false) String? userImage,
      @JsonKey(name: "access", includeIfNull: false) String? accessToken,
      @JsonKey(name: "refresh", includeIfNull: false) String? refreshToken});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? userEmail = freezed,
    Object? userName = freezed,
    Object? userImage = freezed,
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_self.copyWith(
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      userEmail: freezed == userEmail
          ? _self.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      userImage: freezed == userImage
          ? _self.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: freezed == accessToken
          ? _self.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserModel implements UserModel {
  const _UserModel(
      {@JsonKey(name: 'user_id', includeIfNull: false) this.userId,
      @JsonKey(name: 'user_email', includeIfNull: false) this.userEmail,
      @JsonKey(name: 'user_name', includeIfNull: false) this.userName,
      @JsonKey(name: 'user_image', includeIfNull: false) this.userImage,
      @JsonKey(name: "access", includeIfNull: false) this.accessToken,
      @JsonKey(name: "refresh", includeIfNull: false) this.refreshToken});
  factory _UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override
  @JsonKey(name: 'user_id', includeIfNull: false)
  final int? userId;
  @override
  @JsonKey(name: 'user_email', includeIfNull: false)
  final String? userEmail;
  @override
  @JsonKey(name: 'user_name', includeIfNull: false)
  final String? userName;
  @override
  @JsonKey(name: 'user_image', includeIfNull: false)
  final String? userImage;
  @override
  @JsonKey(name: "access", includeIfNull: false)
  final String? accessToken;
  @override
  @JsonKey(name: "refresh", includeIfNull: false)
  final String? refreshToken;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserModelCopyWith<_UserModel> get copyWith =>
      __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userImage, userImage) ||
                other.userImage == userImage) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, userEmail, userName,
      userImage, accessToken, refreshToken);

  @override
  String toString() {
    return 'UserModel(userId: $userId, userEmail: $userEmail, userName: $userName, userImage: $userImage, accessToken: $accessToken, refreshToken: $refreshToken)';
  }
}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(
          _UserModel value, $Res Function(_UserModel) _then) =
      __$UserModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id', includeIfNull: false) int? userId,
      @JsonKey(name: 'user_email', includeIfNull: false) String? userEmail,
      @JsonKey(name: 'user_name', includeIfNull: false) String? userName,
      @JsonKey(name: 'user_image', includeIfNull: false) String? userImage,
      @JsonKey(name: "access", includeIfNull: false) String? accessToken,
      @JsonKey(name: "refresh", includeIfNull: false) String? refreshToken});
}

/// @nodoc
class __$UserModelCopyWithImpl<$Res> implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = freezed,
    Object? userEmail = freezed,
    Object? userName = freezed,
    Object? userImage = freezed,
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_UserModel(
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      userEmail: freezed == userEmail
          ? _self.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      userImage: freezed == userImage
          ? _self.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: freezed == accessToken
          ? _self.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
