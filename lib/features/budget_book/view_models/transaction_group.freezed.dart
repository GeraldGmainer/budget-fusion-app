// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionGroup {

 DateTime get date; List<Booking> get bookings;
/// Create a copy of TransactionGroup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionGroupCopyWith<TransactionGroup> get copyWith => _$TransactionGroupCopyWithImpl<TransactionGroup>(this as TransactionGroup, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionGroup&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other.bookings, bookings));
}


@override
int get hashCode => Object.hash(runtimeType,date,const DeepCollectionEquality().hash(bookings));

@override
String toString() {
  return 'TransactionGroup(date: $date, bookings: $bookings)';
}


}

/// @nodoc
abstract mixin class $TransactionGroupCopyWith<$Res>  {
  factory $TransactionGroupCopyWith(TransactionGroup value, $Res Function(TransactionGroup) _then) = _$TransactionGroupCopyWithImpl;
@useResult
$Res call({
 DateTime date, List<Booking> bookings
});




}
/// @nodoc
class _$TransactionGroupCopyWithImpl<$Res>
    implements $TransactionGroupCopyWith<$Res> {
  _$TransactionGroupCopyWithImpl(this._self, this._then);

  final TransactionGroup _self;
  final $Res Function(TransactionGroup) _then;

/// Create a copy of TransactionGroup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? bookings = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,bookings: null == bookings ? _self.bookings : bookings // ignore: cast_nullable_to_non_nullable
as List<Booking>,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionGroup].
extension TransactionGroupPatterns on TransactionGroup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionGroup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionGroup() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionGroup value)  $default,){
final _that = this;
switch (_that) {
case _TransactionGroup():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionGroup value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionGroup() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  List<Booking> bookings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionGroup() when $default != null:
return $default(_that.date,_that.bookings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  List<Booking> bookings)  $default,) {final _that = this;
switch (_that) {
case _TransactionGroup():
return $default(_that.date,_that.bookings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  List<Booking> bookings)?  $default,) {final _that = this;
switch (_that) {
case _TransactionGroup() when $default != null:
return $default(_that.date,_that.bookings);case _:
  return null;

}
}

}

/// @nodoc


class _TransactionGroup extends TransactionGroup {
  const _TransactionGroup({required this.date, required final  List<Booking> bookings}): _bookings = bookings,super._();
  

@override final  DateTime date;
 final  List<Booking> _bookings;
@override List<Booking> get bookings {
  if (_bookings is EqualUnmodifiableListView) return _bookings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bookings);
}


/// Create a copy of TransactionGroup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionGroupCopyWith<_TransactionGroup> get copyWith => __$TransactionGroupCopyWithImpl<_TransactionGroup>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionGroup&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other._bookings, _bookings));
}


@override
int get hashCode => Object.hash(runtimeType,date,const DeepCollectionEquality().hash(_bookings));

@override
String toString() {
  return 'TransactionGroup(date: $date, bookings: $bookings)';
}


}

/// @nodoc
abstract mixin class _$TransactionGroupCopyWith<$Res> implements $TransactionGroupCopyWith<$Res> {
  factory _$TransactionGroupCopyWith(_TransactionGroup value, $Res Function(_TransactionGroup) _then) = __$TransactionGroupCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, List<Booking> bookings
});




}
/// @nodoc
class __$TransactionGroupCopyWithImpl<$Res>
    implements _$TransactionGroupCopyWith<$Res> {
  __$TransactionGroupCopyWithImpl(this._self, this._then);

  final _TransactionGroup _self;
  final $Res Function(_TransactionGroup) _then;

/// Create a copy of TransactionGroup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? bookings = null,}) {
  return _then(_TransactionGroup(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,bookings: null == bookings ? _self._bookings : bookings // ignore: cast_nullable_to_non_nullable
as List<Booking>,
  ));
}


}

// dart format on
