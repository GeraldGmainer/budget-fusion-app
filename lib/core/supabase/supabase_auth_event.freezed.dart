// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supabase_auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SupabaseAuthEvent {

 SupabaseAuthType get type; sb.Session? get session; String? get message;
/// Create a copy of SupabaseAuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupabaseAuthEventCopyWith<SupabaseAuthEvent> get copyWith => _$SupabaseAuthEventCopyWithImpl<SupabaseAuthEvent>(this as SupabaseAuthEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupabaseAuthEvent&&(identical(other.type, type) || other.type == type)&&(identical(other.session, session) || other.session == session)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,type,session,message);

@override
String toString() {
  return 'SupabaseAuthEvent(type: $type, session: $session, message: $message)';
}


}

/// @nodoc
abstract mixin class $SupabaseAuthEventCopyWith<$Res>  {
  factory $SupabaseAuthEventCopyWith(SupabaseAuthEvent value, $Res Function(SupabaseAuthEvent) _then) = _$SupabaseAuthEventCopyWithImpl;
@useResult
$Res call({
 SupabaseAuthType type, sb.Session? session, String? message
});




}
/// @nodoc
class _$SupabaseAuthEventCopyWithImpl<$Res>
    implements $SupabaseAuthEventCopyWith<$Res> {
  _$SupabaseAuthEventCopyWithImpl(this._self, this._then);

  final SupabaseAuthEvent _self;
  final $Res Function(SupabaseAuthEvent) _then;

/// Create a copy of SupabaseAuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? session = freezed,Object? message = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SupabaseAuthType,session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as sb.Session?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SupabaseAuthEvent].
extension SupabaseAuthEventPatterns on SupabaseAuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupabaseAuthEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupabaseAuthEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupabaseAuthEvent value)  $default,){
final _that = this;
switch (_that) {
case _SupabaseAuthEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupabaseAuthEvent value)?  $default,){
final _that = this;
switch (_that) {
case _SupabaseAuthEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SupabaseAuthType type,  sb.Session? session,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupabaseAuthEvent() when $default != null:
return $default(_that.type,_that.session,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SupabaseAuthType type,  sb.Session? session,  String? message)  $default,) {final _that = this;
switch (_that) {
case _SupabaseAuthEvent():
return $default(_that.type,_that.session,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SupabaseAuthType type,  sb.Session? session,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _SupabaseAuthEvent() when $default != null:
return $default(_that.type,_that.session,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _SupabaseAuthEvent implements SupabaseAuthEvent {
  const _SupabaseAuthEvent({required this.type, this.session, this.message});
  

@override final  SupabaseAuthType type;
@override final  sb.Session? session;
@override final  String? message;

/// Create a copy of SupabaseAuthEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupabaseAuthEventCopyWith<_SupabaseAuthEvent> get copyWith => __$SupabaseAuthEventCopyWithImpl<_SupabaseAuthEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupabaseAuthEvent&&(identical(other.type, type) || other.type == type)&&(identical(other.session, session) || other.session == session)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,type,session,message);

@override
String toString() {
  return 'SupabaseAuthEvent(type: $type, session: $session, message: $message)';
}


}

/// @nodoc
abstract mixin class _$SupabaseAuthEventCopyWith<$Res> implements $SupabaseAuthEventCopyWith<$Res> {
  factory _$SupabaseAuthEventCopyWith(_SupabaseAuthEvent value, $Res Function(_SupabaseAuthEvent) _then) = __$SupabaseAuthEventCopyWithImpl;
@override @useResult
$Res call({
 SupabaseAuthType type, sb.Session? session, String? message
});




}
/// @nodoc
class __$SupabaseAuthEventCopyWithImpl<$Res>
    implements _$SupabaseAuthEventCopyWith<$Res> {
  __$SupabaseAuthEventCopyWithImpl(this._self, this._then);

  final _SupabaseAuthEvent _self;
  final $Res Function(_SupabaseAuthEvent) _then;

/// Create a copy of SupabaseAuthEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? session = freezed,Object? message = freezed,}) {
  return _then(_SupabaseAuthEvent(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SupabaseAuthType,session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as sb.Session?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
