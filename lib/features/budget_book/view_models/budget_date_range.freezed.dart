// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_date_range.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BudgetDateRange {

 PeriodMode get period; DateTime get from; DateTime get to;
/// Create a copy of BudgetDateRange
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BudgetDateRangeCopyWith<BudgetDateRange> get copyWith => _$BudgetDateRangeCopyWithImpl<BudgetDateRange>(this as BudgetDateRange, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BudgetDateRange&&(identical(other.period, period) || other.period == period)&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to));
}


@override
int get hashCode => Object.hash(runtimeType,period,from,to);



}

/// @nodoc
abstract mixin class $BudgetDateRangeCopyWith<$Res>  {
  factory $BudgetDateRangeCopyWith(BudgetDateRange value, $Res Function(BudgetDateRange) _then) = _$BudgetDateRangeCopyWithImpl;
@useResult
$Res call({
 PeriodMode period, DateTime from, DateTime to
});




}
/// @nodoc
class _$BudgetDateRangeCopyWithImpl<$Res>
    implements $BudgetDateRangeCopyWith<$Res> {
  _$BudgetDateRangeCopyWithImpl(this._self, this._then);

  final BudgetDateRange _self;
  final $Res Function(BudgetDateRange) _then;

/// Create a copy of BudgetDateRange
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? period = null,Object? from = null,Object? to = null,}) {
  return _then(_self.copyWith(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as PeriodMode,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as DateTime,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [BudgetDateRange].
extension BudgetDateRangePatterns on BudgetDateRange {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BudgetDateRange value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BudgetDateRange() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BudgetDateRange value)  $default,){
final _that = this;
switch (_that) {
case _BudgetDateRange():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BudgetDateRange value)?  $default,){
final _that = this;
switch (_that) {
case _BudgetDateRange() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PeriodMode period,  DateTime from,  DateTime to)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BudgetDateRange() when $default != null:
return $default(_that.period,_that.from,_that.to);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PeriodMode period,  DateTime from,  DateTime to)  $default,) {final _that = this;
switch (_that) {
case _BudgetDateRange():
return $default(_that.period,_that.from,_that.to);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PeriodMode period,  DateTime from,  DateTime to)?  $default,) {final _that = this;
switch (_that) {
case _BudgetDateRange() when $default != null:
return $default(_that.period,_that.from,_that.to);case _:
  return null;

}
}

}

/// @nodoc


class _BudgetDateRange extends BudgetDateRange {
  const _BudgetDateRange({required this.period, required this.from, required this.to}): assert(period == PeriodMode.all || (from != null && to != null)),super._();
  

@override final  PeriodMode period;
@override final  DateTime from;
@override final  DateTime to;

/// Create a copy of BudgetDateRange
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BudgetDateRangeCopyWith<_BudgetDateRange> get copyWith => __$BudgetDateRangeCopyWithImpl<_BudgetDateRange>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BudgetDateRange&&(identical(other.period, period) || other.period == period)&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to));
}


@override
int get hashCode => Object.hash(runtimeType,period,from,to);



}

/// @nodoc
abstract mixin class _$BudgetDateRangeCopyWith<$Res> implements $BudgetDateRangeCopyWith<$Res> {
  factory _$BudgetDateRangeCopyWith(_BudgetDateRange value, $Res Function(_BudgetDateRange) _then) = __$BudgetDateRangeCopyWithImpl;
@override @useResult
$Res call({
 PeriodMode period, DateTime from, DateTime to
});




}
/// @nodoc
class __$BudgetDateRangeCopyWithImpl<$Res>
    implements _$BudgetDateRangeCopyWith<$Res> {
  __$BudgetDateRangeCopyWithImpl(this._self, this._then);

  final _BudgetDateRange _self;
  final $Res Function(_BudgetDateRange) _then;

/// Create a copy of BudgetDateRange
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? period = null,Object? from = null,Object? to = null,}) {
  return _then(_BudgetDateRange(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as PeriodMode,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as DateTime,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
