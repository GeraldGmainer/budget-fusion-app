// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AccountDto _$AccountDtoFromJson(Map<String, dynamic> json) {
  return _AccountDto.fromJson(json);
}

/// @nodoc
mixin _$AccountDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'icon_name')
  String get iconName => throw _privateConstructorUsedError;
  @JsonKey(name: 'icon_color')
  String get iconColor => throw _privateConstructorUsedError;

  /// Serializes this AccountDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccountDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountDtoCopyWith<AccountDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountDtoCopyWith<$Res> {
  factory $AccountDtoCopyWith(
          AccountDto value, $Res Function(AccountDto) then) =
      _$AccountDtoCopyWithImpl<$Res, AccountDto>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'icon_name') String iconName,
      @JsonKey(name: 'icon_color') String iconColor});
}

/// @nodoc
class _$AccountDtoCopyWithImpl<$Res, $Val extends AccountDto>
    implements $AccountDtoCopyWith<$Res> {
  _$AccountDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? iconName = null,
    Object? iconColor = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountDtoImplCopyWith<$Res>
    implements $AccountDtoCopyWith<$Res> {
  factory _$$AccountDtoImplCopyWith(
          _$AccountDtoImpl value, $Res Function(_$AccountDtoImpl) then) =
      __$$AccountDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'icon_name') String iconName,
      @JsonKey(name: 'icon_color') String iconColor});
}

/// @nodoc
class __$$AccountDtoImplCopyWithImpl<$Res>
    extends _$AccountDtoCopyWithImpl<$Res, _$AccountDtoImpl>
    implements _$$AccountDtoImplCopyWith<$Res> {
  __$$AccountDtoImplCopyWithImpl(
      _$AccountDtoImpl _value, $Res Function(_$AccountDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? iconName = null,
    Object? iconColor = null,
  }) {
    return _then(_$AccountDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountDtoImpl extends _AccountDto {
  const _$AccountDtoImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'icon_name') required this.iconName,
      @JsonKey(name: 'icon_color') required this.iconColor})
      : super._();

  factory _$AccountDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'icon_name')
  final String iconName;
  @override
  @JsonKey(name: 'icon_color')
  final String iconColor;

  @override
  String toString() {
    return 'AccountDto(id: $id, name: $name, iconName: $iconName, iconColor: $iconColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName) &&
            (identical(other.iconColor, iconColor) ||
                other.iconColor == iconColor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, iconName, iconColor);

  /// Create a copy of AccountDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountDtoImplCopyWith<_$AccountDtoImpl> get copyWith =>
      __$$AccountDtoImplCopyWithImpl<_$AccountDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountDtoImplToJson(
      this,
    );
  }
}

abstract class _AccountDto extends AccountDto {
  const factory _AccountDto(
          {required final int id,
          required final String name,
          @JsonKey(name: 'icon_name') required final String iconName,
          @JsonKey(name: 'icon_color') required final String iconColor}) =
      _$AccountDtoImpl;
  const _AccountDto._() : super._();

  factory _AccountDto.fromJson(Map<String, dynamic> json) =
      _$AccountDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'icon_name')
  String get iconName;
  @override
  @JsonKey(name: 'icon_color')
  String get iconColor;

  /// Create a copy of AccountDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountDtoImplCopyWith<_$AccountDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
