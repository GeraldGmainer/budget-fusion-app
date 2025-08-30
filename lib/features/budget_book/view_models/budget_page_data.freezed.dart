// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_page_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BudgetPageData {

 BudgetDateRange get dateRange; Money get income; Money get outcome; List<Booking> get bookings;
/// Create a copy of BudgetPageData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BudgetPageDataCopyWith<BudgetPageData> get copyWith => _$BudgetPageDataCopyWithImpl<BudgetPageData>(this as BudgetPageData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BudgetPageData&&(identical(other.dateRange, dateRange) || other.dateRange == dateRange)&&(identical(other.income, income) || other.income == income)&&(identical(other.outcome, outcome) || other.outcome == outcome)&&const DeepCollectionEquality().equals(other.bookings, bookings));
}


@override
int get hashCode => Object.hash(runtimeType,dateRange,income,outcome,const DeepCollectionEquality().hash(bookings));

@override
String toString() {
  return 'BudgetPageData(dateRange: $dateRange, income: $income, outcome: $outcome, bookings: $bookings)';
}


}

/// @nodoc
abstract mixin class $BudgetPageDataCopyWith<$Res>  {
  factory $BudgetPageDataCopyWith(BudgetPageData value, $Res Function(BudgetPageData) _then) = _$BudgetPageDataCopyWithImpl;
@useResult
$Res call({
 BudgetDateRange dateRange, Money income, Money outcome, List<Booking> bookings
});


$BudgetDateRangeCopyWith<$Res> get dateRange;$MoneyCopyWith<$Res> get income;$MoneyCopyWith<$Res> get outcome;

}
/// @nodoc
class _$BudgetPageDataCopyWithImpl<$Res>
    implements $BudgetPageDataCopyWith<$Res> {
  _$BudgetPageDataCopyWithImpl(this._self, this._then);

  final BudgetPageData _self;
  final $Res Function(BudgetPageData) _then;

/// Create a copy of BudgetPageData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dateRange = null,Object? income = null,Object? outcome = null,Object? bookings = null,}) {
  return _then(_self.copyWith(
dateRange: null == dateRange ? _self.dateRange : dateRange // ignore: cast_nullable_to_non_nullable
as BudgetDateRange,income: null == income ? _self.income : income // ignore: cast_nullable_to_non_nullable
as Money,outcome: null == outcome ? _self.outcome : outcome // ignore: cast_nullable_to_non_nullable
as Money,bookings: null == bookings ? _self.bookings : bookings // ignore: cast_nullable_to_non_nullable
as List<Booking>,
  ));
}
/// Create a copy of BudgetPageData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BudgetDateRangeCopyWith<$Res> get dateRange {
  
  return $BudgetDateRangeCopyWith<$Res>(_self.dateRange, (value) {
    return _then(_self.copyWith(dateRange: value));
  });
}/// Create a copy of BudgetPageData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get income {
  
  return $MoneyCopyWith<$Res>(_self.income, (value) {
    return _then(_self.copyWith(income: value));
  });
}/// Create a copy of BudgetPageData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get outcome {
  
  return $MoneyCopyWith<$Res>(_self.outcome, (value) {
    return _then(_self.copyWith(outcome: value));
  });
}
}


/// Adds pattern-matching-related methods to [BudgetPageData].
extension BudgetPageDataPatterns on BudgetPageData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BudgetPageData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BudgetPageData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BudgetPageData value)  $default,){
final _that = this;
switch (_that) {
case _BudgetPageData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BudgetPageData value)?  $default,){
final _that = this;
switch (_that) {
case _BudgetPageData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BudgetDateRange dateRange,  Money income,  Money outcome,  List<Booking> bookings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BudgetPageData() when $default != null:
return $default(_that.dateRange,_that.income,_that.outcome,_that.bookings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BudgetDateRange dateRange,  Money income,  Money outcome,  List<Booking> bookings)  $default,) {final _that = this;
switch (_that) {
case _BudgetPageData():
return $default(_that.dateRange,_that.income,_that.outcome,_that.bookings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BudgetDateRange dateRange,  Money income,  Money outcome,  List<Booking> bookings)?  $default,) {final _that = this;
switch (_that) {
case _BudgetPageData() when $default != null:
return $default(_that.dateRange,_that.income,_that.outcome,_that.bookings);case _:
  return null;

}
}

}

/// @nodoc


class _BudgetPageData extends BudgetPageData {
  const _BudgetPageData({required this.dateRange, required this.income, required this.outcome, final  List<Booking> bookings = const []}): _bookings = bookings,super._();
  

@override final  BudgetDateRange dateRange;
@override final  Money income;
@override final  Money outcome;
 final  List<Booking> _bookings;
@override@JsonKey() List<Booking> get bookings {
  if (_bookings is EqualUnmodifiableListView) return _bookings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bookings);
}


/// Create a copy of BudgetPageData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BudgetPageDataCopyWith<_BudgetPageData> get copyWith => __$BudgetPageDataCopyWithImpl<_BudgetPageData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BudgetPageData&&(identical(other.dateRange, dateRange) || other.dateRange == dateRange)&&(identical(other.income, income) || other.income == income)&&(identical(other.outcome, outcome) || other.outcome == outcome)&&const DeepCollectionEquality().equals(other._bookings, _bookings));
}


@override
int get hashCode => Object.hash(runtimeType,dateRange,income,outcome,const DeepCollectionEquality().hash(_bookings));

@override
String toString() {
  return 'BudgetPageData(dateRange: $dateRange, income: $income, outcome: $outcome, bookings: $bookings)';
}


}

/// @nodoc
abstract mixin class _$BudgetPageDataCopyWith<$Res> implements $BudgetPageDataCopyWith<$Res> {
  factory _$BudgetPageDataCopyWith(_BudgetPageData value, $Res Function(_BudgetPageData) _then) = __$BudgetPageDataCopyWithImpl;
@override @useResult
$Res call({
 BudgetDateRange dateRange, Money income, Money outcome, List<Booking> bookings
});


@override $BudgetDateRangeCopyWith<$Res> get dateRange;@override $MoneyCopyWith<$Res> get income;@override $MoneyCopyWith<$Res> get outcome;

}
/// @nodoc
class __$BudgetPageDataCopyWithImpl<$Res>
    implements _$BudgetPageDataCopyWith<$Res> {
  __$BudgetPageDataCopyWithImpl(this._self, this._then);

  final _BudgetPageData _self;
  final $Res Function(_BudgetPageData) _then;

/// Create a copy of BudgetPageData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dateRange = null,Object? income = null,Object? outcome = null,Object? bookings = null,}) {
  return _then(_BudgetPageData(
dateRange: null == dateRange ? _self.dateRange : dateRange // ignore: cast_nullable_to_non_nullable
as BudgetDateRange,income: null == income ? _self.income : income // ignore: cast_nullable_to_non_nullable
as Money,outcome: null == outcome ? _self.outcome : outcome // ignore: cast_nullable_to_non_nullable
as Money,bookings: null == bookings ? _self._bookings : bookings // ignore: cast_nullable_to_non_nullable
as List<Booking>,
  ));
}

/// Create a copy of BudgetPageData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BudgetDateRangeCopyWith<$Res> get dateRange {
  
  return $BudgetDateRangeCopyWith<$Res>(_self.dateRange, (value) {
    return _then(_self.copyWith(dateRange: value));
  });
}/// Create a copy of BudgetPageData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get income {
  
  return $MoneyCopyWith<$Res>(_self.income, (value) {
    return _then(_self.copyWith(income: value));
  });
}/// Create a copy of BudgetPageData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get outcome {
  
  return $MoneyCopyWith<$Res>(_self.outcome, (value) {
    return _then(_self.copyWith(outcome: value));
  });
}
}

// dart format on
