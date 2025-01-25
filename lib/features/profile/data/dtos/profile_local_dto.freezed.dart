// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_local_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileLocalDto {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;

  /// Create a copy of ProfileLocalDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileLocalDtoCopyWith<ProfileLocalDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileLocalDtoCopyWith<$Res> {
  factory $ProfileLocalDtoCopyWith(
          ProfileLocalDto value, $Res Function(ProfileLocalDto) then) =
      _$ProfileLocalDtoCopyWithImpl<$Res, ProfileLocalDto>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String? name,
      String email,
      String? avatarUrl});
}

/// @nodoc
class _$ProfileLocalDtoCopyWithImpl<$Res, $Val extends ProfileLocalDto>
    implements $ProfileLocalDtoCopyWith<$Res> {
  _$ProfileLocalDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileLocalDto
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
              as String,
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
abstract class _$$ProfileLocalDtoImplCopyWith<$Res>
    implements $ProfileLocalDtoCopyWith<$Res> {
  factory _$$ProfileLocalDtoImplCopyWith(_$ProfileLocalDtoImpl value,
          $Res Function(_$ProfileLocalDtoImpl) then) =
      __$$ProfileLocalDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String? name,
      String email,
      String? avatarUrl});
}

/// @nodoc
class __$$ProfileLocalDtoImplCopyWithImpl<$Res>
    extends _$ProfileLocalDtoCopyWithImpl<$Res, _$ProfileLocalDtoImpl>
    implements _$$ProfileLocalDtoImplCopyWith<$Res> {
  __$$ProfileLocalDtoImplCopyWithImpl(
      _$ProfileLocalDtoImpl _value, $Res Function(_$ProfileLocalDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileLocalDto
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
    return _then(_$ProfileLocalDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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

class _$ProfileLocalDtoImpl extends _ProfileLocalDto {
  const _$ProfileLocalDtoImpl(
      {required this.id,
      required this.userId,
      this.name,
      required this.email,
      this.avatarUrl})
      : super._();

  @override
  final String id;
  @override
  final String userId;
  @override
  final String? name;
  @override
  final String email;
  @override
  final String? avatarUrl;

  @override
  String toString() {
    return 'ProfileLocalDto(id: $id, userId: $userId, name: $name, email: $email, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileLocalDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId, name, email, avatarUrl);

  /// Create a copy of ProfileLocalDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileLocalDtoImplCopyWith<_$ProfileLocalDtoImpl> get copyWith =>
      __$$ProfileLocalDtoImplCopyWithImpl<_$ProfileLocalDtoImpl>(
          this, _$identity);
}

abstract class _ProfileLocalDto extends ProfileLocalDto {
  const factory _ProfileLocalDto(
      {required final String id,
      required final String userId,
      final String? name,
      required final String email,
      final String? avatarUrl}) = _$ProfileLocalDtoImpl;
  const _ProfileLocalDto._() : super._();

  @override
  String get id;
  @override
  String get userId;
  @override
  String? get name;
  @override
  String get email;
  @override
  String? get avatarUrl;

  /// Create a copy of ProfileLocalDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileLocalDtoImplCopyWith<_$ProfileLocalDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
