// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoryGroup {

 Category get category; List<Booking> get bookings; Money get money; List<CategoryGroup> get subGroups;
/// Create a copy of CategoryGroup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryGroupCopyWith<CategoryGroup> get copyWith => _$CategoryGroupCopyWithImpl<CategoryGroup>(this as CategoryGroup, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryGroup&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other.bookings, bookings)&&(identical(other.money, money) || other.money == money)&&const DeepCollectionEquality().equals(other.subGroups, subGroups));
}


@override
int get hashCode => Object.hash(runtimeType,category,const DeepCollectionEquality().hash(bookings),money,const DeepCollectionEquality().hash(subGroups));

@override
String toString() {
  return 'CategoryGroup(category: $category, bookings: $bookings, money: $money, subGroups: $subGroups)';
}


}

/// @nodoc
abstract mixin class $CategoryGroupCopyWith<$Res>  {
  factory $CategoryGroupCopyWith(CategoryGroup value, $Res Function(CategoryGroup) _then) = _$CategoryGroupCopyWithImpl;
@useResult
$Res call({
 Category category, List<Booking> bookings, Money money, List<CategoryGroup> subGroups
});


$CategoryCopyWith<$Res> get category;$MoneyCopyWith<$Res> get money;

}
/// @nodoc
class _$CategoryGroupCopyWithImpl<$Res>
    implements $CategoryGroupCopyWith<$Res> {
  _$CategoryGroupCopyWithImpl(this._self, this._then);

  final CategoryGroup _self;
  final $Res Function(CategoryGroup) _then;

/// Create a copy of CategoryGroup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = null,Object? bookings = null,Object? money = null,Object? subGroups = null,}) {
  return _then(_self.copyWith(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category,bookings: null == bookings ? _self.bookings : bookings // ignore: cast_nullable_to_non_nullable
as List<Booking>,money: null == money ? _self.money : money // ignore: cast_nullable_to_non_nullable
as Money,subGroups: null == subGroups ? _self.subGroups : subGroups // ignore: cast_nullable_to_non_nullable
as List<CategoryGroup>,
  ));
}
/// Create a copy of CategoryGroup
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryCopyWith<$Res> get category {
  
  return $CategoryCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of CategoryGroup
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get money {
  
  return $MoneyCopyWith<$Res>(_self.money, (value) {
    return _then(_self.copyWith(money: value));
  });
}
}


/// Adds pattern-matching-related methods to [CategoryGroup].
extension CategoryGroupPatterns on CategoryGroup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryGroup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryGroup() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryGroup value)  $default,){
final _that = this;
switch (_that) {
case _CategoryGroup():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryGroup value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryGroup() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Category category,  List<Booking> bookings,  Money money,  List<CategoryGroup> subGroups)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryGroup() when $default != null:
return $default(_that.category,_that.bookings,_that.money,_that.subGroups);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Category category,  List<Booking> bookings,  Money money,  List<CategoryGroup> subGroups)  $default,) {final _that = this;
switch (_that) {
case _CategoryGroup():
return $default(_that.category,_that.bookings,_that.money,_that.subGroups);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Category category,  List<Booking> bookings,  Money money,  List<CategoryGroup> subGroups)?  $default,) {final _that = this;
switch (_that) {
case _CategoryGroup() when $default != null:
return $default(_that.category,_that.bookings,_that.money,_that.subGroups);case _:
  return null;

}
}

}

/// @nodoc


class _CategoryGroup extends CategoryGroup {
  const _CategoryGroup({required this.category, final  List<Booking> bookings = const [], required this.money, final  List<CategoryGroup> subGroups = const []}): _bookings = bookings,_subGroups = subGroups,super._();
  

@override final  Category category;
 final  List<Booking> _bookings;
@override@JsonKey() List<Booking> get bookings {
  if (_bookings is EqualUnmodifiableListView) return _bookings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bookings);
}

@override final  Money money;
 final  List<CategoryGroup> _subGroups;
@override@JsonKey() List<CategoryGroup> get subGroups {
  if (_subGroups is EqualUnmodifiableListView) return _subGroups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subGroups);
}


/// Create a copy of CategoryGroup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryGroupCopyWith<_CategoryGroup> get copyWith => __$CategoryGroupCopyWithImpl<_CategoryGroup>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryGroup&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other._bookings, _bookings)&&(identical(other.money, money) || other.money == money)&&const DeepCollectionEquality().equals(other._subGroups, _subGroups));
}


@override
int get hashCode => Object.hash(runtimeType,category,const DeepCollectionEquality().hash(_bookings),money,const DeepCollectionEquality().hash(_subGroups));

@override
String toString() {
  return 'CategoryGroup(category: $category, bookings: $bookings, money: $money, subGroups: $subGroups)';
}


}

/// @nodoc
abstract mixin class _$CategoryGroupCopyWith<$Res> implements $CategoryGroupCopyWith<$Res> {
  factory _$CategoryGroupCopyWith(_CategoryGroup value, $Res Function(_CategoryGroup) _then) = __$CategoryGroupCopyWithImpl;
@override @useResult
$Res call({
 Category category, List<Booking> bookings, Money money, List<CategoryGroup> subGroups
});


@override $CategoryCopyWith<$Res> get category;@override $MoneyCopyWith<$Res> get money;

}
/// @nodoc
class __$CategoryGroupCopyWithImpl<$Res>
    implements _$CategoryGroupCopyWith<$Res> {
  __$CategoryGroupCopyWithImpl(this._self, this._then);

  final _CategoryGroup _self;
  final $Res Function(_CategoryGroup) _then;

/// Create a copy of CategoryGroup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = null,Object? bookings = null,Object? money = null,Object? subGroups = null,}) {
  return _then(_CategoryGroup(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category,bookings: null == bookings ? _self._bookings : bookings // ignore: cast_nullable_to_non_nullable
as List<Booking>,money: null == money ? _self.money : money // ignore: cast_nullable_to_non_nullable
as Money,subGroups: null == subGroups ? _self._subGroups : subGroups // ignore: cast_nullable_to_non_nullable
as List<CategoryGroup>,
  ));
}

/// Create a copy of CategoryGroup
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryCopyWith<$Res> get category {
  
  return $CategoryCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of CategoryGroup
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
