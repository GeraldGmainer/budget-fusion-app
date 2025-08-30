// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Category {

 Uuid get id; String get name; CategoryType get categoryType; String get iconName; String get iconColor; Category? get parent; List<Category> get subcategories; SyncStatus? get syncStatus; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryCopyWith<Category> get copyWith => _$CategoryCopyWithImpl<Category>(this as Category, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Category&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.categoryType, categoryType) || other.categoryType == categoryType)&&(identical(other.iconName, iconName) || other.iconName == iconName)&&(identical(other.iconColor, iconColor) || other.iconColor == iconColor)&&(identical(other.parent, parent) || other.parent == parent)&&const DeepCollectionEquality().equals(other.subcategories, subcategories)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,categoryType,iconName,iconColor,parent,const DeepCollectionEquality().hash(subcategories),syncStatus,createdAt,updatedAt);

@override
String toString() {
  return 'Category(id: $id, name: $name, categoryType: $categoryType, iconName: $iconName, iconColor: $iconColor, parent: $parent, subcategories: $subcategories, syncStatus: $syncStatus, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CategoryCopyWith<$Res>  {
  factory $CategoryCopyWith(Category value, $Res Function(Category) _then) = _$CategoryCopyWithImpl;
@useResult
$Res call({
 Uuid id, String name, CategoryType categoryType, String iconName, String iconColor, Category? parent, List<Category> subcategories, SyncStatus? syncStatus, DateTime? createdAt, DateTime? updatedAt
});


$CategoryCopyWith<$Res>? get parent;

}
/// @nodoc
class _$CategoryCopyWithImpl<$Res>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._self, this._then);

  final Category _self;
  final $Res Function(Category) _then;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? categoryType = null,Object? iconName = null,Object? iconColor = null,Object? parent = freezed,Object? subcategories = null,Object? syncStatus = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Uuid,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,categoryType: null == categoryType ? _self.categoryType : categoryType // ignore: cast_nullable_to_non_nullable
as CategoryType,iconName: null == iconName ? _self.iconName : iconName // ignore: cast_nullable_to_non_nullable
as String,iconColor: null == iconColor ? _self.iconColor : iconColor // ignore: cast_nullable_to_non_nullable
as String,parent: freezed == parent ? _self.parent : parent // ignore: cast_nullable_to_non_nullable
as Category?,subcategories: null == subcategories ? _self.subcategories : subcategories // ignore: cast_nullable_to_non_nullable
as List<Category>,syncStatus: freezed == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as SyncStatus?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryCopyWith<$Res>? get parent {
    if (_self.parent == null) {
    return null;
  }

  return $CategoryCopyWith<$Res>(_self.parent!, (value) {
    return _then(_self.copyWith(parent: value));
  });
}
}


/// Adds pattern-matching-related methods to [Category].
extension CategoryPatterns on Category {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Category value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Category() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Category value)  $default,){
final _that = this;
switch (_that) {
case _Category():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Category value)?  $default,){
final _that = this;
switch (_that) {
case _Category() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Uuid id,  String name,  CategoryType categoryType,  String iconName,  String iconColor,  Category? parent,  List<Category> subcategories,  SyncStatus? syncStatus,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Category() when $default != null:
return $default(_that.id,_that.name,_that.categoryType,_that.iconName,_that.iconColor,_that.parent,_that.subcategories,_that.syncStatus,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Uuid id,  String name,  CategoryType categoryType,  String iconName,  String iconColor,  Category? parent,  List<Category> subcategories,  SyncStatus? syncStatus,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Category():
return $default(_that.id,_that.name,_that.categoryType,_that.iconName,_that.iconColor,_that.parent,_that.subcategories,_that.syncStatus,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Uuid id,  String name,  CategoryType categoryType,  String iconName,  String iconColor,  Category? parent,  List<Category> subcategories,  SyncStatus? syncStatus,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Category() when $default != null:
return $default(_that.id,_that.name,_that.categoryType,_that.iconName,_that.iconColor,_that.parent,_that.subcategories,_that.syncStatus,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _Category extends Category {
  const _Category({required this.id, required this.name, required this.categoryType, required this.iconName, required this.iconColor, this.parent, final  List<Category> subcategories = const [], this.syncStatus, this.createdAt, this.updatedAt}): _subcategories = subcategories,super._();
  

@override final  Uuid id;
@override final  String name;
@override final  CategoryType categoryType;
@override final  String iconName;
@override final  String iconColor;
@override final  Category? parent;
 final  List<Category> _subcategories;
@override@JsonKey() List<Category> get subcategories {
  if (_subcategories is EqualUnmodifiableListView) return _subcategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subcategories);
}

@override final  SyncStatus? syncStatus;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryCopyWith<_Category> get copyWith => __$CategoryCopyWithImpl<_Category>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Category&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.categoryType, categoryType) || other.categoryType == categoryType)&&(identical(other.iconName, iconName) || other.iconName == iconName)&&(identical(other.iconColor, iconColor) || other.iconColor == iconColor)&&(identical(other.parent, parent) || other.parent == parent)&&const DeepCollectionEquality().equals(other._subcategories, _subcategories)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,categoryType,iconName,iconColor,parent,const DeepCollectionEquality().hash(_subcategories),syncStatus,createdAt,updatedAt);

@override
String toString() {
  return 'Category(id: $id, name: $name, categoryType: $categoryType, iconName: $iconName, iconColor: $iconColor, parent: $parent, subcategories: $subcategories, syncStatus: $syncStatus, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CategoryCopyWith<$Res> implements $CategoryCopyWith<$Res> {
  factory _$CategoryCopyWith(_Category value, $Res Function(_Category) _then) = __$CategoryCopyWithImpl;
@override @useResult
$Res call({
 Uuid id, String name, CategoryType categoryType, String iconName, String iconColor, Category? parent, List<Category> subcategories, SyncStatus? syncStatus, DateTime? createdAt, DateTime? updatedAt
});


@override $CategoryCopyWith<$Res>? get parent;

}
/// @nodoc
class __$CategoryCopyWithImpl<$Res>
    implements _$CategoryCopyWith<$Res> {
  __$CategoryCopyWithImpl(this._self, this._then);

  final _Category _self;
  final $Res Function(_Category) _then;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? categoryType = null,Object? iconName = null,Object? iconColor = null,Object? parent = freezed,Object? subcategories = null,Object? syncStatus = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Category(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Uuid,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,categoryType: null == categoryType ? _self.categoryType : categoryType // ignore: cast_nullable_to_non_nullable
as CategoryType,iconName: null == iconName ? _self.iconName : iconName // ignore: cast_nullable_to_non_nullable
as String,iconColor: null == iconColor ? _self.iconColor : iconColor // ignore: cast_nullable_to_non_nullable
as String,parent: freezed == parent ? _self.parent : parent // ignore: cast_nullable_to_non_nullable
as Category?,subcategories: null == subcategories ? _self._subcategories : subcategories // ignore: cast_nullable_to_non_nullable
as List<Category>,syncStatus: freezed == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as SyncStatus?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryCopyWith<$Res>? get parent {
    if (_self.parent == null) {
    return null;
  }

  return $CategoryCopyWith<$Res>(_self.parent!, (value) {
    return _then(_self.copyWith(parent: value));
  });
}
}

// dart format on
