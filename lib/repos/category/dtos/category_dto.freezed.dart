// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryDto {

@UuidSerializer() Uuid get id; String get name;@CategoryTypeSerializer() CategoryType get categoryType; String get iconName; String get iconColor;@UuidSerializer() Uuid? get parentId;@SyncStatusSerializer() SyncStatus? get syncStatus;@DateTimeSerializer() DateTime? get createdAt;@DateTimeSerializer() DateTime? get updatedAt;
/// Create a copy of CategoryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryDtoCopyWith<CategoryDto> get copyWith => _$CategoryDtoCopyWithImpl<CategoryDto>(this as CategoryDto, _$identity);

  /// Serializes this CategoryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.categoryType, categoryType) || other.categoryType == categoryType)&&(identical(other.iconName, iconName) || other.iconName == iconName)&&(identical(other.iconColor, iconColor) || other.iconColor == iconColor)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,categoryType,iconName,iconColor,parentId,syncStatus,createdAt,updatedAt);

@override
String toString() {
  return 'CategoryDto(id: $id, name: $name, categoryType: $categoryType, iconName: $iconName, iconColor: $iconColor, parentId: $parentId, syncStatus: $syncStatus, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CategoryDtoCopyWith<$Res>  {
  factory $CategoryDtoCopyWith(CategoryDto value, $Res Function(CategoryDto) _then) = _$CategoryDtoCopyWithImpl;
@useResult
$Res call({
@UuidSerializer() Uuid id, String name,@CategoryTypeSerializer() CategoryType categoryType, String iconName, String iconColor,@UuidSerializer() Uuid? parentId,@SyncStatusSerializer() SyncStatus? syncStatus,@DateTimeSerializer() DateTime? createdAt,@DateTimeSerializer() DateTime? updatedAt
});




}
/// @nodoc
class _$CategoryDtoCopyWithImpl<$Res>
    implements $CategoryDtoCopyWith<$Res> {
  _$CategoryDtoCopyWithImpl(this._self, this._then);

  final CategoryDto _self;
  final $Res Function(CategoryDto) _then;

/// Create a copy of CategoryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? categoryType = null,Object? iconName = null,Object? iconColor = null,Object? parentId = freezed,Object? syncStatus = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Uuid,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,categoryType: null == categoryType ? _self.categoryType : categoryType // ignore: cast_nullable_to_non_nullable
as CategoryType,iconName: null == iconName ? _self.iconName : iconName // ignore: cast_nullable_to_non_nullable
as String,iconColor: null == iconColor ? _self.iconColor : iconColor // ignore: cast_nullable_to_non_nullable
as String,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as Uuid?,syncStatus: freezed == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as SyncStatus?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryDto].
extension CategoryDtoPatterns on CategoryDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryDto value)  $default,){
final _that = this;
switch (_that) {
case _CategoryDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryDto value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@UuidSerializer()  Uuid id,  String name, @CategoryTypeSerializer()  CategoryType categoryType,  String iconName,  String iconColor, @UuidSerializer()  Uuid? parentId, @SyncStatusSerializer()  SyncStatus? syncStatus, @DateTimeSerializer()  DateTime? createdAt, @DateTimeSerializer()  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryDto() when $default != null:
return $default(_that.id,_that.name,_that.categoryType,_that.iconName,_that.iconColor,_that.parentId,_that.syncStatus,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@UuidSerializer()  Uuid id,  String name, @CategoryTypeSerializer()  CategoryType categoryType,  String iconName,  String iconColor, @UuidSerializer()  Uuid? parentId, @SyncStatusSerializer()  SyncStatus? syncStatus, @DateTimeSerializer()  DateTime? createdAt, @DateTimeSerializer()  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _CategoryDto():
return $default(_that.id,_that.name,_that.categoryType,_that.iconName,_that.iconColor,_that.parentId,_that.syncStatus,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@UuidSerializer()  Uuid id,  String name, @CategoryTypeSerializer()  CategoryType categoryType,  String iconName,  String iconColor, @UuidSerializer()  Uuid? parentId, @SyncStatusSerializer()  SyncStatus? syncStatus, @DateTimeSerializer()  DateTime? createdAt, @DateTimeSerializer()  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CategoryDto() when $default != null:
return $default(_that.id,_that.name,_that.categoryType,_that.iconName,_that.iconColor,_that.parentId,_that.syncStatus,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _CategoryDto extends CategoryDto {
  const _CategoryDto({@UuidSerializer() required this.id, required this.name, @CategoryTypeSerializer() required this.categoryType, required this.iconName, required this.iconColor, @UuidSerializer() required this.parentId, @SyncStatusSerializer() required this.syncStatus, @DateTimeSerializer() required this.createdAt, @DateTimeSerializer() required this.updatedAt}): super._();
  factory _CategoryDto.fromJson(Map<String, dynamic> json) => _$CategoryDtoFromJson(json);

@override@UuidSerializer() final  Uuid id;
@override final  String name;
@override@CategoryTypeSerializer() final  CategoryType categoryType;
@override final  String iconName;
@override final  String iconColor;
@override@UuidSerializer() final  Uuid? parentId;
@override@SyncStatusSerializer() final  SyncStatus? syncStatus;
@override@DateTimeSerializer() final  DateTime? createdAt;
@override@DateTimeSerializer() final  DateTime? updatedAt;

/// Create a copy of CategoryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryDtoCopyWith<_CategoryDto> get copyWith => __$CategoryDtoCopyWithImpl<_CategoryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.categoryType, categoryType) || other.categoryType == categoryType)&&(identical(other.iconName, iconName) || other.iconName == iconName)&&(identical(other.iconColor, iconColor) || other.iconColor == iconColor)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,categoryType,iconName,iconColor,parentId,syncStatus,createdAt,updatedAt);

@override
String toString() {
  return 'CategoryDto(id: $id, name: $name, categoryType: $categoryType, iconName: $iconName, iconColor: $iconColor, parentId: $parentId, syncStatus: $syncStatus, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CategoryDtoCopyWith<$Res> implements $CategoryDtoCopyWith<$Res> {
  factory _$CategoryDtoCopyWith(_CategoryDto value, $Res Function(_CategoryDto) _then) = __$CategoryDtoCopyWithImpl;
@override @useResult
$Res call({
@UuidSerializer() Uuid id, String name,@CategoryTypeSerializer() CategoryType categoryType, String iconName, String iconColor,@UuidSerializer() Uuid? parentId,@SyncStatusSerializer() SyncStatus? syncStatus,@DateTimeSerializer() DateTime? createdAt,@DateTimeSerializer() DateTime? updatedAt
});




}
/// @nodoc
class __$CategoryDtoCopyWithImpl<$Res>
    implements _$CategoryDtoCopyWith<$Res> {
  __$CategoryDtoCopyWithImpl(this._self, this._then);

  final _CategoryDto _self;
  final $Res Function(_CategoryDto) _then;

/// Create a copy of CategoryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? categoryType = null,Object? iconName = null,Object? iconColor = null,Object? parentId = freezed,Object? syncStatus = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_CategoryDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Uuid,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,categoryType: null == categoryType ? _self.categoryType : categoryType // ignore: cast_nullable_to_non_nullable
as CategoryType,iconName: null == iconName ? _self.iconName : iconName // ignore: cast_nullable_to_non_nullable
as String,iconColor: null == iconColor ? _self.iconColor : iconColor // ignore: cast_nullable_to_non_nullable
as String,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as Uuid?,syncStatus: freezed == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as SyncStatus?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
