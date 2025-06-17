// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_save_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BookingSaveState {
  BookingDraft get draft => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BookingDraft draft) initial,
    required TResult Function(BookingDraft draft, BookingDraft initialDraft)
    draftUpdate,
    required TResult Function(BookingDraft draft) loading,
    required TResult Function(BookingDraft draft) loaded,
    required TResult Function(BookingDraft draft, Booking booking) deleted,
    required TResult Function(BookingDraft draft, AppError error) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BookingDraft draft)? initial,
    TResult? Function(BookingDraft draft, BookingDraft initialDraft)?
    draftUpdate,
    TResult? Function(BookingDraft draft)? loading,
    TResult? Function(BookingDraft draft)? loaded,
    TResult? Function(BookingDraft draft, Booking booking)? deleted,
    TResult? Function(BookingDraft draft, AppError error)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BookingDraft draft)? initial,
    TResult Function(BookingDraft draft, BookingDraft initialDraft)?
    draftUpdate,
    TResult Function(BookingDraft draft)? loading,
    TResult Function(BookingDraft draft)? loaded,
    TResult Function(BookingDraft draft, Booking booking)? deleted,
    TResult Function(BookingDraft draft, AppError error)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_DraftUpdate value) draftUpdate,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DraftUpdate value)? draftUpdate,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DraftUpdate value)? draftUpdate,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of BookingSaveState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingSaveStateCopyWith<BookingSaveState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingSaveStateCopyWith<$Res> {
  factory $BookingSaveStateCopyWith(
    BookingSaveState value,
    $Res Function(BookingSaveState) then,
  ) = _$BookingSaveStateCopyWithImpl<$Res, BookingSaveState>;
  @useResult
  $Res call({BookingDraft draft});

  $BookingDraftCopyWith<$Res> get draft;
}

/// @nodoc
class _$BookingSaveStateCopyWithImpl<$Res, $Val extends BookingSaveState>
    implements $BookingSaveStateCopyWith<$Res> {
  _$BookingSaveStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookingSaveState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? draft = null}) {
    return _then(
      _value.copyWith(
            draft:
                null == draft
                    ? _value.draft
                    : draft // ignore: cast_nullable_to_non_nullable
                        as BookingDraft,
          )
          as $Val,
    );
  }

  /// Create a copy of BookingSaveState
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
    implements $BookingSaveStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BookingDraft draft});

  @override
  $BookingDraftCopyWith<$Res> get draft;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$BookingSaveStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookingSaveState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? draft = null}) {
    return _then(
      _$InitialImpl(
        draft:
            null == draft
                ? _value.draft
                : draft // ignore: cast_nullable_to_non_nullable
                    as BookingDraft,
      ),
    );
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  _$InitialImpl({required this.draft});

  @override
  final BookingDraft draft;

  @override
  String toString() {
    return 'BookingSaveState.initial(draft: $draft)';
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

  /// Create a copy of BookingSaveState
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
    required TResult Function(BookingDraft draft, BookingDraft initialDraft)
    draftUpdate,
    required TResult Function(BookingDraft draft) loading,
    required TResult Function(BookingDraft draft) loaded,
    required TResult Function(BookingDraft draft, Booking booking) deleted,
    required TResult Function(BookingDraft draft, AppError error) error,
  }) {
    return initial(draft);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BookingDraft draft)? initial,
    TResult? Function(BookingDraft draft, BookingDraft initialDraft)?
    draftUpdate,
    TResult? Function(BookingDraft draft)? loading,
    TResult? Function(BookingDraft draft)? loaded,
    TResult? Function(BookingDraft draft, Booking booking)? deleted,
    TResult? Function(BookingDraft draft, AppError error)? error,
  }) {
    return initial?.call(draft);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BookingDraft draft)? initial,
    TResult Function(BookingDraft draft, BookingDraft initialDraft)?
    draftUpdate,
    TResult Function(BookingDraft draft)? loading,
    TResult Function(BookingDraft draft)? loaded,
    TResult Function(BookingDraft draft, Booking booking)? deleted,
    TResult Function(BookingDraft draft, AppError error)? error,
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
    required TResult Function(_DraftUpdate value) draftUpdate,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DraftUpdate value)? draftUpdate,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DraftUpdate value)? draftUpdate,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements BookingSaveState {
  factory _Initial({required final BookingDraft draft}) = _$InitialImpl;

  @override
  BookingDraft get draft;

  /// Create a copy of BookingSaveState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DraftUpdateImplCopyWith<$Res>
    implements $BookingSaveStateCopyWith<$Res> {
  factory _$$DraftUpdateImplCopyWith(
    _$DraftUpdateImpl value,
    $Res Function(_$DraftUpdateImpl) then,
  ) = __$$DraftUpdateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BookingDraft draft, BookingDraft initialDraft});

  @override
  $BookingDraftCopyWith<$Res> get draft;
  $BookingDraftCopyWith<$Res> get initialDraft;
}

/// @nodoc
class __$$DraftUpdateImplCopyWithImpl<$Res>
    extends _$BookingSaveStateCopyWithImpl<$Res, _$DraftUpdateImpl>
    implements _$$DraftUpdateImplCopyWith<$Res> {
  __$$DraftUpdateImplCopyWithImpl(
    _$DraftUpdateImpl _value,
    $Res Function(_$DraftUpdateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookingSaveState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? draft = null, Object? initialDraft = null}) {
    return _then(
      _$DraftUpdateImpl(
        draft:
            null == draft
                ? _value.draft
                : draft // ignore: cast_nullable_to_non_nullable
                    as BookingDraft,
        initialDraft:
            null == initialDraft
                ? _value.initialDraft
                : initialDraft // ignore: cast_nullable_to_non_nullable
                    as BookingDraft,
      ),
    );
  }

  /// Create a copy of BookingSaveState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BookingDraftCopyWith<$Res> get initialDraft {
    return $BookingDraftCopyWith<$Res>(_value.initialDraft, (value) {
      return _then(_value.copyWith(initialDraft: value));
    });
  }
}

/// @nodoc

class _$DraftUpdateImpl implements _DraftUpdate {
  _$DraftUpdateImpl({required this.draft, required this.initialDraft});

  @override
  final BookingDraft draft;
  @override
  final BookingDraft initialDraft;

  @override
  String toString() {
    return 'BookingSaveState.draftUpdate(draft: $draft, initialDraft: $initialDraft)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DraftUpdateImpl &&
            (identical(other.draft, draft) || other.draft == draft) &&
            (identical(other.initialDraft, initialDraft) ||
                other.initialDraft == initialDraft));
  }

  @override
  int get hashCode => Object.hash(runtimeType, draft, initialDraft);

  /// Create a copy of BookingSaveState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DraftUpdateImplCopyWith<_$DraftUpdateImpl> get copyWith =>
      __$$DraftUpdateImplCopyWithImpl<_$DraftUpdateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BookingDraft draft) initial,
    required TResult Function(BookingDraft draft, BookingDraft initialDraft)
    draftUpdate,
    required TResult Function(BookingDraft draft) loading,
    required TResult Function(BookingDraft draft) loaded,
    required TResult Function(BookingDraft draft, Booking booking) deleted,
    required TResult Function(BookingDraft draft, AppError error) error,
  }) {
    return draftUpdate(draft, initialDraft);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BookingDraft draft)? initial,
    TResult? Function(BookingDraft draft, BookingDraft initialDraft)?
    draftUpdate,
    TResult? Function(BookingDraft draft)? loading,
    TResult? Function(BookingDraft draft)? loaded,
    TResult? Function(BookingDraft draft, Booking booking)? deleted,
    TResult? Function(BookingDraft draft, AppError error)? error,
  }) {
    return draftUpdate?.call(draft, initialDraft);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BookingDraft draft)? initial,
    TResult Function(BookingDraft draft, BookingDraft initialDraft)?
    draftUpdate,
    TResult Function(BookingDraft draft)? loading,
    TResult Function(BookingDraft draft)? loaded,
    TResult Function(BookingDraft draft, Booking booking)? deleted,
    TResult Function(BookingDraft draft, AppError error)? error,
    required TResult orElse(),
  }) {
    if (draftUpdate != null) {
      return draftUpdate(draft, initialDraft);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_DraftUpdate value) draftUpdate,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) {
    return draftUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DraftUpdate value)? draftUpdate,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Error value)? error,
  }) {
    return draftUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DraftUpdate value)? draftUpdate,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (draftUpdate != null) {
      return draftUpdate(this);
    }
    return orElse();
  }
}

abstract class _DraftUpdate implements BookingSaveState {
  factory _DraftUpdate({
    required final BookingDraft draft,
    required final BookingDraft initialDraft,
  }) = _$DraftUpdateImpl;

  @override
  BookingDraft get draft;
  BookingDraft get initialDraft;

  /// Create a copy of BookingSaveState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DraftUpdateImplCopyWith<_$DraftUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res>
    implements $BookingSaveStateCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BookingDraft draft});

  @override
  $BookingDraftCopyWith<$Res> get draft;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$BookingSaveStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookingSaveState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? draft = null}) {
    return _then(
      _$LoadingImpl(
        draft:
            null == draft
                ? _value.draft
                : draft // ignore: cast_nullable_to_non_nullable
                    as BookingDraft,
      ),
    );
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl({required this.draft});

  @override
  final BookingDraft draft;

  @override
  String toString() {
    return 'BookingSaveState.loading(draft: $draft)';
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

  /// Create a copy of BookingSaveState
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
    required TResult Function(BookingDraft draft, BookingDraft initialDraft)
    draftUpdate,
    required TResult Function(BookingDraft draft) loading,
    required TResult Function(BookingDraft draft) loaded,
    required TResult Function(BookingDraft draft, Booking booking) deleted,
    required TResult Function(BookingDraft draft, AppError error) error,
  }) {
    return loading(draft);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BookingDraft draft)? initial,
    TResult? Function(BookingDraft draft, BookingDraft initialDraft)?
    draftUpdate,
    TResult? Function(BookingDraft draft)? loading,
    TResult? Function(BookingDraft draft)? loaded,
    TResult? Function(BookingDraft draft, Booking booking)? deleted,
    TResult? Function(BookingDraft draft, AppError error)? error,
  }) {
    return loading?.call(draft);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BookingDraft draft)? initial,
    TResult Function(BookingDraft draft, BookingDraft initialDraft)?
    draftUpdate,
    TResult Function(BookingDraft draft)? loading,
    TResult Function(BookingDraft draft)? loaded,
    TResult Function(BookingDraft draft, Booking booking)? deleted,
    TResult Function(BookingDraft draft, AppError error)? error,
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
    required TResult Function(_DraftUpdate value) draftUpdate,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DraftUpdate value)? draftUpdate,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DraftUpdate value)? draftUpdate,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements BookingSaveState {
  const factory _Loading({required final BookingDraft draft}) = _$LoadingImpl;

  @override
  BookingDraft get draft;

  /// Create a copy of BookingSaveState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res>
    implements $BookingSaveStateCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
    _$LoadedImpl value,
    $Res Function(_$LoadedImpl) then,
  ) = __$$LoadedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BookingDraft draft});

  @override
  $BookingDraftCopyWith<$Res> get draft;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$BookingSaveStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
    _$LoadedImpl _value,
    $Res Function(_$LoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookingSaveState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? draft = null}) {
    return _then(
      _$LoadedImpl(
        draft:
            null == draft
                ? _value.draft
                : draft // ignore: cast_nullable_to_non_nullable
                    as BookingDraft,
      ),
    );
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl({required this.draft});

  @override
  final BookingDraft draft;

  @override
  String toString() {
    return 'BookingSaveState.loaded(draft: $draft)';
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

  /// Create a copy of BookingSaveState
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
    required TResult Function(BookingDraft draft, BookingDraft initialDraft)
    draftUpdate,
    required TResult Function(BookingDraft draft) loading,
    required TResult Function(BookingDraft draft) loaded,
    required TResult Function(BookingDraft draft, Booking booking) deleted,
    required TResult Function(BookingDraft draft, AppError error) error,
  }) {
    return loaded(draft);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BookingDraft draft)? initial,
    TResult? Function(BookingDraft draft, BookingDraft initialDraft)?
    draftUpdate,
    TResult? Function(BookingDraft draft)? loading,
    TResult? Function(BookingDraft draft)? loaded,
    TResult? Function(BookingDraft draft, Booking booking)? deleted,
    TResult? Function(BookingDraft draft, AppError error)? error,
  }) {
    return loaded?.call(draft);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BookingDraft draft)? initial,
    TResult Function(BookingDraft draft, BookingDraft initialDraft)?
    draftUpdate,
    TResult Function(BookingDraft draft)? loading,
    TResult Function(BookingDraft draft)? loaded,
    TResult Function(BookingDraft draft, Booking booking)? deleted,
    TResult Function(BookingDraft draft, AppError error)? error,
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
    required TResult Function(_DraftUpdate value) draftUpdate,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DraftUpdate value)? draftUpdate,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DraftUpdate value)? draftUpdate,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements BookingSaveState {
  const factory _Loaded({required final BookingDraft draft}) = _$LoadedImpl;

  @override
  BookingDraft get draft;

  /// Create a copy of BookingSaveState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeletedImplCopyWith<$Res>
    implements $BookingSaveStateCopyWith<$Res> {
  factory _$$DeletedImplCopyWith(
    _$DeletedImpl value,
    $Res Function(_$DeletedImpl) then,
  ) = __$$DeletedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BookingDraft draft, Booking booking});

  @override
  $BookingDraftCopyWith<$Res> get draft;
  $BookingCopyWith<$Res> get booking;
}

/// @nodoc
class __$$DeletedImplCopyWithImpl<$Res>
    extends _$BookingSaveStateCopyWithImpl<$Res, _$DeletedImpl>
    implements _$$DeletedImplCopyWith<$Res> {
  __$$DeletedImplCopyWithImpl(
    _$DeletedImpl _value,
    $Res Function(_$DeletedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookingSaveState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? draft = null, Object? booking = null}) {
    return _then(
      _$DeletedImpl(
        draft:
            null == draft
                ? _value.draft
                : draft // ignore: cast_nullable_to_non_nullable
                    as BookingDraft,
        booking:
            null == booking
                ? _value.booking
                : booking // ignore: cast_nullable_to_non_nullable
                    as Booking,
      ),
    );
  }

  /// Create a copy of BookingSaveState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BookingCopyWith<$Res> get booking {
    return $BookingCopyWith<$Res>(_value.booking, (value) {
      return _then(_value.copyWith(booking: value));
    });
  }
}

/// @nodoc

class _$DeletedImpl implements _Deleted {
  const _$DeletedImpl({required this.draft, required this.booking});

  @override
  final BookingDraft draft;
  @override
  final Booking booking;

  @override
  String toString() {
    return 'BookingSaveState.deleted(draft: $draft, booking: $booking)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeletedImpl &&
            (identical(other.draft, draft) || other.draft == draft) &&
            (identical(other.booking, booking) || other.booking == booking));
  }

  @override
  int get hashCode => Object.hash(runtimeType, draft, booking);

  /// Create a copy of BookingSaveState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeletedImplCopyWith<_$DeletedImpl> get copyWith =>
      __$$DeletedImplCopyWithImpl<_$DeletedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BookingDraft draft) initial,
    required TResult Function(BookingDraft draft, BookingDraft initialDraft)
    draftUpdate,
    required TResult Function(BookingDraft draft) loading,
    required TResult Function(BookingDraft draft) loaded,
    required TResult Function(BookingDraft draft, Booking booking) deleted,
    required TResult Function(BookingDraft draft, AppError error) error,
  }) {
    return deleted(draft, booking);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BookingDraft draft)? initial,
    TResult? Function(BookingDraft draft, BookingDraft initialDraft)?
    draftUpdate,
    TResult? Function(BookingDraft draft)? loading,
    TResult? Function(BookingDraft draft)? loaded,
    TResult? Function(BookingDraft draft, Booking booking)? deleted,
    TResult? Function(BookingDraft draft, AppError error)? error,
  }) {
    return deleted?.call(draft, booking);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BookingDraft draft)? initial,
    TResult Function(BookingDraft draft, BookingDraft initialDraft)?
    draftUpdate,
    TResult Function(BookingDraft draft)? loading,
    TResult Function(BookingDraft draft)? loaded,
    TResult Function(BookingDraft draft, Booking booking)? deleted,
    TResult Function(BookingDraft draft, AppError error)? error,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted(draft, booking);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_DraftUpdate value) draftUpdate,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) {
    return deleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DraftUpdate value)? draftUpdate,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Error value)? error,
  }) {
    return deleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DraftUpdate value)? draftUpdate,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted(this);
    }
    return orElse();
  }
}

abstract class _Deleted implements BookingSaveState {
  const factory _Deleted({
    required final BookingDraft draft,
    required final Booking booking,
  }) = _$DeletedImpl;

  @override
  BookingDraft get draft;
  Booking get booking;

  /// Create a copy of BookingSaveState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeletedImplCopyWith<_$DeletedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res>
    implements $BookingSaveStateCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BookingDraft draft, AppError error});

  @override
  $BookingDraftCopyWith<$Res> get draft;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$BookingSaveStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookingSaveState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? draft = null, Object? error = null}) {
    return _then(
      _$ErrorImpl(
        draft:
            null == draft
                ? _value.draft
                : draft // ignore: cast_nullable_to_non_nullable
                    as BookingDraft,
        error:
            null == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as AppError,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({required this.draft, required this.error});

  @override
  final BookingDraft draft;
  @override
  final AppError error;

  @override
  String toString() {
    return 'BookingSaveState.error(draft: $draft, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.draft, draft) || other.draft == draft) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, draft, error);

  /// Create a copy of BookingSaveState
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
    required TResult Function(BookingDraft draft, BookingDraft initialDraft)
    draftUpdate,
    required TResult Function(BookingDraft draft) loading,
    required TResult Function(BookingDraft draft) loaded,
    required TResult Function(BookingDraft draft, Booking booking) deleted,
    required TResult Function(BookingDraft draft, AppError error) error,
  }) {
    return error(draft, this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BookingDraft draft)? initial,
    TResult? Function(BookingDraft draft, BookingDraft initialDraft)?
    draftUpdate,
    TResult? Function(BookingDraft draft)? loading,
    TResult? Function(BookingDraft draft)? loaded,
    TResult? Function(BookingDraft draft, Booking booking)? deleted,
    TResult? Function(BookingDraft draft, AppError error)? error,
  }) {
    return error?.call(draft, this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BookingDraft draft)? initial,
    TResult Function(BookingDraft draft, BookingDraft initialDraft)?
    draftUpdate,
    TResult Function(BookingDraft draft)? loading,
    TResult Function(BookingDraft draft)? loaded,
    TResult Function(BookingDraft draft, Booking booking)? deleted,
    TResult Function(BookingDraft draft, AppError error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(draft, this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_DraftUpdate value) draftUpdate,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DraftUpdate value)? draftUpdate,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DraftUpdate value)? draftUpdate,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements BookingSaveState {
  const factory _Error({
    required final BookingDraft draft,
    required final AppError error,
  }) = _$ErrorImpl;

  @override
  BookingDraft get draft;
  AppError get error;

  /// Create a copy of BookingSaveState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
