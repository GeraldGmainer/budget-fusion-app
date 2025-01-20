// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProfileDto _$ProfileDtoFromJson(Map<String, dynamic> json) {
  return _ProfileDto.fromJson(json);
}

/// @nodoc
mixin _$ProfileDto {
  Uuid get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;

  /// Serializes this ProfileDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfileDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileDtoCopyWith<ProfileDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileDtoCopyWith<$Res> {
  factory $ProfileDtoCopyWith(
          ProfileDto value, $Res Function(ProfileDto) then) =
      _$ProfileDtoCopyWithImpl<$Res, ProfileDto>;
  @useResult
  $Res call(
      {Uuid id,
      @JsonKey(name: 'user_id') String userId,
      String? name,
      String email,
      @JsonKey(name: 'avatar_url') String? avatarUrl});
}

/// @nodoc
class _$ProfileDtoCopyWithImpl<$Res, $Val extends ProfileDto>
    implements $ProfileDtoCopyWith<$Res> {
  _$ProfileDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = freezed,
    Object? email = null,
    Object? avatarUrl = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileDtoImplCopyWith<$Res>
    implements $ProfileDtoCopyWith<$Res> {
  factory _$$ProfileDtoImplCopyWith(
          _$ProfileDtoImpl value, $Res Function(_$ProfileDtoImpl) then) =
      __$$ProfileDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Uuid id,
      @JsonKey(name: 'user_id') String userId,
      String? name,
      String email,
      @JsonKey(name: 'avatar_url') String? avatarUrl});
}

/// @nodoc
class __$$ProfileDtoImplCopyWithImpl<$Res>
    extends _$ProfileDtoCopyWithImpl<$Res, _$ProfileDtoImpl>
    implements _$$ProfileDtoImplCopyWith<$Res> {
  __$$ProfileDtoImplCopyWithImpl(
      _$ProfileDtoImpl _value, $Res Function(_$ProfileDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = freezed,
    Object? email = null,
    Object? avatarUrl = freezed,
  }) {
    return _then(_$ProfileDtoImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileDtoImpl extends _ProfileDto {
  const _$ProfileDtoImpl(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      this.name,
      required this.email,
      @JsonKey(name: 'avatar_url') this.avatarUrl})
      : super._();

  factory _$ProfileDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileDtoImplFromJson(json);

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
  String toString() {
    return 'ProfileDto(id: $id, userId: $userId, name: $name, email: $email, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId, name, email, avatarUrl);

  /// Create a copy of ProfileDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileDtoImplCopyWith<_$ProfileDtoImpl> get copyWith =>
      __$$ProfileDtoImplCopyWithImpl<_$ProfileDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileDtoImplToJson(
      this,
    );
  }
}

abstract class _ProfileDto extends ProfileDto {
  const factory _ProfileDto(
      {required final Uuid id,
      @JsonKey(name: 'user_id') required final String userId,
      final String? name,
      required final String email,
      @JsonKey(name: 'avatar_url') final String? avatarUrl}) = _$ProfileDtoImpl;
  const _ProfileDto._() : super._();

  factory _ProfileDto.fromJson(Map<String, dynamic> json) =
      _$ProfileDtoImpl.fromJson;

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

  /// Create a copy of ProfileDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileDtoImplCopyWith<_$ProfileDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
