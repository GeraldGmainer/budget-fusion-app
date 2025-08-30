// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offline_first_queue_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OfflineFirstQueueState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfflineFirstQueueState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OfflineFirstQueueState()';
}


}

/// @nodoc
class $OfflineFirstQueueStateCopyWith<$Res>  {
$OfflineFirstQueueStateCopyWith(OfflineFirstQueueState _, $Res Function(OfflineFirstQueueState) __);
}


/// Adds pattern-matching-related methods to [OfflineFirstQueueState].
extension OfflineFirstQueueStatePatterns on OfflineFirstQueueState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<QueueItem> items,  List<QueueLogEntry> logs)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.items,_that.logs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<QueueItem> items,  List<QueueLogEntry> logs)  loaded,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.items,_that.logs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<QueueItem> items,  List<QueueLogEntry> logs)?  loaded,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.items,_that.logs);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements OfflineFirstQueueState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OfflineFirstQueueState.initial()';
}


}




/// @nodoc


class _Loading implements OfflineFirstQueueState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OfflineFirstQueueState.loading()';
}


}




/// @nodoc


class _Loaded implements OfflineFirstQueueState {
  const _Loaded({required final  List<QueueItem> items, required final  List<QueueLogEntry> logs}): _items = items,_logs = logs;
  

 final  List<QueueItem> _items;
 List<QueueItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  List<QueueLogEntry> _logs;
 List<QueueLogEntry> get logs {
  if (_logs is EqualUnmodifiableListView) return _logs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_logs);
}


/// Create a copy of OfflineFirstQueueState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._logs, _logs));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_logs));

@override
String toString() {
  return 'OfflineFirstQueueState.loaded(items: $items, logs: $logs)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $OfflineFirstQueueStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<QueueItem> items, List<QueueLogEntry> logs
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of OfflineFirstQueueState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? items = null,Object? logs = null,}) {
  return _then(_Loaded(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<QueueItem>,logs: null == logs ? _self._logs : logs // ignore: cast_nullable_to_non_nullable
as List<QueueLogEntry>,
  ));
}


}

// dart format on
