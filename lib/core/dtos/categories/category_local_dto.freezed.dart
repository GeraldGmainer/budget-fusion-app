// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_local_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CategoryLocalDto _$CategoryLocalDtoFromJson(Map<String, dynamic> json) {
  return _CategoryLocalDto.fromJson(json);
}

/// @nodoc
mixin _$CategoryLocalDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get categoryType => throw _privateConstructorUsedError;
  String get iconName => throw _privateConstructorUsedError;
  String get iconColor => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this CategoryLocalDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryLocalDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryLocalDtoCopyWith<CategoryLocalDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryLocalDtoCopyWith<$Res> {
  factory $CategoryLocalDtoCopyWith(
          CategoryLocalDto value, $Res Function(CategoryLocalDto) then) =
      _$CategoryLocalDtoCopyWithImpl<$Res, CategoryLocalDto>;
  @useResult
  $Res call(
      {String id,
      String name,
      String categoryType,
      String iconName,
      String iconColor,
      DateTime updatedAt});
}

/// @nodoc
class _$CategoryLocalDtoCopyWithImpl<$Res, $Val extends CategoryLocalDto>
    implements $CategoryLocalDtoCopyWith<$Res> {
  _$CategoryLocalDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryLocalDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? categoryType = null,
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
      categoryType: null == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
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
abstract class _$$CategoryLocalDtoImplCopyWith<$Res>
    implements $CategoryLocalDtoCopyWith<$Res> {
  factory _$$CategoryLocalDtoImplCopyWith(_$CategoryLocalDtoImpl value,
          $Res Function(_$CategoryLocalDtoImpl) then) =
      __$$CategoryLocalDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String categoryType,
      String iconName,
      String iconColor,
      DateTime updatedAt});
}

/// @nodoc
class __$$CategoryLocalDtoImplCopyWithImpl<$Res>
    extends _$CategoryLocalDtoCopyWithImpl<$Res, _$CategoryLocalDtoImpl>
    implements _$$CategoryLocalDtoImplCopyWith<$Res> {
  __$$CategoryLocalDtoImplCopyWithImpl(_$CategoryLocalDtoImpl _value,
      $Res Function(_$CategoryLocalDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryLocalDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? categoryType = null,
    Object? iconName = null,
    Object? iconColor = null,
    Object? updatedAt = null,
  }) {
    return _then(_$CategoryLocalDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      categoryType: null == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
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
@JsonSerializable()
class _$CategoryLocalDtoImpl extends _CategoryLocalDto {
  const _$CategoryLocalDtoImpl(
      {required this.id,
      required this.name,
      required this.categoryType,
      required this.iconName,
      required this.iconColor,
      required this.updatedAt})
      : super._();

  factory _$CategoryLocalDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryLocalDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String categoryType;
  @override
  final String iconName;
  @override
  final String iconColor;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'CategoryLocalDto(id: $id, name: $name, categoryType: $categoryType, iconName: $iconName, iconColor: $iconColor, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryLocalDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName) &&
            (identical(other.iconColor, iconColor) ||
                other.iconColor == iconColor) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, categoryType, iconName, iconColor, updatedAt);

  /// Create a copy of CategoryLocalDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryLocalDtoImplCopyWith<_$CategoryLocalDtoImpl> get copyWith =>
      __$$CategoryLocalDtoImplCopyWithImpl<_$CategoryLocalDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryLocalDtoImplToJson(
      this,
    );
  }
}

abstract class _CategoryLocalDto extends CategoryLocalDto {
  const factory _CategoryLocalDto(
      {required final String id,
      required final String name,
      required final String categoryType,
      required final String iconName,
      required final String iconColor,
      required final DateTime updatedAt}) = _$CategoryLocalDtoImpl;
  const _CategoryLocalDto._() : super._();

  factory _CategoryLocalDto.fromJson(Map<String, dynamic> json) =
      _$CategoryLocalDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get categoryType;
  @override
  String get iconName;
  @override
  String get iconColor;
  @override
  DateTime get updatedAt;

  /// Create a copy of CategoryLocalDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryLocalDtoImplCopyWith<_$CategoryLocalDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
