// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_view_summary_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoryViewSummaryData {

 CategoryType get categoryType; String get categoryName; String? get parentCategoryName; String get iconName; String get iconColor; int get percentage; Money get money; bool get isSynced; List<CategoryViewSummaryData> get subSummaries;
/// Create a copy of CategoryViewSummaryData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryViewSummaryDataCopyWith<CategoryViewSummaryData> get copyWith => _$CategoryViewSummaryDataCopyWithImpl<CategoryViewSummaryData>(this as CategoryViewSummaryData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryViewSummaryData&&(identical(other.categoryType, categoryType) || other.categoryType == categoryType)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.parentCategoryName, parentCategoryName) || other.parentCategoryName == parentCategoryName)&&(identical(other.iconName, iconName) || other.iconName == iconName)&&(identical(other.iconColor, iconColor) || other.iconColor == iconColor)&&(identical(other.percentage, percentage) || other.percentage == percentage)&&(identical(other.money, money) || other.money == money)&&(identical(other.isSynced, isSynced) || other.isSynced == isSynced)&&const DeepCollectionEquality().equals(other.subSummaries, subSummaries));
}


@override
int get hashCode => Object.hash(runtimeType,categoryType,categoryName,parentCategoryName,iconName,iconColor,percentage,money,isSynced,const DeepCollectionEquality().hash(subSummaries));

@override
String toString() {
  return 'CategoryViewSummaryData(categoryType: $categoryType, categoryName: $categoryName, parentCategoryName: $parentCategoryName, iconName: $iconName, iconColor: $iconColor, percentage: $percentage, money: $money, isSynced: $isSynced, subSummaries: $subSummaries)';
}


}

/// @nodoc
abstract mixin class $CategoryViewSummaryDataCopyWith<$Res>  {
  factory $CategoryViewSummaryDataCopyWith(CategoryViewSummaryData value, $Res Function(CategoryViewSummaryData) _then) = _$CategoryViewSummaryDataCopyWithImpl;
@useResult
$Res call({
 CategoryType categoryType, String categoryName, String? parentCategoryName, String iconName, String iconColor, int percentage, Money money, bool isSynced, List<CategoryViewSummaryData> subSummaries
});


$MoneyCopyWith<$Res> get money;

}
/// @nodoc
class _$CategoryViewSummaryDataCopyWithImpl<$Res>
    implements $CategoryViewSummaryDataCopyWith<$Res> {
  _$CategoryViewSummaryDataCopyWithImpl(this._self, this._then);

  final CategoryViewSummaryData _self;
  final $Res Function(CategoryViewSummaryData) _then;

/// Create a copy of CategoryViewSummaryData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoryType = null,Object? categoryName = null,Object? parentCategoryName = freezed,Object? iconName = null,Object? iconColor = null,Object? percentage = null,Object? money = null,Object? isSynced = null,Object? subSummaries = null,}) {
  return _then(_self.copyWith(
categoryType: null == categoryType ? _self.categoryType : categoryType // ignore: cast_nullable_to_non_nullable
as CategoryType,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,parentCategoryName: freezed == parentCategoryName ? _self.parentCategoryName : parentCategoryName // ignore: cast_nullable_to_non_nullable
as String?,iconName: null == iconName ? _self.iconName : iconName // ignore: cast_nullable_to_non_nullable
as String,iconColor: null == iconColor ? _self.iconColor : iconColor // ignore: cast_nullable_to_non_nullable
as String,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as int,money: null == money ? _self.money : money // ignore: cast_nullable_to_non_nullable
as Money,isSynced: null == isSynced ? _self.isSynced : isSynced // ignore: cast_nullable_to_non_nullable
as bool,subSummaries: null == subSummaries ? _self.subSummaries : subSummaries // ignore: cast_nullable_to_non_nullable
as List<CategoryViewSummaryData>,
  ));
}
/// Create a copy of CategoryViewSummaryData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get money {
  
  return $MoneyCopyWith<$Res>(_self.money, (value) {
    return _then(_self.copyWith(money: value));
  });
}
}


/// Adds pattern-matching-related methods to [CategoryViewSummaryData].
extension CategoryViewSummaryDataPatterns on CategoryViewSummaryData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryViewSummaryData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryViewSummaryData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryViewSummaryData value)  $default,){
final _that = this;
switch (_that) {
case _CategoryViewSummaryData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryViewSummaryData value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryViewSummaryData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CategoryType categoryType,  String categoryName,  String? parentCategoryName,  String iconName,  String iconColor,  int percentage,  Money money,  bool isSynced,  List<CategoryViewSummaryData> subSummaries)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryViewSummaryData() when $default != null:
return $default(_that.categoryType,_that.categoryName,_that.parentCategoryName,_that.iconName,_that.iconColor,_that.percentage,_that.money,_that.isSynced,_that.subSummaries);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CategoryType categoryType,  String categoryName,  String? parentCategoryName,  String iconName,  String iconColor,  int percentage,  Money money,  bool isSynced,  List<CategoryViewSummaryData> subSummaries)  $default,) {final _that = this;
switch (_that) {
case _CategoryViewSummaryData():
return $default(_that.categoryType,_that.categoryName,_that.parentCategoryName,_that.iconName,_that.iconColor,_that.percentage,_that.money,_that.isSynced,_that.subSummaries);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CategoryType categoryType,  String categoryName,  String? parentCategoryName,  String iconName,  String iconColor,  int percentage,  Money money,  bool isSynced,  List<CategoryViewSummaryData> subSummaries)?  $default,) {final _that = this;
switch (_that) {
case _CategoryViewSummaryData() when $default != null:
return $default(_that.categoryType,_that.categoryName,_that.parentCategoryName,_that.iconName,_that.iconColor,_that.percentage,_that.money,_that.isSynced,_that.subSummaries);case _:
  return null;

}
}

}

/// @nodoc


class _CategoryViewSummaryData extends CategoryViewSummaryData {
  const _CategoryViewSummaryData({required this.categoryType, required this.categoryName, required this.parentCategoryName, required this.iconName, required this.iconColor, required this.percentage, required this.money, required this.isSynced, final  List<CategoryViewSummaryData> subSummaries = const []}): _subSummaries = subSummaries,super._();
  

@override final  CategoryType categoryType;
@override final  String categoryName;
@override final  String? parentCategoryName;
@override final  String iconName;
@override final  String iconColor;
@override final  int percentage;
@override final  Money money;
@override final  bool isSynced;
 final  List<CategoryViewSummaryData> _subSummaries;
@override@JsonKey() List<CategoryViewSummaryData> get subSummaries {
  if (_subSummaries is EqualUnmodifiableListView) return _subSummaries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subSummaries);
}


/// Create a copy of CategoryViewSummaryData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryViewSummaryDataCopyWith<_CategoryViewSummaryData> get copyWith => __$CategoryViewSummaryDataCopyWithImpl<_CategoryViewSummaryData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryViewSummaryData&&(identical(other.categoryType, categoryType) || other.categoryType == categoryType)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.parentCategoryName, parentCategoryName) || other.parentCategoryName == parentCategoryName)&&(identical(other.iconName, iconName) || other.iconName == iconName)&&(identical(other.iconColor, iconColor) || other.iconColor == iconColor)&&(identical(other.percentage, percentage) || other.percentage == percentage)&&(identical(other.money, money) || other.money == money)&&(identical(other.isSynced, isSynced) || other.isSynced == isSynced)&&const DeepCollectionEquality().equals(other._subSummaries, _subSummaries));
}


@override
int get hashCode => Object.hash(runtimeType,categoryType,categoryName,parentCategoryName,iconName,iconColor,percentage,money,isSynced,const DeepCollectionEquality().hash(_subSummaries));

@override
String toString() {
  return 'CategoryViewSummaryData(categoryType: $categoryType, categoryName: $categoryName, parentCategoryName: $parentCategoryName, iconName: $iconName, iconColor: $iconColor, percentage: $percentage, money: $money, isSynced: $isSynced, subSummaries: $subSummaries)';
}


}

/// @nodoc
abstract mixin class _$CategoryViewSummaryDataCopyWith<$Res> implements $CategoryViewSummaryDataCopyWith<$Res> {
  factory _$CategoryViewSummaryDataCopyWith(_CategoryViewSummaryData value, $Res Function(_CategoryViewSummaryData) _then) = __$CategoryViewSummaryDataCopyWithImpl;
@override @useResult
$Res call({
 CategoryType categoryType, String categoryName, String? parentCategoryName, String iconName, String iconColor, int percentage, Money money, bool isSynced, List<CategoryViewSummaryData> subSummaries
});


@override $MoneyCopyWith<$Res> get money;

}
/// @nodoc
class __$CategoryViewSummaryDataCopyWithImpl<$Res>
    implements _$CategoryViewSummaryDataCopyWith<$Res> {
  __$CategoryViewSummaryDataCopyWithImpl(this._self, this._then);

  final _CategoryViewSummaryData _self;
  final $Res Function(_CategoryViewSummaryData) _then;

/// Create a copy of CategoryViewSummaryData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoryType = null,Object? categoryName = null,Object? parentCategoryName = freezed,Object? iconName = null,Object? iconColor = null,Object? percentage = null,Object? money = null,Object? isSynced = null,Object? subSummaries = null,}) {
  return _then(_CategoryViewSummaryData(
categoryType: null == categoryType ? _self.categoryType : categoryType // ignore: cast_nullable_to_non_nullable
as CategoryType,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,parentCategoryName: freezed == parentCategoryName ? _self.parentCategoryName : parentCategoryName // ignore: cast_nullable_to_non_nullable
as String?,iconName: null == iconName ? _self.iconName : iconName // ignore: cast_nullable_to_non_nullable
as String,iconColor: null == iconColor ? _self.iconColor : iconColor // ignore: cast_nullable_to_non_nullable
as String,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as int,money: null == money ? _self.money : money // ignore: cast_nullable_to_non_nullable
as Money,isSynced: null == isSynced ? _self.isSynced : isSynced // ignore: cast_nullable_to_non_nullable
as bool,subSummaries: null == subSummaries ? _self._subSummaries : subSummaries // ignore: cast_nullable_to_non_nullable
as List<CategoryViewSummaryData>,
  ));
}

/// Create a copy of CategoryViewSummaryData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get money {
  
  return $MoneyCopyWith<$Res>(_self.money, (value) {
    return _then(_self.copyWith(money: value));
  });
}
}

// dart format on
