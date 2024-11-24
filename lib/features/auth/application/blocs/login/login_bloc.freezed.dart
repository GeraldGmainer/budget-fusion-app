// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() googleLogin,
    required TResult Function(String email, String password) credentialsLogin,
    required TResult Function() logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? googleLogin,
    TResult? Function(String email, String password)? credentialsLogin,
    TResult? Function()? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? googleLogin,
    TResult Function(String email, String password)? credentialsLogin,
    TResult Function()? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitLoginEvent value) init,
    required TResult Function(GoogleLoginEvent value) googleLogin,
    required TResult Function(CredentialsLoginEvent value) credentialsLogin,
    required TResult Function(LogoutEvent value) logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitLoginEvent value)? init,
    TResult? Function(GoogleLoginEvent value)? googleLogin,
    TResult? Function(CredentialsLoginEvent value)? credentialsLogin,
    TResult? Function(LogoutEvent value)? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitLoginEvent value)? init,
    TResult Function(GoogleLoginEvent value)? googleLogin,
    TResult Function(CredentialsLoginEvent value)? credentialsLogin,
    TResult Function(LogoutEvent value)? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
          LoginEvent value, $Res Function(LoginEvent) then) =
      _$LoginEventCopyWithImpl<$Res, LoginEvent>;
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res, $Val extends LoginEvent>
    implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitLoginEventImplCopyWith<$Res> {
  factory _$$InitLoginEventImplCopyWith(_$InitLoginEventImpl value,
          $Res Function(_$InitLoginEventImpl) then) =
      __$$InitLoginEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitLoginEventImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$InitLoginEventImpl>
    implements _$$InitLoginEventImplCopyWith<$Res> {
  __$$InitLoginEventImplCopyWithImpl(
      _$InitLoginEventImpl _value, $Res Function(_$InitLoginEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitLoginEventImpl implements InitLoginEvent {
  const _$InitLoginEventImpl();

  @override
  String toString() {
    return 'LoginEvent.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitLoginEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() googleLogin,
    required TResult Function(String email, String password) credentialsLogin,
    required TResult Function() logout,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? googleLogin,
    TResult? Function(String email, String password)? credentialsLogin,
    TResult? Function()? logout,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? googleLogin,
    TResult Function(String email, String password)? credentialsLogin,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitLoginEvent value) init,
    required TResult Function(GoogleLoginEvent value) googleLogin,
    required TResult Function(CredentialsLoginEvent value) credentialsLogin,
    required TResult Function(LogoutEvent value) logout,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitLoginEvent value)? init,
    TResult? Function(GoogleLoginEvent value)? googleLogin,
    TResult? Function(CredentialsLoginEvent value)? credentialsLogin,
    TResult? Function(LogoutEvent value)? logout,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitLoginEvent value)? init,
    TResult Function(GoogleLoginEvent value)? googleLogin,
    TResult Function(CredentialsLoginEvent value)? credentialsLogin,
    TResult Function(LogoutEvent value)? logout,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class InitLoginEvent implements LoginEvent {
  const factory InitLoginEvent() = _$InitLoginEventImpl;
}

/// @nodoc
abstract class _$$GoogleLoginEventImplCopyWith<$Res> {
  factory _$$GoogleLoginEventImplCopyWith(_$GoogleLoginEventImpl value,
          $Res Function(_$GoogleLoginEventImpl) then) =
      __$$GoogleLoginEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GoogleLoginEventImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$GoogleLoginEventImpl>
    implements _$$GoogleLoginEventImplCopyWith<$Res> {
  __$$GoogleLoginEventImplCopyWithImpl(_$GoogleLoginEventImpl _value,
      $Res Function(_$GoogleLoginEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GoogleLoginEventImpl implements GoogleLoginEvent {
  const _$GoogleLoginEventImpl();

  @override
  String toString() {
    return 'LoginEvent.googleLogin()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GoogleLoginEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() googleLogin,
    required TResult Function(String email, String password) credentialsLogin,
    required TResult Function() logout,
  }) {
    return googleLogin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? googleLogin,
    TResult? Function(String email, String password)? credentialsLogin,
    TResult? Function()? logout,
  }) {
    return googleLogin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? googleLogin,
    TResult Function(String email, String password)? credentialsLogin,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (googleLogin != null) {
      return googleLogin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitLoginEvent value) init,
    required TResult Function(GoogleLoginEvent value) googleLogin,
    required TResult Function(CredentialsLoginEvent value) credentialsLogin,
    required TResult Function(LogoutEvent value) logout,
  }) {
    return googleLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitLoginEvent value)? init,
    TResult? Function(GoogleLoginEvent value)? googleLogin,
    TResult? Function(CredentialsLoginEvent value)? credentialsLogin,
    TResult? Function(LogoutEvent value)? logout,
  }) {
    return googleLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitLoginEvent value)? init,
    TResult Function(GoogleLoginEvent value)? googleLogin,
    TResult Function(CredentialsLoginEvent value)? credentialsLogin,
    TResult Function(LogoutEvent value)? logout,
    required TResult orElse(),
  }) {
    if (googleLogin != null) {
      return googleLogin(this);
    }
    return orElse();
  }
}

abstract class GoogleLoginEvent implements LoginEvent {
  const factory GoogleLoginEvent() = _$GoogleLoginEventImpl;
}

/// @nodoc
abstract class _$$CredentialsLoginEventImplCopyWith<$Res> {
  factory _$$CredentialsLoginEventImplCopyWith(
          _$CredentialsLoginEventImpl value,
          $Res Function(_$CredentialsLoginEventImpl) then) =
      __$$CredentialsLoginEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$CredentialsLoginEventImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$CredentialsLoginEventImpl>
    implements _$$CredentialsLoginEventImplCopyWith<$Res> {
  __$$CredentialsLoginEventImplCopyWithImpl(_$CredentialsLoginEventImpl _value,
      $Res Function(_$CredentialsLoginEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$CredentialsLoginEventImpl(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CredentialsLoginEventImpl implements CredentialsLoginEvent {
  const _$CredentialsLoginEventImpl(this.email, this.password);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginEvent.credentialsLogin(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CredentialsLoginEventImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CredentialsLoginEventImplCopyWith<_$CredentialsLoginEventImpl>
      get copyWith => __$$CredentialsLoginEventImplCopyWithImpl<
          _$CredentialsLoginEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() googleLogin,
    required TResult Function(String email, String password) credentialsLogin,
    required TResult Function() logout,
  }) {
    return credentialsLogin(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? googleLogin,
    TResult? Function(String email, String password)? credentialsLogin,
    TResult? Function()? logout,
  }) {
    return credentialsLogin?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? googleLogin,
    TResult Function(String email, String password)? credentialsLogin,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (credentialsLogin != null) {
      return credentialsLogin(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitLoginEvent value) init,
    required TResult Function(GoogleLoginEvent value) googleLogin,
    required TResult Function(CredentialsLoginEvent value) credentialsLogin,
    required TResult Function(LogoutEvent value) logout,
  }) {
    return credentialsLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitLoginEvent value)? init,
    TResult? Function(GoogleLoginEvent value)? googleLogin,
    TResult? Function(CredentialsLoginEvent value)? credentialsLogin,
    TResult? Function(LogoutEvent value)? logout,
  }) {
    return credentialsLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitLoginEvent value)? init,
    TResult Function(GoogleLoginEvent value)? googleLogin,
    TResult Function(CredentialsLoginEvent value)? credentialsLogin,
    TResult Function(LogoutEvent value)? logout,
    required TResult orElse(),
  }) {
    if (credentialsLogin != null) {
      return credentialsLogin(this);
    }
    return orElse();
  }
}

abstract class CredentialsLoginEvent implements LoginEvent {
  const factory CredentialsLoginEvent(
      final String email, final String password) = _$CredentialsLoginEventImpl;

  String get email;
  String get password;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CredentialsLoginEventImplCopyWith<_$CredentialsLoginEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogoutEventImplCopyWith<$Res> {
  factory _$$LogoutEventImplCopyWith(
          _$LogoutEventImpl value, $Res Function(_$LogoutEventImpl) then) =
      __$$LogoutEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutEventImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$LogoutEventImpl>
    implements _$$LogoutEventImplCopyWith<$Res> {
  __$$LogoutEventImplCopyWithImpl(
      _$LogoutEventImpl _value, $Res Function(_$LogoutEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LogoutEventImpl implements LogoutEvent {
  const _$LogoutEventImpl();

  @override
  String toString() {
    return 'LoginEvent.logout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() googleLogin,
    required TResult Function(String email, String password) credentialsLogin,
    required TResult Function() logout,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? googleLogin,
    TResult? Function(String email, String password)? credentialsLogin,
    TResult? Function()? logout,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? googleLogin,
    TResult Function(String email, String password)? credentialsLogin,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitLoginEvent value) init,
    required TResult Function(GoogleLoginEvent value) googleLogin,
    required TResult Function(CredentialsLoginEvent value) credentialsLogin,
    required TResult Function(LogoutEvent value) logout,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitLoginEvent value)? init,
    TResult? Function(GoogleLoginEvent value)? googleLogin,
    TResult? Function(CredentialsLoginEvent value)? credentialsLogin,
    TResult? Function(LogoutEvent value)? logout,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitLoginEvent value)? init,
    TResult Function(GoogleLoginEvent value)? googleLogin,
    TResult Function(CredentialsLoginEvent value)? credentialsLogin,
    TResult Function(LogoutEvent value)? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class LogoutEvent implements LoginEvent {
  const factory LogoutEvent() = _$LogoutEventImpl;
}

/// @nodoc
mixin _$LoginState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(SupabaseUser user) success,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(SupabaseUser user)? success,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(SupabaseUser user)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginInitState value) init,
    required TResult Function(LoginLoadingState value) loading,
    required TResult Function(LoginSuccessState value) success,
    required TResult Function(LoginErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginInitState value)? init,
    TResult? Function(LoginLoadingState value)? loading,
    TResult? Function(LoginSuccessState value)? success,
    TResult? Function(LoginErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitState value)? init,
    TResult Function(LoginLoadingState value)? loading,
    TResult Function(LoginSuccessState value)? success,
    TResult Function(LoginErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoginInitStateImplCopyWith<$Res> {
  factory _$$LoginInitStateImplCopyWith(_$LoginInitStateImpl value,
          $Res Function(_$LoginInitStateImpl) then) =
      __$$LoginInitStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginInitStateImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginInitStateImpl>
    implements _$$LoginInitStateImplCopyWith<$Res> {
  __$$LoginInitStateImplCopyWithImpl(
      _$LoginInitStateImpl _value, $Res Function(_$LoginInitStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoginInitStateImpl implements LoginInitState {
  const _$LoginInitStateImpl();

  @override
  String toString() {
    return 'LoginState.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginInitStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(SupabaseUser user) success,
    required TResult Function(String message) error,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(SupabaseUser user)? success,
    TResult? Function(String message)? error,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(SupabaseUser user)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginInitState value) init,
    required TResult Function(LoginLoadingState value) loading,
    required TResult Function(LoginSuccessState value) success,
    required TResult Function(LoginErrorState value) error,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginInitState value)? init,
    TResult? Function(LoginLoadingState value)? loading,
    TResult? Function(LoginSuccessState value)? success,
    TResult? Function(LoginErrorState value)? error,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitState value)? init,
    TResult Function(LoginLoadingState value)? loading,
    TResult Function(LoginSuccessState value)? success,
    TResult Function(LoginErrorState value)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class LoginInitState implements LoginState {
  const factory LoginInitState() = _$LoginInitStateImpl;
}

/// @nodoc
abstract class _$$LoginLoadingStateImplCopyWith<$Res> {
  factory _$$LoginLoadingStateImplCopyWith(_$LoginLoadingStateImpl value,
          $Res Function(_$LoginLoadingStateImpl) then) =
      __$$LoginLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginLoadingStateImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginLoadingStateImpl>
    implements _$$LoginLoadingStateImplCopyWith<$Res> {
  __$$LoginLoadingStateImplCopyWithImpl(_$LoginLoadingStateImpl _value,
      $Res Function(_$LoginLoadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoginLoadingStateImpl implements LoginLoadingState {
  const _$LoginLoadingStateImpl();

  @override
  String toString() {
    return 'LoginState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(SupabaseUser user) success,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(SupabaseUser user)? success,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(SupabaseUser user)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginInitState value) init,
    required TResult Function(LoginLoadingState value) loading,
    required TResult Function(LoginSuccessState value) success,
    required TResult Function(LoginErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginInitState value)? init,
    TResult? Function(LoginLoadingState value)? loading,
    TResult? Function(LoginSuccessState value)? success,
    TResult? Function(LoginErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitState value)? init,
    TResult Function(LoginLoadingState value)? loading,
    TResult Function(LoginSuccessState value)? success,
    TResult Function(LoginErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoginLoadingState implements LoginState {
  const factory LoginLoadingState() = _$LoginLoadingStateImpl;
}

/// @nodoc
abstract class _$$LoginSuccessStateImplCopyWith<$Res> {
  factory _$$LoginSuccessStateImplCopyWith(_$LoginSuccessStateImpl value,
          $Res Function(_$LoginSuccessStateImpl) then) =
      __$$LoginSuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SupabaseUser user});

  $SupabaseUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$LoginSuccessStateImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginSuccessStateImpl>
    implements _$$LoginSuccessStateImplCopyWith<$Res> {
  __$$LoginSuccessStateImplCopyWithImpl(_$LoginSuccessStateImpl _value,
      $Res Function(_$LoginSuccessStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$LoginSuccessStateImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as SupabaseUser,
    ));
  }

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SupabaseUserCopyWith<$Res> get user {
    return $SupabaseUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$LoginSuccessStateImpl implements LoginSuccessState {
  const _$LoginSuccessStateImpl(this.user);

  @override
  final SupabaseUser user;

  @override
  String toString() {
    return 'LoginState.success(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginSuccessStateImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginSuccessStateImplCopyWith<_$LoginSuccessStateImpl> get copyWith =>
      __$$LoginSuccessStateImplCopyWithImpl<_$LoginSuccessStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(SupabaseUser user) success,
    required TResult Function(String message) error,
  }) {
    return success(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(SupabaseUser user)? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(SupabaseUser user)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginInitState value) init,
    required TResult Function(LoginLoadingState value) loading,
    required TResult Function(LoginSuccessState value) success,
    required TResult Function(LoginErrorState value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginInitState value)? init,
    TResult? Function(LoginLoadingState value)? loading,
    TResult? Function(LoginSuccessState value)? success,
    TResult? Function(LoginErrorState value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitState value)? init,
    TResult Function(LoginLoadingState value)? loading,
    TResult Function(LoginSuccessState value)? success,
    TResult Function(LoginErrorState value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class LoginSuccessState implements LoginState {
  const factory LoginSuccessState(final SupabaseUser user) =
      _$LoginSuccessStateImpl;

  SupabaseUser get user;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginSuccessStateImplCopyWith<_$LoginSuccessStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginErrorStateImplCopyWith<$Res> {
  factory _$$LoginErrorStateImplCopyWith(_$LoginErrorStateImpl value,
          $Res Function(_$LoginErrorStateImpl) then) =
      __$$LoginErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$LoginErrorStateImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginErrorStateImpl>
    implements _$$LoginErrorStateImplCopyWith<$Res> {
  __$$LoginErrorStateImplCopyWithImpl(
      _$LoginErrorStateImpl _value, $Res Function(_$LoginErrorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$LoginErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginErrorStateImpl implements LoginErrorState {
  const _$LoginErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'LoginState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginErrorStateImplCopyWith<_$LoginErrorStateImpl> get copyWith =>
      __$$LoginErrorStateImplCopyWithImpl<_$LoginErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(SupabaseUser user) success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function(SupabaseUser user)? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(SupabaseUser user)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginInitState value) init,
    required TResult Function(LoginLoadingState value) loading,
    required TResult Function(LoginSuccessState value) success,
    required TResult Function(LoginErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginInitState value)? init,
    TResult? Function(LoginLoadingState value)? loading,
    TResult? Function(LoginSuccessState value)? success,
    TResult? Function(LoginErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitState value)? init,
    TResult Function(LoginLoadingState value)? loading,
    TResult Function(LoginSuccessState value)? success,
    TResult Function(LoginErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class LoginErrorState implements LoginState {
  const factory LoginErrorState(final String message) = _$LoginErrorStateImpl;

  String get message;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginErrorStateImplCopyWith<_$LoginErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
