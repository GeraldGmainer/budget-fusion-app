// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_local_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccountLocalDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get iconName => throw _privateConstructorUsedError;
  String get iconColor => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of AccountLocalDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountLocalDtoCopyWith<AccountLocalDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountLocalDtoCopyWith<$Res> {
  factory $AccountLocalDtoCopyWith(
          AccountLocalDto value, $Res Function(AccountLocalDto) then) =
      _$AccountLocalDtoCopyWithImpl<$Res, AccountLocalDto>;
  @useResult
  $Res call(
      {String id,
      String name,
      String iconName,
      String iconColor,
      DateTime updatedAt});
}

/// @nodoc
class _$AccountLocalDtoCopyWithImpl<$Res, $Val extends AccountLocalDto>
    implements $AccountLocalDtoCopyWith<$Res> {
  _$AccountLocalDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountLocalDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? iconName = null,
    Object? iconColor = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      iconName: null == iconName
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String,
      iconColor: null == iconColor
          ? _value.iconColor
          : iconColor // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountLocalDtoImplCopyWith<$Res>
    implements $AccountLocalDtoCopyWith<$Res> {
  factory _$$AccountLocalDtoImplCopyWith(_$AccountLocalDtoImpl value,
          $Res Function(_$AccountLocalDtoImpl) then) =
      __$$AccountLocalDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String iconName,
      String iconColor,
      DateTime updatedAt});
}

/// @nodoc
class __$$AccountLocalDtoImplCopyWithImpl<$Res>
    extends _$AccountLocalDtoCopyWithImpl<$Res, _$AccountLocalDtoImpl>
    implements _$$AccountLocalDtoImplCopyWith<$Res> {
  __$$AccountLocalDtoImplCopyWithImpl(
      _$AccountLocalDtoImpl _value, $Res Function(_$AccountLocalDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountLocalDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? iconName = null,
    Object? iconColor = null,
    Object? updatedAt = null,
  }) {
    return _then(_$AccountLocalDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      iconName: null == iconName
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String,
      iconColor: null == iconColor
          ? _value.iconColor
          : iconColor // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$AccountLocalDtoImpl extends _AccountLocalDto {
  const _$AccountLocalDtoImpl(
      {required this.id,
      required this.name,
      required this.iconName,
      required this.iconColor,
      required this.updatedAt})
      : super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final String iconName;
  @override
  final String iconColor;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'AccountLocalDto(id: $id, name: $name, iconName: $iconName, iconColor: $iconColor, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountLocalDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName) &&
            (identical(other.iconColor, iconColor) ||
                other.iconColor == iconColor) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, iconName, iconColor, updatedAt);

  /// Create a copy of AccountLocalDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountLocalDtoImplCopyWith<_$AccountLocalDtoImpl> get copyWith =>
      __$$AccountLocalDtoImplCopyWithImpl<_$AccountLocalDtoImpl>(
          this, _$identity);
}

abstract class _AccountLocalDto extends AccountLocalDto {
  const factory _AccountLocalDto(
      {required final String id,
      required final String name,
      required final String iconName,
      required final String iconColor,
      required final DateTime updatedAt}) = _$AccountLocalDtoImpl;
  const _AccountLocalDto._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  String get iconName;
  @override
  String get iconColor;
  @override
  DateTime get updatedAt;

  /// Create a copy of AccountLocalDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountLocalDtoImplCopyWith<_$AccountLocalDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
