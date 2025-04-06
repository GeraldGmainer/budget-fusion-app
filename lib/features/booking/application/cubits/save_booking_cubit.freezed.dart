// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'save_booking_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SaveBookingState {
  BookingDraft get draft => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BookingDraft draft) initial,
    required TResult Function(BookingDraft draft) loading,
    required TResult Function(BookingDraft draft) loaded,
    required TResult Function(BookingDraft draft, String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BookingDraft draft)? initial,
    TResult? Function(BookingDraft draft)? loading,
    TResult? Function(BookingDraft draft)? loaded,
    TResult? Function(BookingDraft draft, String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BookingDraft draft)? initial,
    TResult Function(BookingDraft draft)? loading,
    TResult Function(BookingDraft draft)? loaded,
    TResult Function(BookingDraft draft, String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of SaveBookingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SaveBookingStateCopyWith<SaveBookingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaveBookingStateCopyWith<$Res> {
  factory $SaveBookingStateCopyWith(
          SaveBookingState value, $Res Function(SaveBookingState) then) =
      _$SaveBookingStateCopyWithImpl<$Res, SaveBookingState>;
  @useResult
  $Res call({BookingDraft draft});

  $BookingDraftCopyWith<$Res> get draft;
}

/// @nodoc
class _$SaveBookingStateCopyWithImpl<$Res, $Val extends SaveBookingState>
    implements $SaveBookingStateCopyWith<$Res> {
  _$SaveBookingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SaveBookingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? draft = null,
  }) {
    return _then(_value.copyWith(
      draft: null == draft
          ? _value.draft
          : draft // ignore: cast_nullable_to_non_nullable
              as BookingDraft,
    ) as $Val);
  }

  /// Create a copy of SaveBookingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BookingDraftCopyWith<$Res> get draft {
    return $BookingDraftCopyWith<$Res>(_value.draft, (value) {
      return _then(_value.copyWith(draft: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $SaveBookingStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BookingDraft draft});

  @override
  $BookingDraftCopyWith<$Res> get draft;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SaveBookingStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SaveBookingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? draft = null,
  }) {
    return _then(_$InitialImpl(
      draft: null == draft
          ? _value.draft
          : draft // ignore: cast_nullable_to_non_nullable
              as BookingDraft,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  _$InitialImpl({required this.draft});

  @override
  final BookingDraft draft;

  @override
  String toString() {
    return 'SaveBookingState.initial(draft: $draft)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.draft, draft) || other.draft == draft));
  }

  @override
  int get hashCode => Object.hash(runtimeType, draft);

  /// Create a copy of SaveBookingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BookingDraft draft) initial,
    required TResult Function(BookingDraft draft) loading,
    required TResult Function(BookingDraft draft) loaded,
    required TResult Function(BookingDraft draft, String message) error,
  }) {
    return initial(draft);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BookingDraft draft)? initial,
    TResult? Function(BookingDraft draft)? loading,
    TResult? Function(BookingDraft draft)? loaded,
    TResult? Function(BookingDraft draft, String message)? error,
  }) {
    return initial?.call(draft);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BookingDraft draft)? initial,
    TResult Function(BookingDraft draft)? loading,
    TResult Function(BookingDraft draft)? loaded,
    TResult Function(BookingDraft draft, String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(draft);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SaveBookingState {
  factory _Initial({required final BookingDraft draft}) = _$InitialImpl;

  @override
  BookingDraft get draft;

  /// Create a copy of SaveBookingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res>
    implements $SaveBookingStateCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BookingDraft draft});

  @override
  $BookingDraftCopyWith<$Res> get draft;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$SaveBookingStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SaveBookingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? draft = null,
  }) {
    return _then(_$LoadingImpl(
      draft: null == draft
          ? _value.draft
          : draft // ignore: cast_nullable_to_non_nullable
              as BookingDraft,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl({required this.draft});

  @override
  final BookingDraft draft;

  @override
  String toString() {
    return 'SaveBookingState.loading(draft: $draft)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            (identical(other.draft, draft) || other.draft == draft));
  }

  @override
  int get hashCode => Object.hash(runtimeType, draft);

  /// Create a copy of SaveBookingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BookingDraft draft) initial,
    required TResult Function(BookingDraft draft) loading,
    required TResult Function(BookingDraft draft) loaded,
    required TResult Function(BookingDraft draft, String message) error,
  }) {
    return loading(draft);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BookingDraft draft)? initial,
    TResult? Function(BookingDraft draft)? loading,
    TResult? Function(BookingDraft draft)? loaded,
    TResult? Function(BookingDraft draft, String message)? error,
  }) {
    return loading?.call(draft);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BookingDraft draft)? initial,
    TResult Function(BookingDraft draft)? loading,
    TResult Function(BookingDraft draft)? loaded,
    TResult Function(BookingDraft draft, String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(draft);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements SaveBookingState {
  const factory _Loading({required final BookingDraft draft}) = _$LoadingImpl;

  @override
  BookingDraft get draft;

  /// Create a copy of SaveBookingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res>
    implements $SaveBookingStateCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BookingDraft draft});

  @override
  $BookingDraftCopyWith<$Res> get draft;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$SaveBookingStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SaveBookingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? draft = null,
  }) {
    return _then(_$LoadedImpl(
      draft: null == draft
          ? _value.draft
          : draft // ignore: cast_nullable_to_non_nullable
              as BookingDraft,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl({required this.draft});

  @override
  final BookingDraft draft;

  @override
  String toString() {
    return 'SaveBookingState.loaded(draft: $draft)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.draft, draft) || other.draft == draft));
  }

  @override
  int get hashCode => Object.hash(runtimeType, draft);

  /// Create a copy of SaveBookingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BookingDraft draft) initial,
    required TResult Function(BookingDraft draft) loading,
    required TResult Function(BookingDraft draft) loaded,
    required TResult Function(BookingDraft draft, String message) error,
  }) {
    return loaded(draft);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BookingDraft draft)? initial,
    TResult? Function(BookingDraft draft)? loading,
    TResult? Function(BookingDraft draft)? loaded,
    TResult? Function(BookingDraft draft, String message)? error,
  }) {
    return loaded?.call(draft);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BookingDraft draft)? initial,
    TResult Function(BookingDraft draft)? loading,
    TResult Function(BookingDraft draft)? loaded,
    TResult Function(BookingDraft draft, String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(draft);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements SaveBookingState {
  const factory _Loaded({required final BookingDraft draft}) = _$LoadedImpl;

  @override
  BookingDraft get draft;

  /// Create a copy of SaveBookingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res>
    implements $SaveBookingStateCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BookingDraft draft, String message});

  @override
  $BookingDraftCopyWith<$Res> get draft;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$SaveBookingStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of SaveBookingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? draft = null,
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      draft: null == draft
          ? _value.draft
          : draft // ignore: cast_nullable_to_non_nullable
              as BookingDraft,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({required this.draft, required this.message});

  @override
  final BookingDraft draft;
  @override
  final String message;

  @override
  String toString() {
    return 'SaveBookingState.error(draft: $draft, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.draft, draft) || other.draft == draft) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, draft, message);

  /// Create a copy of SaveBookingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BookingDraft draft) initial,
    required TResult Function(BookingDraft draft) loading,
    required TResult Function(BookingDraft draft) loaded,
    required TResult Function(BookingDraft draft, String message) error,
  }) {
    return error(draft, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BookingDraft draft)? initial,
    TResult? Function(BookingDraft draft)? loading,
    TResult? Function(BookingDraft draft)? loaded,
    TResult? Function(BookingDraft draft, String message)? error,
  }) {
    return error?.call(draft, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BookingDraft draft)? initial,
    TResult Function(BookingDraft draft)? loading,
    TResult Function(BookingDraft draft)? loaded,
    TResult Function(BookingDraft draft, String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(draft, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements SaveBookingState {
  const factory _Error(
      {required final BookingDraft draft,
      required final String message}) = _$ErrorImpl;

  @override
  BookingDraft get draft;
  String get message;

  /// Create a copy of SaveBookingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
