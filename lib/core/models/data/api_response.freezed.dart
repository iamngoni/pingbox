// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

APIResponse _$APIResponseFromJson(Map<String, dynamic> json) {
  return _APIResponse.fromJson(json);
}

/// @nodoc
mixin _$APIResponse {
  bool get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  dynamic get data => throw _privateConstructorUsedError;

  /// Serializes this APIResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of APIResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $APIResponseCopyWith<APIResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $APIResponseCopyWith<$Res> {
  factory $APIResponseCopyWith(
          APIResponse value, $Res Function(APIResponse) then) =
      _$APIResponseCopyWithImpl<$Res, APIResponse>;
  @useResult
  $Res call({bool success, String? message, dynamic data});
}

/// @nodoc
class _$APIResponseCopyWithImpl<$Res, $Val extends APIResponse>
    implements $APIResponseCopyWith<$Res> {
  _$APIResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of APIResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$APIResponseImplCopyWith<$Res>
    implements $APIResponseCopyWith<$Res> {
  factory _$$APIResponseImplCopyWith(
          _$APIResponseImpl value, $Res Function(_$APIResponseImpl) then) =
      __$$APIResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String? message, dynamic data});
}

/// @nodoc
class __$$APIResponseImplCopyWithImpl<$Res>
    extends _$APIResponseCopyWithImpl<$Res, _$APIResponseImpl>
    implements _$$APIResponseImplCopyWith<$Res> {
  __$$APIResponseImplCopyWithImpl(
      _$APIResponseImpl _value, $Res Function(_$APIResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of APIResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$APIResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$APIResponseImpl extends _APIResponse {
  const _$APIResponseImpl(
      {required this.success, required this.message, required this.data})
      : super._();

  factory _$APIResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$APIResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String? message;
  @override
  final dynamic data;

  @override
  String toString() {
    return 'APIResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$APIResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, success, message, const DeepCollectionEquality().hash(data));

  /// Create a copy of APIResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$APIResponseImplCopyWith<_$APIResponseImpl> get copyWith =>
      __$$APIResponseImplCopyWithImpl<_$APIResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$APIResponseImplToJson(
      this,
    );
  }
}

abstract class _APIResponse extends APIResponse {
  const factory _APIResponse(
      {required final bool success,
      required final String? message,
      required final dynamic data}) = _$APIResponseImpl;
  const _APIResponse._() : super._();

  factory _APIResponse.fromJson(Map<String, dynamic> json) =
      _$APIResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String? get message;
  @override
  dynamic get data;

  /// Create a copy of APIResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$APIResponseImplCopyWith<_$APIResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
