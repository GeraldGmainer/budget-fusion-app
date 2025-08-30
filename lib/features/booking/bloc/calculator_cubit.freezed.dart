// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculator_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CalculatorState {

 List<String> get history; double get result;
/// Create a copy of CalculatorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalculatorStateCopyWith<CalculatorState> get copyWith => _$CalculatorStateCopyWithImpl<CalculatorState>(this as CalculatorState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalculatorState&&const DeepCollectionEquality().equals(other.history, history)&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(history),result);

@override
String toString() {
  return 'CalculatorState(history: $history, result: $result)';
}


}

/// @nodoc
abstract mixin class $CalculatorStateCopyWith<$Res>  {
  factory $CalculatorStateCopyWith(CalculatorState value, $Res Function(CalculatorState) _then) = _$CalculatorStateCopyWithImpl;
@useResult
$Res call({
 List<String> history, double result
});




}
/// @nodoc
class _$CalculatorStateCopyWithImpl<$Res>
    implements $CalculatorStateCopyWith<$Res> {
  _$CalculatorStateCopyWithImpl(this._self, this._then);

  final CalculatorState _self;
  final $Res Function(CalculatorState) _then;

/// Create a copy of CalculatorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? history = null,Object? result = null,}) {
  return _then(_self.copyWith(
history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as List<String>,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CalculatorState].
extension CalculatorStatePatterns on CalculatorState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Updated value)?  updated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Updated() when updated != null:
return updated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Updated value)  updated,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Updated():
return updated(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Updated value)?  updated,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Updated() when updated != null:
return updated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<String> history,  double result)?  initial,TResult Function( List<String> history,  double result)?  updated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.history,_that.result);case _Updated() when updated != null:
return updated(_that.history,_that.result);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<String> history,  double result)  initial,required TResult Function( List<String> history,  double result)  updated,}) {final _that = this;
switch (_that) {
case _Initial():
return initial(_that.history,_that.result);case _Updated():
return updated(_that.history,_that.result);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<String> history,  double result)?  initial,TResult? Function( List<String> history,  double result)?  updated,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that.history,_that.result);case _Updated() when updated != null:
return updated(_that.history,_that.result);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CalculatorState {
  const _Initial({final  List<String> history = const [], this.result = 0}): _history = history;
  

 final  List<String> _history;
@override@JsonKey() List<String> get history {
  if (_history is EqualUnmodifiableListView) return _history;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_history);
}

@override@JsonKey() final  double result;

/// Create a copy of CalculatorState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&const DeepCollectionEquality().equals(other._history, _history)&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_history),result);

@override
String toString() {
  return 'CalculatorState.initial(history: $history, result: $result)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $CalculatorStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 List<String> history, double result
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of CalculatorState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? history = null,Object? result = null,}) {
  return _then(_Initial(
history: null == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<String>,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class _Updated implements CalculatorState {
  const _Updated({required final  List<String> history, required this.result}): _history = history;
  

 final  List<String> _history;
@override List<String> get history {
  if (_history is EqualUnmodifiableListView) return _history;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_history);
}

@override final  double result;

/// Create a copy of CalculatorState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatedCopyWith<_Updated> get copyWith => __$UpdatedCopyWithImpl<_Updated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Updated&&const DeepCollectionEquality().equals(other._history, _history)&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_history),result);

@override
String toString() {
  return 'CalculatorState.updated(history: $history, result: $result)';
}


}

/// @nodoc
abstract mixin class _$UpdatedCopyWith<$Res> implements $CalculatorStateCopyWith<$Res> {
  factory _$UpdatedCopyWith(_Updated value, $Res Function(_Updated) _then) = __$UpdatedCopyWithImpl;
@override @useResult
$Res call({
 List<String> history, double result
});




}
/// @nodoc
class __$UpdatedCopyWithImpl<$Res>
    implements _$UpdatedCopyWith<$Res> {
  __$UpdatedCopyWithImpl(this._self, this._then);

  final _Updated _self;
  final $Res Function(_Updated) _then;

/// Create a copy of CalculatorState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? history = null,Object? result = null,}) {
  return _then(_Updated(
history: null == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<String>,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
