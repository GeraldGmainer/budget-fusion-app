// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CategoryDto _$CategoryDtoFromJson(Map<String, dynamic> json) {
  return _CategoryDto.fromJson(json);
}

/// @nodoc
mixin _$CategoryDto {
  @UuidSerializer()
  Uuid get id => throw _privateConstructorUsedError;
  @SyncMetaSerializer()
  SyncMeta get syncMeta => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_type')
  @CategoryTypeSerializer()
  CategoryType get categoryType => throw _privateConstructorUsedError;
  @JsonKey(name: 'icon_name')
  String get iconName => throw _privateConstructorUsedError;
  @JsonKey(name: 'icon_color')
  String get iconColor => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent_id')
  @UuidSerializer()
  Uuid? get parentId => throw _privateConstructorUsedError;

  /// Serializes this CategoryDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryDtoCopyWith<CategoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryDtoCopyWith<$Res> {
  factory $CategoryDtoCopyWith(
    CategoryDto value,
    $Res Function(CategoryDto) then,
  ) = _$CategoryDtoCopyWithImpl<$Res, CategoryDto>;
  @useResult
  $Res call({
    @UuidSerializer() Uuid id,
    @SyncMetaSerializer() SyncMeta syncMeta,
    String name,
    @JsonKey(name: 'category_type')
    @CategoryTypeSerializer()
    CategoryType categoryType,
    @JsonKey(name: 'icon_name') String iconName,
    @JsonKey(name: 'icon_color') String iconColor,
    @JsonKey(name: 'parent_id') @UuidSerializer() Uuid? parentId,
  });
}

/// @nodoc
class _$CategoryDtoCopyWithImpl<$Res, $Val extends CategoryDto>
    implements $CategoryDtoCopyWith<$Res> {
  _$CategoryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? syncMeta = null,
    Object? name = null,
    Object? categoryType = null,
    Object? iconName = null,
    Object? iconColor = null,
    Object? parentId = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as Uuid,
            syncMeta:
                null == syncMeta
                    ? _value.syncMeta
                    : syncMeta // ignore: cast_nullable_to_non_nullable
                        as SyncMeta,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            categoryType:
                null == categoryType
                    ? _value.categoryType
                    : categoryType // ignore: cast_nullable_to_non_nullable
                        as CategoryType,
            iconName:
                null == iconName
                    ? _value.iconName
                    : iconName // ignore: cast_nullable_to_non_nullable
                        as String,
            iconColor:
                null == iconColor
                    ? _value.iconColor
                    : iconColor // ignore: cast_nullable_to_non_nullable
                        as String,
            parentId:
                freezed == parentId
                    ? _value.parentId
                    : parentId // ignore: cast_nullable_to_non_nullable
                        as Uuid?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CategoryDtoImplCopyWith<$Res>
    implements $CategoryDtoCopyWith<$Res> {
  factory _$$CategoryDtoImplCopyWith(
    _$CategoryDtoImpl value,
    $Res Function(_$CategoryDtoImpl) then,
  ) = __$$CategoryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @UuidSerializer() Uuid id,
    @SyncMetaSerializer() SyncMeta syncMeta,
    String name,
    @JsonKey(name: 'category_type')
    @CategoryTypeSerializer()
    CategoryType categoryType,
    @JsonKey(name: 'icon_name') String iconName,
    @JsonKey(name: 'icon_color') String iconColor,
    @JsonKey(name: 'parent_id') @UuidSerializer() Uuid? parentId,
  });
}

/// @nodoc
class __$$CategoryDtoImplCopyWithImpl<$Res>
    extends _$CategoryDtoCopyWithImpl<$Res, _$CategoryDtoImpl>
    implements _$$CategoryDtoImplCopyWith<$Res> {
  __$$CategoryDtoImplCopyWithImpl(
    _$CategoryDtoImpl _value,
    $Res Function(_$CategoryDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? syncMeta = null,
    Object? name = null,
    Object? categoryType = null,
    Object? iconName = null,
    Object? iconColor = null,
    Object? parentId = freezed,
  }) {
    return _then(
      _$CategoryDtoImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as Uuid,
        syncMeta:
            null == syncMeta
                ? _value.syncMeta
                : syncMeta // ignore: cast_nullable_to_non_nullable
                    as SyncMeta,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        categoryType:
            null == categoryType
                ? _value.categoryType
                : categoryType // ignore: cast_nullable_to_non_nullable
                    as CategoryType,
        iconName:
            null == iconName
                ? _value.iconName
                : iconName // ignore: cast_nullable_to_non_nullable
                    as String,
        iconColor:
            null == iconColor
                ? _value.iconColor
                : iconColor // ignore: cast_nullable_to_non_nullable
                    as String,
        parentId:
            freezed == parentId
                ? _value.parentId
                : parentId // ignore: cast_nullable_to_non_nullable
                    as Uuid?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryDtoImpl extends _CategoryDto {
  const _$CategoryDtoImpl({
    @UuidSerializer() required this.id,
    @SyncMetaSerializer() required this.syncMeta,
    required this.name,
    @JsonKey(name: 'category_type')
    @CategoryTypeSerializer()
    required this.categoryType,
    @JsonKey(name: 'icon_name') required this.iconName,
    @JsonKey(name: 'icon_color') required this.iconColor,
    @JsonKey(name: 'parent_id') @UuidSerializer() required this.parentId,
  }) : super._();

  factory _$CategoryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryDtoImplFromJson(json);

  @override
  @UuidSerializer()
  final Uuid id;
  @override
  @SyncMetaSerializer()
  final SyncMeta syncMeta;
  @override
  final String name;
  @override
  @JsonKey(name: 'category_type')
  @CategoryTypeSerializer()
  final CategoryType categoryType;
  @override
  @JsonKey(name: 'icon_name')
  final String iconName;
  @override
  @JsonKey(name: 'icon_color')
  final String iconColor;
  @override
  @JsonKey(name: 'parent_id')
  @UuidSerializer()
  final Uuid? parentId;

  @override
  String toString() {
    return 'CategoryDto(id: $id, syncMeta: $syncMeta, name: $name, categoryType: $categoryType, iconName: $iconName, iconColor: $iconColor, parentId: $parentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.syncMeta, syncMeta) ||
                other.syncMeta == syncMeta) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName) &&
            (identical(other.iconColor, iconColor) ||
                other.iconColor == iconColor) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    syncMeta,
    name,
    categoryType,
    iconName,
    iconColor,
    parentId,
  );

  /// Create a copy of CategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryDtoImplCopyWith<_$CategoryDtoImpl> get copyWith =>
      __$$CategoryDtoImplCopyWithImpl<_$CategoryDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryDtoImplToJson(this);
  }
}

abstract class _CategoryDto extends CategoryDto {
  const factory _CategoryDto({
    @UuidSerializer() required final Uuid id,
    @SyncMetaSerializer() required final SyncMeta syncMeta,
    required final String name,
    @JsonKey(name: 'category_type')
    @CategoryTypeSerializer()
    required final CategoryType categoryType,
    @JsonKey(name: 'icon_name') required final String iconName,
    @JsonKey(name: 'icon_color') required final String iconColor,
    @JsonKey(name: 'parent_id') @UuidSerializer() required final Uuid? parentId,
  }) = _$CategoryDtoImpl;
  const _CategoryDto._() : super._();

  factory _CategoryDto.fromJson(Map<String, dynamic> json) =
      _$CategoryDtoImpl.fromJson;

  @override
  @UuidSerializer()
  Uuid get id;
  @override
  @SyncMetaSerializer()
  SyncMeta get syncMeta;
  @override
  String get name;
  @override
  @JsonKey(name: 'category_type')
  @CategoryTypeSerializer()
  CategoryType get categoryType;
  @override
  @JsonKey(name: 'icon_name')
  String get iconName;
  @override
  @JsonKey(name: 'icon_color')
  String get iconColor;
  @override
  @JsonKey(name: 'parent_id')
  @UuidSerializer()
  Uuid? get parentId;

  /// Create a copy of CategoryDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryDtoImplCopyWith<_$CategoryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
