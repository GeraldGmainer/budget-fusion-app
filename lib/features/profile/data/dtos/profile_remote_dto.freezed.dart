// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_remote_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProfileRemoteDto _$ProfileRemoteDtoFromJson(Map<String, dynamic> json) {
  return _ProfileRemoteDto.fromJson(json);
}

/// @nodoc
mixin _$ProfileRemoteDto {
  Uuid get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ProfileRemoteDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfileRemoteDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileRemoteDtoCopyWith<ProfileRemoteDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileRemoteDtoCopyWith<$Res> {
  factory $ProfileRemoteDtoCopyWith(
          ProfileRemoteDto value, $Res Function(ProfileRemoteDto) then) =
      _$ProfileRemoteDtoCopyWithImpl<$Res, ProfileRemoteDto>;
  @useResult
  $Res call(
      {Uuid id,
      @JsonKey(name: 'user_id') String userId,
      String? name,
      String email,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class _$ProfileRemoteDtoCopyWithImpl<$Res, $Val extends ProfileRemoteDto>
    implements $ProfileRemoteDtoCopyWith<$Res> {
  _$ProfileRemoteDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileRemoteDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = freezed,
    Object? email = null,
    Object? avatarUrl = freezed,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as Uuid,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileRemoteDtoImplCopyWith<$Res>
    implements $ProfileRemoteDtoCopyWith<$Res> {
  factory _$$ProfileRemoteDtoImplCopyWith(_$ProfileRemoteDtoImpl value,
          $Res Function(_$ProfileRemoteDtoImpl) then) =
      __$$ProfileRemoteDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Uuid id,
      @JsonKey(name: 'user_id') String userId,
      String? name,
      String email,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class __$$ProfileRemoteDtoImplCopyWithImpl<$Res>
    extends _$ProfileRemoteDtoCopyWithImpl<$Res, _$ProfileRemoteDtoImpl>
    implements _$$ProfileRemoteDtoImplCopyWith<$Res> {
  __$$ProfileRemoteDtoImplCopyWithImpl(_$ProfileRemoteDtoImpl _value,
      $Res Function(_$ProfileRemoteDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileRemoteDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = freezed,
    Object? email = null,
    Object? avatarUrl = freezed,
    Object? updatedAt = null,
  }) {
    return _then(_$ProfileRemoteDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as Uuid,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileRemoteDtoImpl extends _ProfileRemoteDto {
  const _$ProfileRemoteDtoImpl(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      this.name,
      required this.email,
      @JsonKey(name: 'avatar_url') this.avatarUrl,
      @JsonKey(name: 'updated_at') required this.updatedAt})
      : super._();

  factory _$ProfileRemoteDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileRemoteDtoImplFromJson(json);

  @override
  final Uuid id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  final String? name;
  @override
  final String email;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'ProfileRemoteDto(id: $id, userId: $userId, name: $name, email: $email, avatarUrl: $avatarUrl, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileRemoteDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId, name, email, avatarUrl, updatedAt);

  /// Create a copy of ProfileRemoteDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileRemoteDtoImplCopyWith<_$ProfileRemoteDtoImpl> get copyWith =>
      __$$ProfileRemoteDtoImplCopyWithImpl<_$ProfileRemoteDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileRemoteDtoImplToJson(
      this,
    );
  }
}

abstract class _ProfileRemoteDto extends ProfileRemoteDto {
  const factory _ProfileRemoteDto(
          {required final Uuid id,
          @JsonKey(name: 'user_id') required final String userId,
          final String? name,
          required final String email,
          @JsonKey(name: 'avatar_url') final String? avatarUrl,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt}) =
      _$ProfileRemoteDtoImpl;
  const _ProfileRemoteDto._() : super._();

  factory _ProfileRemoteDto.fromJson(Map<String, dynamic> json) =
      _$ProfileRemoteDtoImpl.fromJson;

  @override
  Uuid get id;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  String? get name;
  @override
  String get email;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of ProfileRemoteDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileRemoteDtoImplCopyWith<_$ProfileRemoteDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
