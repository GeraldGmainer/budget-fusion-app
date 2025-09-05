// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supabase_auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SupabaseAuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupabaseAuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SupabaseAuthState()';
}


}

/// @nodoc
class $SupabaseAuthStateCopyWith<$Res>  {
$SupabaseAuthStateCopyWith(SupabaseAuthState _, $Res Function(SupabaseAuthState) __);
}


/// Adds pattern-matching-related methods to [SupabaseAuthState].
extension SupabaseAuthStatePatterns on SupabaseAuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( AuthUnauthenticated value)?  unauthenticated,TResult Function( AuthAuthenticated value)?  authenticated,TResult Function( AuthPasswordRecovery value)?  passwordRecovery,TResult Function( AuthTokenRefreshed value)?  tokenRefreshed,TResult Function( AuthError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case AuthUnauthenticated() when unauthenticated != null:
return unauthenticated(_that);case AuthAuthenticated() when authenticated != null:
return authenticated(_that);case AuthPasswordRecovery() when passwordRecovery != null:
return passwordRecovery(_that);case AuthTokenRefreshed() when tokenRefreshed != null:
return tokenRefreshed(_that);case AuthError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( AuthUnauthenticated value)  unauthenticated,required TResult Function( AuthAuthenticated value)  authenticated,required TResult Function( AuthPasswordRecovery value)  passwordRecovery,required TResult Function( AuthTokenRefreshed value)  tokenRefreshed,required TResult Function( AuthError value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case AuthUnauthenticated():
return unauthenticated(_that);case AuthAuthenticated():
return authenticated(_that);case AuthPasswordRecovery():
return passwordRecovery(_that);case AuthTokenRefreshed():
return tokenRefreshed(_that);case AuthError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( AuthUnauthenticated value)?  unauthenticated,TResult? Function( AuthAuthenticated value)?  authenticated,TResult? Function( AuthPasswordRecovery value)?  passwordRecovery,TResult? Function( AuthTokenRefreshed value)?  tokenRefreshed,TResult? Function( AuthError value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case AuthUnauthenticated() when unauthenticated != null:
return unauthenticated(_that);case AuthAuthenticated() when authenticated != null:
return authenticated(_that);case AuthPasswordRecovery() when passwordRecovery != null:
return passwordRecovery(_that);case AuthTokenRefreshed() when tokenRefreshed != null:
return tokenRefreshed(_that);case AuthError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  unauthenticated,TResult Function( sb.Session session)?  authenticated,TResult Function( sb.Session session)?  passwordRecovery,TResult Function( sb.Session session)?  tokenRefreshed,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case AuthUnauthenticated() when unauthenticated != null:
return unauthenticated();case AuthAuthenticated() when authenticated != null:
return authenticated(_that.session);case AuthPasswordRecovery() when passwordRecovery != null:
return passwordRecovery(_that.session);case AuthTokenRefreshed() when tokenRefreshed != null:
return tokenRefreshed(_that.session);case AuthError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  unauthenticated,required TResult Function( sb.Session session)  authenticated,required TResult Function( sb.Session session)  passwordRecovery,required TResult Function( sb.Session session)  tokenRefreshed,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case AuthUnauthenticated():
return unauthenticated();case AuthAuthenticated():
return authenticated(_that.session);case AuthPasswordRecovery():
return passwordRecovery(_that.session);case AuthTokenRefreshed():
return tokenRefreshed(_that.session);case AuthError():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  unauthenticated,TResult? Function( sb.Session session)?  authenticated,TResult? Function( sb.Session session)?  passwordRecovery,TResult? Function( sb.Session session)?  tokenRefreshed,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case AuthUnauthenticated() when unauthenticated != null:
return unauthenticated();case AuthAuthenticated() when authenticated != null:
return authenticated(_that.session);case AuthPasswordRecovery() when passwordRecovery != null:
return passwordRecovery(_that.session);case AuthTokenRefreshed() when tokenRefreshed != null:
return tokenRefreshed(_that.session);case AuthError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements SupabaseAuthState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SupabaseAuthState.initial()';
}


}




/// @nodoc


class AuthUnauthenticated implements SupabaseAuthState {
  const AuthUnauthenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthUnauthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SupabaseAuthState.unauthenticated()';
}


}




/// @nodoc


class AuthAuthenticated implements SupabaseAuthState {
  const AuthAuthenticated(this.session);
  

 final  sb.Session session;

/// Create a copy of SupabaseAuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthAuthenticatedCopyWith<AuthAuthenticated> get copyWith => _$AuthAuthenticatedCopyWithImpl<AuthAuthenticated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthAuthenticated&&(identical(other.session, session) || other.session == session));
}


@override
int get hashCode => Object.hash(runtimeType,session);

@override
String toString() {
  return 'SupabaseAuthState.authenticated(session: $session)';
}


}

/// @nodoc
abstract mixin class $AuthAuthenticatedCopyWith<$Res> implements $SupabaseAuthStateCopyWith<$Res> {
  factory $AuthAuthenticatedCopyWith(AuthAuthenticated value, $Res Function(AuthAuthenticated) _then) = _$AuthAuthenticatedCopyWithImpl;
@useResult
$Res call({
 sb.Session session
});




}
/// @nodoc
class _$AuthAuthenticatedCopyWithImpl<$Res>
    implements $AuthAuthenticatedCopyWith<$Res> {
  _$AuthAuthenticatedCopyWithImpl(this._self, this._then);

  final AuthAuthenticated _self;
  final $Res Function(AuthAuthenticated) _then;

/// Create a copy of SupabaseAuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? session = null,}) {
  return _then(AuthAuthenticated(
null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as sb.Session,
  ));
}


}

/// @nodoc


class AuthPasswordRecovery implements SupabaseAuthState {
  const AuthPasswordRecovery(this.session);
  

 final  sb.Session session;

/// Create a copy of SupabaseAuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthPasswordRecoveryCopyWith<AuthPasswordRecovery> get copyWith => _$AuthPasswordRecoveryCopyWithImpl<AuthPasswordRecovery>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthPasswordRecovery&&(identical(other.session, session) || other.session == session));
}


@override
int get hashCode => Object.hash(runtimeType,session);

@override
String toString() {
  return 'SupabaseAuthState.passwordRecovery(session: $session)';
}


}

/// @nodoc
abstract mixin class $AuthPasswordRecoveryCopyWith<$Res> implements $SupabaseAuthStateCopyWith<$Res> {
  factory $AuthPasswordRecoveryCopyWith(AuthPasswordRecovery value, $Res Function(AuthPasswordRecovery) _then) = _$AuthPasswordRecoveryCopyWithImpl;
@useResult
$Res call({
 sb.Session session
});




}
/// @nodoc
class _$AuthPasswordRecoveryCopyWithImpl<$Res>
    implements $AuthPasswordRecoveryCopyWith<$Res> {
  _$AuthPasswordRecoveryCopyWithImpl(this._self, this._then);

  final AuthPasswordRecovery _self;
  final $Res Function(AuthPasswordRecovery) _then;

/// Create a copy of SupabaseAuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? session = null,}) {
  return _then(AuthPasswordRecovery(
null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as sb.Session,
  ));
}


}

/// @nodoc


class AuthTokenRefreshed implements SupabaseAuthState {
  const AuthTokenRefreshed(this.session);
  

 final  sb.Session session;

/// Create a copy of SupabaseAuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthTokenRefreshedCopyWith<AuthTokenRefreshed> get copyWith => _$AuthTokenRefreshedCopyWithImpl<AuthTokenRefreshed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthTokenRefreshed&&(identical(other.session, session) || other.session == session));
}


@override
int get hashCode => Object.hash(runtimeType,session);

@override
String toString() {
  return 'SupabaseAuthState.tokenRefreshed(session: $session)';
}


}

/// @nodoc
abstract mixin class $AuthTokenRefreshedCopyWith<$Res> implements $SupabaseAuthStateCopyWith<$Res> {
  factory $AuthTokenRefreshedCopyWith(AuthTokenRefreshed value, $Res Function(AuthTokenRefreshed) _then) = _$AuthTokenRefreshedCopyWithImpl;
@useResult
$Res call({
 sb.Session session
});




}
/// @nodoc
class _$AuthTokenRefreshedCopyWithImpl<$Res>
    implements $AuthTokenRefreshedCopyWith<$Res> {
  _$AuthTokenRefreshedCopyWithImpl(this._self, this._then);

  final AuthTokenRefreshed _self;
  final $Res Function(AuthTokenRefreshed) _then;

/// Create a copy of SupabaseAuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? session = null,}) {
  return _then(AuthTokenRefreshed(
null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as sb.Session,
  ));
}


}

/// @nodoc


class AuthError implements SupabaseAuthState {
  const AuthError(this.message);
  

 final  String message;

/// Create a copy of SupabaseAuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthErrorCopyWith<AuthError> get copyWith => _$AuthErrorCopyWithImpl<AuthError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SupabaseAuthState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $AuthErrorCopyWith<$Res> implements $SupabaseAuthStateCopyWith<$Res> {
  factory $AuthErrorCopyWith(AuthError value, $Res Function(AuthError) _then) = _$AuthErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AuthErrorCopyWithImpl<$Res>
    implements $AuthErrorCopyWith<$Res> {
  _$AuthErrorCopyWithImpl(this._self, this._then);

  final AuthError _self;
  final $Res Function(AuthError) _then;

/// Create a copy of SupabaseAuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AuthError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
