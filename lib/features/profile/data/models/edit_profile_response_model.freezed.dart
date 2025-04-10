// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_profile_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EditProfileResponseModel {
  String get message;

  /// Create a copy of EditProfileResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EditProfileResponseModelCopyWith<EditProfileResponseModel> get copyWith =>
      _$EditProfileResponseModelCopyWithImpl<EditProfileResponseModel>(
          this as EditProfileResponseModel, _$identity);

  /// Serializes this EditProfileResponseModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EditProfileResponseModel &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'EditProfileResponseModel(message: $message)';
  }
}

/// @nodoc
abstract mixin class $EditProfileResponseModelCopyWith<$Res> {
  factory $EditProfileResponseModelCopyWith(EditProfileResponseModel value,
          $Res Function(EditProfileResponseModel) _then) =
      _$EditProfileResponseModelCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$EditProfileResponseModelCopyWithImpl<$Res>
    implements $EditProfileResponseModelCopyWith<$Res> {
  _$EditProfileResponseModelCopyWithImpl(this._self, this._then);

  final EditProfileResponseModel _self;
  final $Res Function(EditProfileResponseModel) _then;

  /// Create a copy of EditProfileResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_self.copyWith(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _EditProfileResponseModel implements EditProfileResponseModel {
  const _EditProfileResponseModel({required this.message});
  factory _EditProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EditProfileResponseModelFromJson(json);

  @override
  final String message;

  /// Create a copy of EditProfileResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EditProfileResponseModelCopyWith<_EditProfileResponseModel> get copyWith =>
      __$EditProfileResponseModelCopyWithImpl<_EditProfileResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EditProfileResponseModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EditProfileResponseModel &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'EditProfileResponseModel(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$EditProfileResponseModelCopyWith<$Res>
    implements $EditProfileResponseModelCopyWith<$Res> {
  factory _$EditProfileResponseModelCopyWith(_EditProfileResponseModel value,
          $Res Function(_EditProfileResponseModel) _then) =
      __$EditProfileResponseModelCopyWithImpl;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$EditProfileResponseModelCopyWithImpl<$Res>
    implements _$EditProfileResponseModelCopyWith<$Res> {
  __$EditProfileResponseModelCopyWithImpl(this._self, this._then);

  final _EditProfileResponseModel _self;
  final $Res Function(_EditProfileResponseModel) _then;

  /// Create a copy of EditProfileResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_EditProfileResponseModel(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
