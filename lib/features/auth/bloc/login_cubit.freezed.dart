// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState()';
}


}

/// @nodoc
class $LoginStateCopyWith<$Res>  {
$LoginStateCopyWith(LoginState _, $Res Function(LoginState) __);
}


/// Adds pattern-matching-related methods to [LoginState].
extension LoginStatePatterns on LoginState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( LoginLoadingState value)?  loading,TResult Function( LoginSuccessState value)?  success,TResult Function( LoginErrorState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case LoginLoadingState() when loading != null:
return loading(_that);case LoginSuccessState() when success != null:
return success(_that);case LoginErrorState() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( LoginLoadingState value)  loading,required TResult Function( LoginSuccessState value)  success,required TResult Function( LoginErrorState value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case LoginLoadingState():
return loading(_that);case LoginSuccessState():
return success(_that);case LoginErrorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( LoginLoadingState value)?  loading,TResult? Function( LoginSuccessState value)?  success,TResult? Function( LoginErrorState value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case LoginLoadingState() when loading != null:
return loading(_that);case LoginSuccessState() when success != null:
return success(_that);case LoginErrorState() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( User user)?  success,TResult Function( AppError error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case LoginLoadingState() when loading != null:
return loading();case LoginSuccessState() when success != null:
return success(_that.user);case LoginErrorState() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( User user)  success,required TResult Function( AppError error)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case LoginLoadingState():
return loading();case LoginSuccessState():
return success(_that.user);case LoginErrorState():
return error(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( User user)?  success,TResult? Function( AppError error)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case LoginLoadingState() when loading != null:
return loading();case LoginSuccessState() when success != null:
return success(_that.user);case LoginErrorState() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements LoginState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.initial()';
}


}




/// @nodoc


class LoginLoadingState implements LoginState {
  const LoginLoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.loading()';
}


}




/// @nodoc


class LoginSuccessState implements LoginState {
  const LoginSuccessState(this.user);
  

 final  User user;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginSuccessStateCopyWith<LoginSuccessState> get copyWith => _$LoginSuccessStateCopyWithImpl<LoginSuccessState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginSuccessState&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'LoginState.success(user: $user)';
}


}

/// @nodoc
abstract mixin class $LoginSuccessStateCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $LoginSuccessStateCopyWith(LoginSuccessState value, $Res Function(LoginSuccessState) _then) = _$LoginSuccessStateCopyWithImpl;
@useResult
$Res call({
 User user
});




}
/// @nodoc
class _$LoginSuccessStateCopyWithImpl<$Res>
    implements $LoginSuccessStateCopyWith<$Res> {
  _$LoginSuccessStateCopyWithImpl(this._self, this._then);

  final LoginSuccessState _self;
  final $Res Function(LoginSuccessState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(LoginSuccessState(
null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}


}

/// @nodoc


class LoginErrorState implements LoginState {
  const LoginErrorState(this.error);
  

 final  AppError error;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginErrorStateCopyWith<LoginErrorState> get copyWith => _$LoginErrorStateCopyWithImpl<LoginErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginErrorState&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'LoginState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $LoginErrorStateCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $LoginErrorStateCopyWith(LoginErrorState value, $Res Function(LoginErrorState) _then) = _$LoginErrorStateCopyWithImpl;
@useResult
$Res call({
 AppError error
});




}
/// @nodoc
class _$LoginErrorStateCopyWithImpl<$Res>
    implements $LoginErrorStateCopyWith<$Res> {
  _$LoginErrorStateCopyWithImpl(this._self, this._then);

  final LoginErrorState _self;
  final $Res Function(LoginErrorState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(LoginErrorState(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppError,
  ));
}


}

// dart format on
