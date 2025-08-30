// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_view_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionViewData {

 BudgetDateRange get dateRange; List<TransactionGroup> get transactionGroups;
/// Create a copy of TransactionViewData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionViewDataCopyWith<TransactionViewData> get copyWith => _$TransactionViewDataCopyWithImpl<TransactionViewData>(this as TransactionViewData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionViewData&&(identical(other.dateRange, dateRange) || other.dateRange == dateRange)&&const DeepCollectionEquality().equals(other.transactionGroups, transactionGroups));
}


@override
int get hashCode => Object.hash(runtimeType,dateRange,const DeepCollectionEquality().hash(transactionGroups));

@override
String toString() {
  return 'TransactionViewData(dateRange: $dateRange, transactionGroups: $transactionGroups)';
}


}

/// @nodoc
abstract mixin class $TransactionViewDataCopyWith<$Res>  {
  factory $TransactionViewDataCopyWith(TransactionViewData value, $Res Function(TransactionViewData) _then) = _$TransactionViewDataCopyWithImpl;
@useResult
$Res call({
 BudgetDateRange dateRange, List<TransactionGroup> transactionGroups
});


$BudgetDateRangeCopyWith<$Res> get dateRange;

}
/// @nodoc
class _$TransactionViewDataCopyWithImpl<$Res>
    implements $TransactionViewDataCopyWith<$Res> {
  _$TransactionViewDataCopyWithImpl(this._self, this._then);

  final TransactionViewData _self;
  final $Res Function(TransactionViewData) _then;

/// Create a copy of TransactionViewData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dateRange = null,Object? transactionGroups = null,}) {
  return _then(_self.copyWith(
dateRange: null == dateRange ? _self.dateRange : dateRange // ignore: cast_nullable_to_non_nullable
as BudgetDateRange,transactionGroups: null == transactionGroups ? _self.transactionGroups : transactionGroups // ignore: cast_nullable_to_non_nullable
as List<TransactionGroup>,
  ));
}
/// Create a copy of TransactionViewData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BudgetDateRangeCopyWith<$Res> get dateRange {
  
  return $BudgetDateRangeCopyWith<$Res>(_self.dateRange, (value) {
    return _then(_self.copyWith(dateRange: value));
  });
}
}


/// Adds pattern-matching-related methods to [TransactionViewData].
extension TransactionViewDataPatterns on TransactionViewData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionViewData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionViewData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionViewData value)  $default,){
final _that = this;
switch (_that) {
case _TransactionViewData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionViewData value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionViewData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BudgetDateRange dateRange,  List<TransactionGroup> transactionGroups)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionViewData() when $default != null:
return $default(_that.dateRange,_that.transactionGroups);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BudgetDateRange dateRange,  List<TransactionGroup> transactionGroups)  $default,) {final _that = this;
switch (_that) {
case _TransactionViewData():
return $default(_that.dateRange,_that.transactionGroups);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BudgetDateRange dateRange,  List<TransactionGroup> transactionGroups)?  $default,) {final _that = this;
switch (_that) {
case _TransactionViewData() when $default != null:
return $default(_that.dateRange,_that.transactionGroups);case _:
  return null;

}
}

}

/// @nodoc


class _TransactionViewData extends TransactionViewData {
  const _TransactionViewData({required this.dateRange, required final  List<TransactionGroup> transactionGroups}): _transactionGroups = transactionGroups,super._();
  

@override final  BudgetDateRange dateRange;
 final  List<TransactionGroup> _transactionGroups;
@override List<TransactionGroup> get transactionGroups {
  if (_transactionGroups is EqualUnmodifiableListView) return _transactionGroups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactionGroups);
}


/// Create a copy of TransactionViewData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionViewDataCopyWith<_TransactionViewData> get copyWith => __$TransactionViewDataCopyWithImpl<_TransactionViewData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionViewData&&(identical(other.dateRange, dateRange) || other.dateRange == dateRange)&&const DeepCollectionEquality().equals(other._transactionGroups, _transactionGroups));
}


@override
int get hashCode => Object.hash(runtimeType,dateRange,const DeepCollectionEquality().hash(_transactionGroups));

@override
String toString() {
  return 'TransactionViewData(dateRange: $dateRange, transactionGroups: $transactionGroups)';
}


}

/// @nodoc
abstract mixin class _$TransactionViewDataCopyWith<$Res> implements $TransactionViewDataCopyWith<$Res> {
  factory _$TransactionViewDataCopyWith(_TransactionViewData value, $Res Function(_TransactionViewData) _then) = __$TransactionViewDataCopyWithImpl;
@override @useResult
$Res call({
 BudgetDateRange dateRange, List<TransactionGroup> transactionGroups
});


@override $BudgetDateRangeCopyWith<$Res> get dateRange;

}
/// @nodoc
class __$TransactionViewDataCopyWithImpl<$Res>
    implements _$TransactionViewDataCopyWith<$Res> {
  __$TransactionViewDataCopyWithImpl(this._self, this._then);

  final _TransactionViewData _self;
  final $Res Function(_TransactionViewData) _then;

/// Create a copy of TransactionViewData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dateRange = null,Object? transactionGroups = null,}) {
  return _then(_TransactionViewData(
dateRange: null == dateRange ? _self.dateRange : dateRange // ignore: cast_nullable_to_non_nullable
as BudgetDateRange,transactionGroups: null == transactionGroups ? _self._transactionGroups : transactionGroups // ignore: cast_nullable_to_non_nullable
as List<TransactionGroup>,
  ));
}

/// Create a copy of TransactionViewData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BudgetDateRangeCopyWith<$Res> get dateRange {
  
  return $BudgetDateRangeCopyWith<$Res>(_self.dateRange, (value) {
    return _then(_self.copyWith(dateRange: value));
  });
}
}

// dart format on
