// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entity_meta_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EntityMetaState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EntityMetaState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EntityMetaState()';
}


}

/// @nodoc
class $EntityMetaStateCopyWith<$Res>  {
$EntityMetaStateCopyWith(EntityMetaState _, $Res Function(EntityMetaState) __);
}


/// Adds pattern-matching-related methods to [EntityMetaState].
extension EntityMetaStatePatterns on EntityMetaState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Loading value)?  loading,TResult Function( _Created value)?  created,TResult Function( _Upserted value)?  upserted,TResult Function( _Deleted value)?  deleted,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _Created() when created != null:
return created(_that);case _Upserted() when upserted != null:
return upserted(_that);case _Deleted() when deleted != null:
return deleted(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Loading value)  loading,required TResult Function( _Created value)  created,required TResult Function( _Upserted value)  upserted,required TResult Function( _Deleted value)  deleted,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Loading():
return loading(_that);case _Created():
return created(_that);case _Upserted():
return upserted(_that);case _Deleted():
return deleted(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Loading value)?  loading,TResult? Function( _Created value)?  created,TResult? Function( _Upserted value)?  upserted,TResult? Function( _Deleted value)?  deleted,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _Created() when created != null:
return created(_that);case _Upserted() when upserted != null:
return upserted(_that);case _Deleted() when deleted != null:
return deleted(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function()?  created,TResult Function( EntityMeta meta)?  upserted,TResult Function()?  deleted,TResult Function( String message,  QueueTaskType taskType)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case _Created() when created != null:
return created();case _Upserted() when upserted != null:
return upserted(_that.meta);case _Deleted() when deleted != null:
return deleted();case _Error() when error != null:
return error(_that.message,_that.taskType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function()  created,required TResult Function( EntityMeta meta)  upserted,required TResult Function()  deleted,required TResult Function( String message,  QueueTaskType taskType)  error,}) {final _that = this;
switch (_that) {
case _Loading():
return loading();case _Created():
return created();case _Upserted():
return upserted(_that.meta);case _Deleted():
return deleted();case _Error():
return error(_that.message,_that.taskType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function()?  created,TResult? Function( EntityMeta meta)?  upserted,TResult? Function()?  deleted,TResult? Function( String message,  QueueTaskType taskType)?  error,}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case _Created() when created != null:
return created();case _Upserted() when upserted != null:
return upserted(_that.meta);case _Deleted() when deleted != null:
return deleted();case _Error() when error != null:
return error(_that.message,_that.taskType);case _:
  return null;

}
}

}

/// @nodoc


class _Loading implements EntityMetaState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EntityMetaState.loading()';
}


}




/// @nodoc


class _Created implements EntityMetaState {
  const _Created();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Created);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EntityMetaState.created()';
}


}




/// @nodoc


class _Upserted implements EntityMetaState {
  const _Upserted(this.meta);
  

 final  EntityMeta meta;

/// Create a copy of EntityMetaState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpsertedCopyWith<_Upserted> get copyWith => __$UpsertedCopyWithImpl<_Upserted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Upserted&&(identical(other.meta, meta) || other.meta == meta));
}


@override
int get hashCode => Object.hash(runtimeType,meta);

@override
String toString() {
  return 'EntityMetaState.upserted(meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$UpsertedCopyWith<$Res> implements $EntityMetaStateCopyWith<$Res> {
  factory _$UpsertedCopyWith(_Upserted value, $Res Function(_Upserted) _then) = __$UpsertedCopyWithImpl;
@useResult
$Res call({
 EntityMeta meta
});


$EntityMetaCopyWith<$Res> get meta;

}
/// @nodoc
class __$UpsertedCopyWithImpl<$Res>
    implements _$UpsertedCopyWith<$Res> {
  __$UpsertedCopyWithImpl(this._self, this._then);

  final _Upserted _self;
  final $Res Function(_Upserted) _then;

/// Create a copy of EntityMetaState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? meta = null,}) {
  return _then(_Upserted(
null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as EntityMeta,
  ));
}

/// Create a copy of EntityMetaState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EntityMetaCopyWith<$Res> get meta {
  
  return $EntityMetaCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}

/// @nodoc


class _Deleted implements EntityMetaState {
  const _Deleted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Deleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EntityMetaState.deleted()';
}


}




/// @nodoc


class _Error implements EntityMetaState {
  const _Error({required this.message, required this.taskType});
  

 final  String message;
 final  QueueTaskType taskType;

/// Create a copy of EntityMetaState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message)&&(identical(other.taskType, taskType) || other.taskType == taskType));
}


@override
int get hashCode => Object.hash(runtimeType,message,taskType);

@override
String toString() {
  return 'EntityMetaState.error(message: $message, taskType: $taskType)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $EntityMetaStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message, QueueTaskType taskType
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of EntityMetaState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? taskType = null,}) {
  return _then(_Error(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,taskType: null == taskType ? _self.taskType : taskType // ignore: cast_nullable_to_non_nullable
as QueueTaskType,
  ));
}


}

// dart format on
