// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summary_view_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SummaryViewData {

 BudgetDateRange get dateRange; List<PieData> get pieData; List<CategoryViewSummaryData> get summaries; Money get income; Money get outcome;
/// Create a copy of SummaryViewData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SummaryViewDataCopyWith<SummaryViewData> get copyWith => _$SummaryViewDataCopyWithImpl<SummaryViewData>(this as SummaryViewData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SummaryViewData&&(identical(other.dateRange, dateRange) || other.dateRange == dateRange)&&const DeepCollectionEquality().equals(other.pieData, pieData)&&const DeepCollectionEquality().equals(other.summaries, summaries)&&(identical(other.income, income) || other.income == income)&&(identical(other.outcome, outcome) || other.outcome == outcome));
}


@override
int get hashCode => Object.hash(runtimeType,dateRange,const DeepCollectionEquality().hash(pieData),const DeepCollectionEquality().hash(summaries),income,outcome);

@override
String toString() {
  return 'SummaryViewData(dateRange: $dateRange, pieData: $pieData, summaries: $summaries, income: $income, outcome: $outcome)';
}


}

/// @nodoc
abstract mixin class $SummaryViewDataCopyWith<$Res>  {
  factory $SummaryViewDataCopyWith(SummaryViewData value, $Res Function(SummaryViewData) _then) = _$SummaryViewDataCopyWithImpl;
@useResult
$Res call({
 BudgetDateRange dateRange, List<PieData> pieData, List<CategoryViewSummaryData> summaries, Money income, Money outcome
});


$BudgetDateRangeCopyWith<$Res> get dateRange;$MoneyCopyWith<$Res> get income;$MoneyCopyWith<$Res> get outcome;

}
/// @nodoc
class _$SummaryViewDataCopyWithImpl<$Res>
    implements $SummaryViewDataCopyWith<$Res> {
  _$SummaryViewDataCopyWithImpl(this._self, this._then);

  final SummaryViewData _self;
  final $Res Function(SummaryViewData) _then;

/// Create a copy of SummaryViewData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dateRange = null,Object? pieData = null,Object? summaries = null,Object? income = null,Object? outcome = null,}) {
  return _then(_self.copyWith(
dateRange: null == dateRange ? _self.dateRange : dateRange // ignore: cast_nullable_to_non_nullable
as BudgetDateRange,pieData: null == pieData ? _self.pieData : pieData // ignore: cast_nullable_to_non_nullable
as List<PieData>,summaries: null == summaries ? _self.summaries : summaries // ignore: cast_nullable_to_non_nullable
as List<CategoryViewSummaryData>,income: null == income ? _self.income : income // ignore: cast_nullable_to_non_nullable
as Money,outcome: null == outcome ? _self.outcome : outcome // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}
/// Create a copy of SummaryViewData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BudgetDateRangeCopyWith<$Res> get dateRange {
  
  return $BudgetDateRangeCopyWith<$Res>(_self.dateRange, (value) {
    return _then(_self.copyWith(dateRange: value));
  });
}/// Create a copy of SummaryViewData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get income {
  
  return $MoneyCopyWith<$Res>(_self.income, (value) {
    return _then(_self.copyWith(income: value));
  });
}/// Create a copy of SummaryViewData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get outcome {
  
  return $MoneyCopyWith<$Res>(_self.outcome, (value) {
    return _then(_self.copyWith(outcome: value));
  });
}
}


/// Adds pattern-matching-related methods to [SummaryViewData].
extension SummaryViewDataPatterns on SummaryViewData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SummaryViewData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SummaryViewData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SummaryViewData value)  $default,){
final _that = this;
switch (_that) {
case _SummaryViewData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SummaryViewData value)?  $default,){
final _that = this;
switch (_that) {
case _SummaryViewData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BudgetDateRange dateRange,  List<PieData> pieData,  List<CategoryViewSummaryData> summaries,  Money income,  Money outcome)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SummaryViewData() when $default != null:
return $default(_that.dateRange,_that.pieData,_that.summaries,_that.income,_that.outcome);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BudgetDateRange dateRange,  List<PieData> pieData,  List<CategoryViewSummaryData> summaries,  Money income,  Money outcome)  $default,) {final _that = this;
switch (_that) {
case _SummaryViewData():
return $default(_that.dateRange,_that.pieData,_that.summaries,_that.income,_that.outcome);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BudgetDateRange dateRange,  List<PieData> pieData,  List<CategoryViewSummaryData> summaries,  Money income,  Money outcome)?  $default,) {final _that = this;
switch (_that) {
case _SummaryViewData() when $default != null:
return $default(_that.dateRange,_that.pieData,_that.summaries,_that.income,_that.outcome);case _:
  return null;

}
}

}

/// @nodoc


class _SummaryViewData extends SummaryViewData {
  const _SummaryViewData({required this.dateRange, required final  List<PieData> pieData, required final  List<CategoryViewSummaryData> summaries, required this.income, required this.outcome}): _pieData = pieData,_summaries = summaries,super._();
  

@override final  BudgetDateRange dateRange;
 final  List<PieData> _pieData;
@override List<PieData> get pieData {
  if (_pieData is EqualUnmodifiableListView) return _pieData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pieData);
}

 final  List<CategoryViewSummaryData> _summaries;
@override List<CategoryViewSummaryData> get summaries {
  if (_summaries is EqualUnmodifiableListView) return _summaries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_summaries);
}

@override final  Money income;
@override final  Money outcome;

/// Create a copy of SummaryViewData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SummaryViewDataCopyWith<_SummaryViewData> get copyWith => __$SummaryViewDataCopyWithImpl<_SummaryViewData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SummaryViewData&&(identical(other.dateRange, dateRange) || other.dateRange == dateRange)&&const DeepCollectionEquality().equals(other._pieData, _pieData)&&const DeepCollectionEquality().equals(other._summaries, _summaries)&&(identical(other.income, income) || other.income == income)&&(identical(other.outcome, outcome) || other.outcome == outcome));
}


@override
int get hashCode => Object.hash(runtimeType,dateRange,const DeepCollectionEquality().hash(_pieData),const DeepCollectionEquality().hash(_summaries),income,outcome);

@override
String toString() {
  return 'SummaryViewData(dateRange: $dateRange, pieData: $pieData, summaries: $summaries, income: $income, outcome: $outcome)';
}


}

/// @nodoc
abstract mixin class _$SummaryViewDataCopyWith<$Res> implements $SummaryViewDataCopyWith<$Res> {
  factory _$SummaryViewDataCopyWith(_SummaryViewData value, $Res Function(_SummaryViewData) _then) = __$SummaryViewDataCopyWithImpl;
@override @useResult
$Res call({
 BudgetDateRange dateRange, List<PieData> pieData, List<CategoryViewSummaryData> summaries, Money income, Money outcome
});


@override $BudgetDateRangeCopyWith<$Res> get dateRange;@override $MoneyCopyWith<$Res> get income;@override $MoneyCopyWith<$Res> get outcome;

}
/// @nodoc
class __$SummaryViewDataCopyWithImpl<$Res>
    implements _$SummaryViewDataCopyWith<$Res> {
  __$SummaryViewDataCopyWithImpl(this._self, this._then);

  final _SummaryViewData _self;
  final $Res Function(_SummaryViewData) _then;

/// Create a copy of SummaryViewData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dateRange = null,Object? pieData = null,Object? summaries = null,Object? income = null,Object? outcome = null,}) {
  return _then(_SummaryViewData(
dateRange: null == dateRange ? _self.dateRange : dateRange // ignore: cast_nullable_to_non_nullable
as BudgetDateRange,pieData: null == pieData ? _self._pieData : pieData // ignore: cast_nullable_to_non_nullable
as List<PieData>,summaries: null == summaries ? _self._summaries : summaries // ignore: cast_nullable_to_non_nullable
as List<CategoryViewSummaryData>,income: null == income ? _self.income : income // ignore: cast_nullable_to_non_nullable
as Money,outcome: null == outcome ? _self.outcome : outcome // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}

/// Create a copy of SummaryViewData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BudgetDateRangeCopyWith<$Res> get dateRange {
  
  return $BudgetDateRangeCopyWith<$Res>(_self.dateRange, (value) {
    return _then(_self.copyWith(dateRange: value));
  });
}/// Create a copy of SummaryViewData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get income {
  
  return $MoneyCopyWith<$Res>(_self.income, (value) {
    return _then(_self.copyWith(income: value));
  });
}/// Create a copy of SummaryViewData
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
