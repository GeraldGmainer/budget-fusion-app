// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_book_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BudgetBookState {

 List<BudgetViewData> get items; BudgetBookFilter get filter; BudgetViewMode get viewMode; BudgetDateRange get dateRange;
/// Create a copy of BudgetBookState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BudgetBookStateCopyWith<BudgetBookState> get copyWith => _$BudgetBookStateCopyWithImpl<BudgetBookState>(this as BudgetBookState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BudgetBookState&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.viewMode, viewMode) || other.viewMode == viewMode)&&(identical(other.dateRange, dateRange) || other.dateRange == dateRange));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),filter,viewMode,dateRange);



}

/// @nodoc
abstract mixin class $BudgetBookStateCopyWith<$Res>  {
  factory $BudgetBookStateCopyWith(BudgetBookState value, $Res Function(BudgetBookState) _then) = _$BudgetBookStateCopyWithImpl;
@useResult
$Res call({
 List<BudgetViewData> items, BudgetBookFilter filter, BudgetViewMode viewMode, BudgetDateRange dateRange
});


$BudgetBookFilterCopyWith<$Res> get filter;$BudgetDateRangeCopyWith<$Res> get dateRange;

}
/// @nodoc
class _$BudgetBookStateCopyWithImpl<$Res>
    implements $BudgetBookStateCopyWith<$Res> {
  _$BudgetBookStateCopyWithImpl(this._self, this._then);

  final BudgetBookState _self;
  final $Res Function(BudgetBookState) _then;

/// Create a copy of BudgetBookState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? filter = null,Object? viewMode = null,Object? dateRange = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<BudgetViewData>,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as BudgetBookFilter,viewMode: null == viewMode ? _self.viewMode : viewMode // ignore: cast_nullable_to_non_nullable
as BudgetViewMode,dateRange: null == dateRange ? _self.dateRange : dateRange // ignore: cast_nullable_to_non_nullable
as BudgetDateRange,
  ));
}
/// Create a copy of BudgetBookState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BudgetBookFilterCopyWith<$Res> get filter {
  
  return $BudgetBookFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}/// Create a copy of BudgetBookState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BudgetDateRangeCopyWith<$Res> get dateRange {
  
  return $BudgetDateRangeCopyWith<$Res>(_self.dateRange, (value) {
    return _then(_self.copyWith(dateRange: value));
  });
}
}


/// Adds pattern-matching-related methods to [BudgetBookState].
extension BudgetBookStatePatterns on BudgetBookState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<BudgetViewData> items,  BudgetBookFilter filter,  BudgetViewMode viewMode,  BudgetDateRange dateRange)?  initial,TResult Function( List<BudgetViewData> items,  BudgetBookFilter filter,  BudgetViewMode viewMode,  BudgetDateRange dateRange)?  loading,TResult Function( List<BudgetViewData> items,  BudgetBookFilter filter,  BudgetViewMode viewMode,  BudgetDateRange dateRange,  bool isInitial)?  loaded,TResult Function( List<BudgetViewData> items,  BudgetBookFilter filter,  BudgetViewMode viewMode,  BudgetDateRange dateRange,  AppError error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.items,_that.filter,_that.viewMode,_that.dateRange);case _Loading() when loading != null:
return loading(_that.items,_that.filter,_that.viewMode,_that.dateRange);case _Loaded() when loaded != null:
return loaded(_that.items,_that.filter,_that.viewMode,_that.dateRange,_that.isInitial);case _Error() when error != null:
return error(_that.items,_that.filter,_that.viewMode,_that.dateRange,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<BudgetViewData> items,  BudgetBookFilter filter,  BudgetViewMode viewMode,  BudgetDateRange dateRange)  initial,required TResult Function( List<BudgetViewData> items,  BudgetBookFilter filter,  BudgetViewMode viewMode,  BudgetDateRange dateRange)  loading,required TResult Function( List<BudgetViewData> items,  BudgetBookFilter filter,  BudgetViewMode viewMode,  BudgetDateRange dateRange,  bool isInitial)  loaded,required TResult Function( List<BudgetViewData> items,  BudgetBookFilter filter,  BudgetViewMode viewMode,  BudgetDateRange dateRange,  AppError error)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial(_that.items,_that.filter,_that.viewMode,_that.dateRange);case _Loading():
return loading(_that.items,_that.filter,_that.viewMode,_that.dateRange);case _Loaded():
return loaded(_that.items,_that.filter,_that.viewMode,_that.dateRange,_that.isInitial);case _Error():
return error(_that.items,_that.filter,_that.viewMode,_that.dateRange,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<BudgetViewData> items,  BudgetBookFilter filter,  BudgetViewMode viewMode,  BudgetDateRange dateRange)?  initial,TResult? Function( List<BudgetViewData> items,  BudgetBookFilter filter,  BudgetViewMode viewMode,  BudgetDateRange dateRange)?  loading,TResult? Function( List<BudgetViewData> items,  BudgetBookFilter filter,  BudgetViewMode viewMode,  BudgetDateRange dateRange,  bool isInitial)?  loaded,TResult? Function( List<BudgetViewData> items,  BudgetBookFilter filter,  BudgetViewMode viewMode,  BudgetDateRange dateRange,  AppError error)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.items,_that.filter,_that.viewMode,_that.dateRange);case _Loading() when loading != null:
return loading(_that.items,_that.filter,_that.viewMode,_that.dateRange);case _Loaded() when loaded != null:
return loaded(_that.items,_that.filter,_that.viewMode,_that.dateRange,_that.isInitial);case _Error() when error != null:
return error(_that.items,_that.filter,_that.viewMode,_that.dateRange,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements BudgetBookState {
   _Initial({final  List<BudgetViewData> items = const [], required this.filter, this.viewMode = BudgetViewMode.summary, required this.dateRange}): _items = items;
  

 final  List<BudgetViewData> _items;
@override@JsonKey() List<BudgetViewData> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  BudgetBookFilter filter;
@override@JsonKey() final  BudgetViewMode viewMode;
@override final  BudgetDateRange dateRange;

/// Create a copy of BudgetBookState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.viewMode, viewMode) || other.viewMode == viewMode)&&(identical(other.dateRange, dateRange) || other.dateRange == dateRange));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),filter,viewMode,dateRange);



}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $BudgetBookStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 List<BudgetViewData> items, BudgetBookFilter filter, BudgetViewMode viewMode, BudgetDateRange dateRange
});


@override $BudgetBookFilterCopyWith<$Res> get filter;@override $BudgetDateRangeCopyWith<$Res> get dateRange;

}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of BudgetBookState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? filter = null,Object? viewMode = null,Object? dateRange = null,}) {
  return _then(_Initial(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<BudgetViewData>,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as BudgetBookFilter,viewMode: null == viewMode ? _self.viewMode : viewMode // ignore: cast_nullable_to_non_nullable
as BudgetViewMode,dateRange: null == dateRange ? _self.dateRange : dateRange // ignore: cast_nullable_to_non_nullable
as BudgetDateRange,
  ));
}

/// Create a copy of BudgetBookState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BudgetBookFilterCopyWith<$Res> get filter {
  
  return $BudgetBookFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}/// Create a copy of BudgetBookState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BudgetDateRangeCopyWith<$Res> get dateRange {
  
  return $BudgetDateRangeCopyWith<$Res>(_self.dateRange, (value) {
    return _then(_self.copyWith(dateRange: value));
  });
}
}

/// @nodoc


class _Loading implements BudgetBookState {
  const _Loading({required final  List<BudgetViewData> items, required this.filter, required this.viewMode, required this.dateRange}): _items = items;
  

 final  List<BudgetViewData> _items;
@override List<BudgetViewData> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  BudgetBookFilter filter;
@override final  BudgetViewMode viewMode;
@override final  BudgetDateRange dateRange;

/// Create a copy of BudgetBookState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingCopyWith<_Loading> get copyWith => __$LoadingCopyWithImpl<_Loading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.viewMode, viewMode) || other.viewMode == viewMode)&&(identical(other.dateRange, dateRange) || other.dateRange == dateRange));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),filter,viewMode,dateRange);



}

/// @nodoc
abstract mixin class _$LoadingCopyWith<$Res> implements $BudgetBookStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) _then) = __$LoadingCopyWithImpl;
@override @useResult
$Res call({
 List<BudgetViewData> items, BudgetBookFilter filter, BudgetViewMode viewMode, BudgetDateRange dateRange
});


@override $BudgetBookFilterCopyWith<$Res> get filter;@override $BudgetDateRangeCopyWith<$Res> get dateRange;

}
/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(this._self, this._then);

  final _Loading _self;
  final $Res Function(_Loading) _then;

/// Create a copy of BudgetBookState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? filter = null,Object? viewMode = null,Object? dateRange = null,}) {
  return _then(_Loading(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<BudgetViewData>,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as BudgetBookFilter,viewMode: null == viewMode ? _self.viewMode : viewMode // ignore: cast_nullable_to_non_nullable
as BudgetViewMode,dateRange: null == dateRange ? _self.dateRange : dateRange // ignore: cast_nullable_to_non_nullable
as BudgetDateRange,
  ));
}

/// Create a copy of BudgetBookState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BudgetBookFilterCopyWith<$Res> get filter {
  
  return $BudgetBookFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}/// Create a copy of BudgetBookState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BudgetDateRangeCopyWith<$Res> get dateRange {
  
  return $BudgetDateRangeCopyWith<$Res>(_self.dateRange, (value) {
    return _then(_self.copyWith(dateRange: value));
  });
}
}

/// @nodoc


class _Loaded implements BudgetBookState {
  const _Loaded({required final  List<BudgetViewData> items, required this.filter, required this.viewMode, required this.dateRange, required this.isInitial}): _items = items;
  

 final  List<BudgetViewData> _items;
@override List<BudgetViewData> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  BudgetBookFilter filter;
@override final  BudgetViewMode viewMode;
@override final  BudgetDateRange dateRange;
 final  bool isInitial;

/// Create a copy of BudgetBookState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.viewMode, viewMode) || other.viewMode == viewMode)&&(identical(other.dateRange, dateRange) || other.dateRange == dateRange)&&(identical(other.isInitial, isInitial) || other.isInitial == isInitial));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),filter,viewMode,dateRange,isInitial);



}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $BudgetBookStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@override @useResult
$Res call({
 List<BudgetViewData> items, BudgetBookFilter filter, BudgetViewMode viewMode, BudgetDateRange dateRange, bool isInitial
});


@override $BudgetBookFilterCopyWith<$Res> get filter;@override $BudgetDateRangeCopyWith<$Res> get dateRange;

}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of BudgetBookState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? filter = null,Object? viewMode = null,Object? dateRange = null,Object? isInitial = null,}) {
  return _then(_Loaded(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<BudgetViewData>,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as BudgetBookFilter,viewMode: null == viewMode ? _self.viewMode : viewMode // ignore: cast_nullable_to_non_nullable
as BudgetViewMode,dateRange: null == dateRange ? _self.dateRange : dateRange // ignore: cast_nullable_to_non_nullable
as BudgetDateRange,isInitial: null == isInitial ? _self.isInitial : isInitial // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of BudgetBookState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BudgetBookFilterCopyWith<$Res> get filter {
  
  return $BudgetBookFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}/// Create a copy of BudgetBookState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BudgetDateRangeCopyWith<$Res> get dateRange {
  
  return $BudgetDateRangeCopyWith<$Res>(_self.dateRange, (value) {
    return _then(_self.copyWith(dateRange: value));
  });
}
}

/// @nodoc


class _Error implements BudgetBookState {
  const _Error({required final  List<BudgetViewData> items, required this.filter, required this.viewMode, required this.dateRange, required this.error}): _items = items;
  

 final  List<BudgetViewData> _items;
@override List<BudgetViewData> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  BudgetBookFilter filter;
@override final  BudgetViewMode viewMode;
@override final  BudgetDateRange dateRange;
 final  AppError error;

/// Create a copy of BudgetBookState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.viewMode, viewMode) || other.viewMode == viewMode)&&(identical(other.dateRange, dateRange) || other.dateRange == dateRange)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),filter,viewMode,dateRange,error);



}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $BudgetBookStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@override @useResult
$Res call({
 List<BudgetViewData> items, BudgetBookFilter filter, BudgetViewMode viewMode, BudgetDateRange dateRange, AppError error
});


@override $BudgetBookFilterCopyWith<$Res> get filter;@override $BudgetDateRangeCopyWith<$Res> get dateRange;

}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of BudgetBookState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? filter = null,Object? viewMode = null,Object? dateRange = null,Object? error = null,}) {
  return _then(_Error(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<BudgetViewData>,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as BudgetBookFilter,viewMode: null == viewMode ? _self.viewMode : viewMode // ignore: cast_nullable_to_non_nullable
as BudgetViewMode,dateRange: null == dateRange ? _self.dateRange : dateRange // ignore: cast_nullable_to_non_nullable
as BudgetDateRange,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppError,
  ));
}

/// Create a copy of BudgetBookState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BudgetBookFilterCopyWith<$Res> get filter {
  
  return $BudgetBookFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}/// Create a copy of BudgetBookState
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
