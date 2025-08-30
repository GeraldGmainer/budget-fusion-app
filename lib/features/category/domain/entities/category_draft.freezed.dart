// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_draft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoryDraft {

 Uuid? get id; String? get name; CategoryType get categoryType; String get iconName; String get iconColor; Category? get parent; List<Category> get subcategories; Category? get editedCategory;
/// Create a copy of CategoryDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryDraftCopyWith<CategoryDraft> get copyWith => _$CategoryDraftCopyWithImpl<CategoryDraft>(this as CategoryDraft, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryDraft&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.categoryType, categoryType) || other.categoryType == categoryType)&&(identical(other.iconName, iconName) || other.iconName == iconName)&&(identical(other.iconColor, iconColor) || other.iconColor == iconColor)&&(identical(other.parent, parent) || other.parent == parent)&&const DeepCollectionEquality().equals(other.subcategories, subcategories)&&(identical(other.editedCategory, editedCategory) || other.editedCategory == editedCategory));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,categoryType,iconName,iconColor,parent,const DeepCollectionEquality().hash(subcategories),editedCategory);

@override
String toString() {
  return 'CategoryDraft(id: $id, name: $name, categoryType: $categoryType, iconName: $iconName, iconColor: $iconColor, parent: $parent, subcategories: $subcategories, editedCategory: $editedCategory)';
}


}

/// @nodoc
abstract mixin class $CategoryDraftCopyWith<$Res>  {
  factory $CategoryDraftCopyWith(CategoryDraft value, $Res Function(CategoryDraft) _then) = _$CategoryDraftCopyWithImpl;
@useResult
$Res call({
 Uuid? id, String? name, CategoryType categoryType, String iconName, String iconColor, Category? parent, List<Category> subcategories, Category? editedCategory
});


$CategoryCopyWith<$Res>? get parent;$CategoryCopyWith<$Res>? get editedCategory;

}
/// @nodoc
class _$CategoryDraftCopyWithImpl<$Res>
    implements $CategoryDraftCopyWith<$Res> {
  _$CategoryDraftCopyWithImpl(this._self, this._then);

  final CategoryDraft _self;
  final $Res Function(CategoryDraft) _then;

/// Create a copy of CategoryDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? categoryType = null,Object? iconName = null,Object? iconColor = null,Object? parent = freezed,Object? subcategories = null,Object? editedCategory = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Uuid?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,categoryType: null == categoryType ? _self.categoryType : categoryType // ignore: cast_nullable_to_non_nullable
as CategoryType,iconName: null == iconName ? _self.iconName : iconName // ignore: cast_nullable_to_non_nullable
as String,iconColor: null == iconColor ? _self.iconColor : iconColor // ignore: cast_nullable_to_non_nullable
as String,parent: freezed == parent ? _self.parent : parent // ignore: cast_nullable_to_non_nullable
as Category?,subcategories: null == subcategories ? _self.subcategories : subcategories // ignore: cast_nullable_to_non_nullable
as List<Category>,editedCategory: freezed == editedCategory ? _self.editedCategory : editedCategory // ignore: cast_nullable_to_non_nullable
as Category?,
  ));
}
/// Create a copy of CategoryDraft
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
}/// Create a copy of CategoryDraft
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryCopyWith<$Res>? get editedCategory {
    if (_self.editedCategory == null) {
    return null;
  }

  return $CategoryCopyWith<$Res>(_self.editedCategory!, (value) {
    return _then(_self.copyWith(editedCategory: value));
  });
}
}


/// Adds pattern-matching-related methods to [CategoryDraft].
extension CategoryDraftPatterns on CategoryDraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryDraft() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryDraft value)  $default,){
final _that = this;
switch (_that) {
case _CategoryDraft():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryDraft value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryDraft() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Uuid? id,  String? name,  CategoryType categoryType,  String iconName,  String iconColor,  Category? parent,  List<Category> subcategories,  Category? editedCategory)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryDraft() when $default != null:
return $default(_that.id,_that.name,_that.categoryType,_that.iconName,_that.iconColor,_that.parent,_that.subcategories,_that.editedCategory);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Uuid? id,  String? name,  CategoryType categoryType,  String iconName,  String iconColor,  Category? parent,  List<Category> subcategories,  Category? editedCategory)  $default,) {final _that = this;
switch (_that) {
case _CategoryDraft():
return $default(_that.id,_that.name,_that.categoryType,_that.iconName,_that.iconColor,_that.parent,_that.subcategories,_that.editedCategory);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Uuid? id,  String? name,  CategoryType categoryType,  String iconName,  String iconColor,  Category? parent,  List<Category> subcategories,  Category? editedCategory)?  $default,) {final _that = this;
switch (_that) {
case _CategoryDraft() when $default != null:
return $default(_that.id,_that.name,_that.categoryType,_that.iconName,_that.iconColor,_that.parent,_that.subcategories,_that.editedCategory);case _:
  return null;

}
}

}

/// @nodoc


class _CategoryDraft extends CategoryDraft {
   _CategoryDraft({this.id, this.name, this.categoryType = CategoryType.outcome, this.iconName = "book_open_outline", this.iconColor = "9E9E9E", this.parent, final  List<Category> subcategories = const [], required this.editedCategory}): _subcategories = subcategories,super._();
  

@override final  Uuid? id;
@override final  String? name;
@override@JsonKey() final  CategoryType categoryType;
@override@JsonKey() final  String iconName;
@override@JsonKey() final  String iconColor;
@override final  Category? parent;
 final  List<Category> _subcategories;
@override@JsonKey() List<Category> get subcategories {
  if (_subcategories is EqualUnmodifiableListView) return _subcategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subcategories);
}

@override final  Category? editedCategory;

/// Create a copy of CategoryDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryDraftCopyWith<_CategoryDraft> get copyWith => __$CategoryDraftCopyWithImpl<_CategoryDraft>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryDraft&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.categoryType, categoryType) || other.categoryType == categoryType)&&(identical(other.iconName, iconName) || other.iconName == iconName)&&(identical(other.iconColor, iconColor) || other.iconColor == iconColor)&&(identical(other.parent, parent) || other.parent == parent)&&const DeepCollectionEquality().equals(other._subcategories, _subcategories)&&(identical(other.editedCategory, editedCategory) || other.editedCategory == editedCategory));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,categoryType,iconName,iconColor,parent,const DeepCollectionEquality().hash(_subcategories),editedCategory);

@override
String toString() {
  return 'CategoryDraft(id: $id, name: $name, categoryType: $categoryType, iconName: $iconName, iconColor: $iconColor, parent: $parent, subcategories: $subcategories, editedCategory: $editedCategory)';
}


}

/// @nodoc
abstract mixin class _$CategoryDraftCopyWith<$Res> implements $CategoryDraftCopyWith<$Res> {
  factory _$CategoryDraftCopyWith(_CategoryDraft value, $Res Function(_CategoryDraft) _then) = __$CategoryDraftCopyWithImpl;
@override @useResult
$Res call({
 Uuid? id, String? name, CategoryType categoryType, String iconName, String iconColor, Category? parent, List<Category> subcategories, Category? editedCategory
});


@override $CategoryCopyWith<$Res>? get parent;@override $CategoryCopyWith<$Res>? get editedCategory;

}
/// @nodoc
class __$CategoryDraftCopyWithImpl<$Res>
    implements _$CategoryDraftCopyWith<$Res> {
  __$CategoryDraftCopyWithImpl(this._self, this._then);

  final _CategoryDraft _self;
  final $Res Function(_CategoryDraft) _then;

/// Create a copy of CategoryDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? categoryType = null,Object? iconName = null,Object? iconColor = null,Object? parent = freezed,Object? subcategories = null,Object? editedCategory = freezed,}) {
  return _then(_CategoryDraft(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as Uuid?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,categoryType: null == categoryType ? _self.categoryType : categoryType // ignore: cast_nullable_to_non_nullable
as CategoryType,iconName: null == iconName ? _self.iconName : iconName // ignore: cast_nullable_to_non_nullable
as String,iconColor: null == iconColor ? _self.iconColor : iconColor // ignore: cast_nullable_to_non_nullable
as String,parent: freezed == parent ? _self.parent : parent // ignore: cast_nullable_to_non_nullable
as Category?,subcategories: null == subcategories ? _self._subcategories : subcategories // ignore: cast_nullable_to_non_nullable
as List<Category>,editedCategory: freezed == editedCategory ? _self.editedCategory : editedCategory // ignore: cast_nullable_to_non_nullable
as Category?,
  ));
}

/// Create a copy of CategoryDraft
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
}/// Create a copy of CategoryDraft
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryCopyWith<$Res>? get editedCategory {
    if (_self.editedCategory == null) {
    return null;
  }

  return $CategoryCopyWith<$Res>(_self.editedCategory!, (value) {
    return _then(_self.copyWith(editedCategory: value));
  });
}
}

// dart format on
