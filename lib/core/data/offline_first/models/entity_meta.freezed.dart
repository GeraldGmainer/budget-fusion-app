// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entity_meta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EntityMeta {

 DateTime? get createdAt; DateTime? get updatedAt; DateTime? get deletedAt; bool get isPending; bool get isPendingDelete; int get attempts;
/// Create a copy of EntityMeta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EntityMetaCopyWith<EntityMeta> get copyWith => _$EntityMetaCopyWithImpl<EntityMeta>(this as EntityMeta, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EntityMeta&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.isPending, isPending) || other.isPending == isPending)&&(identical(other.isPendingDelete, isPendingDelete) || other.isPendingDelete == isPendingDelete)&&(identical(other.attempts, attempts) || other.attempts == attempts));
}


@override
int get hashCode => Object.hash(runtimeType,createdAt,updatedAt,deletedAt,isPending,isPendingDelete,attempts);

@override
String toString() {
  return 'EntityMeta(createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, isPending: $isPending, isPendingDelete: $isPendingDelete, attempts: $attempts)';
}


}

/// @nodoc
abstract mixin class $EntityMetaCopyWith<$Res>  {
  factory $EntityMetaCopyWith(EntityMeta value, $Res Function(EntityMeta) _then) = _$EntityMetaCopyWithImpl;
@useResult
$Res call({
 DateTime? createdAt, DateTime? updatedAt, DateTime? deletedAt, bool isPending, bool isPendingDelete, int attempts
});




}
/// @nodoc
class _$EntityMetaCopyWithImpl<$Res>
    implements $EntityMetaCopyWith<$Res> {
  _$EntityMetaCopyWithImpl(this._self, this._then);

  final EntityMeta _self;
  final $Res Function(EntityMeta) _then;

/// Create a copy of EntityMeta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? isPending = null,Object? isPendingDelete = null,Object? attempts = null,}) {
  return _then(_self.copyWith(
createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isPending: null == isPending ? _self.isPending : isPending // ignore: cast_nullable_to_non_nullable
as bool,isPendingDelete: null == isPendingDelete ? _self.isPendingDelete : isPendingDelete // ignore: cast_nullable_to_non_nullable
as bool,attempts: null == attempts ? _self.attempts : attempts // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [EntityMeta].
extension EntityMetaPatterns on EntityMeta {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EntityMeta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EntityMeta() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EntityMeta value)  $default,){
final _that = this;
switch (_that) {
case _EntityMeta():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EntityMeta value)?  $default,){
final _that = this;
switch (_that) {
case _EntityMeta() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime? createdAt,  DateTime? updatedAt,  DateTime? deletedAt,  bool isPending,  bool isPendingDelete,  int attempts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EntityMeta() when $default != null:
return $default(_that.createdAt,_that.updatedAt,_that.deletedAt,_that.isPending,_that.isPendingDelete,_that.attempts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime? createdAt,  DateTime? updatedAt,  DateTime? deletedAt,  bool isPending,  bool isPendingDelete,  int attempts)  $default,) {final _that = this;
switch (_that) {
case _EntityMeta():
return $default(_that.createdAt,_that.updatedAt,_that.deletedAt,_that.isPending,_that.isPendingDelete,_that.attempts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime? createdAt,  DateTime? updatedAt,  DateTime? deletedAt,  bool isPending,  bool isPendingDelete,  int attempts)?  $default,) {final _that = this;
switch (_that) {
case _EntityMeta() when $default != null:
return $default(_that.createdAt,_that.updatedAt,_that.deletedAt,_that.isPending,_that.isPendingDelete,_that.attempts);case _:
  return null;

}
}

}

/// @nodoc


class _EntityMeta implements EntityMeta {
  const _EntityMeta({this.createdAt, this.updatedAt, this.deletedAt, this.isPending = false, this.isPendingDelete = false, this.attempts = 0});
  

@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
@override final  DateTime? deletedAt;
@override@JsonKey() final  bool isPending;
@override@JsonKey() final  bool isPendingDelete;
@override@JsonKey() final  int attempts;

/// Create a copy of EntityMeta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EntityMetaCopyWith<_EntityMeta> get copyWith => __$EntityMetaCopyWithImpl<_EntityMeta>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EntityMeta&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.isPending, isPending) || other.isPending == isPending)&&(identical(other.isPendingDelete, isPendingDelete) || other.isPendingDelete == isPendingDelete)&&(identical(other.attempts, attempts) || other.attempts == attempts));
}


@override
int get hashCode => Object.hash(runtimeType,createdAt,updatedAt,deletedAt,isPending,isPendingDelete,attempts);

@override
String toString() {
  return 'EntityMeta(createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, isPending: $isPending, isPendingDelete: $isPendingDelete, attempts: $attempts)';
}


}

/// @nodoc
abstract mixin class _$EntityMetaCopyWith<$Res> implements $EntityMetaCopyWith<$Res> {
  factory _$EntityMetaCopyWith(_EntityMeta value, $Res Function(_EntityMeta) _then) = __$EntityMetaCopyWithImpl;
@override @useResult
$Res call({
 DateTime? createdAt, DateTime? updatedAt, DateTime? deletedAt, bool isPending, bool isPendingDelete, int attempts
});




}
/// @nodoc
class __$EntityMetaCopyWithImpl<$Res>
    implements _$EntityMetaCopyWith<$Res> {
  __$EntityMetaCopyWithImpl(this._self, this._then);

  final _EntityMeta _self;
  final $Res Function(_EntityMeta) _then;

/// Create a copy of EntityMeta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? isPending = null,Object? isPendingDelete = null,Object? attempts = null,}) {
  return _then(_EntityMeta(
createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isPending: null == isPending ? _self.isPending : isPending // ignore: cast_nullable_to_non_nullable
as bool,isPendingDelete: null == isPendingDelete ? _self.isPendingDelete : isPendingDelete // ignore: cast_nullable_to_non_nullable
as bool,attempts: null == attempts ? _self.attempts : attempts // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
