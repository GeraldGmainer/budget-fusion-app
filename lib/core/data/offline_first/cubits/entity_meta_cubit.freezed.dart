// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entity_meta_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$EntityMetaState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() created,
    required TResult Function(EntityMeta meta) upserted,
    required TResult Function() deleted,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? created,
    TResult? Function(EntityMeta meta)? upserted,
    TResult? Function()? deleted,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? created,
    TResult Function(EntityMeta meta)? upserted,
    TResult Function()? deleted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Created value) created,
    required TResult Function(_Upserted value) upserted,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Created value)? created,
    TResult? Function(_Upserted value)? upserted,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Created value)? created,
    TResult Function(_Upserted value)? upserted,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntityMetaStateCopyWith<$Res> {
  factory $EntityMetaStateCopyWith(
    EntityMetaState value,
    $Res Function(EntityMetaState) then,
  ) = _$EntityMetaStateCopyWithImpl<$Res, EntityMetaState>;
}

/// @nodoc
class _$EntityMetaStateCopyWithImpl<$Res, $Val extends EntityMetaState>
    implements $EntityMetaStateCopyWith<$Res> {
  _$EntityMetaStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EntityMetaState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$EntityMetaStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EntityMetaState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'EntityMetaState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() created,
    required TResult Function(EntityMeta meta) upserted,
    required TResult Function() deleted,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? created,
    TResult? Function(EntityMeta meta)? upserted,
    TResult? Function()? deleted,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? created,
    TResult Function(EntityMeta meta)? upserted,
    TResult Function()? deleted,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Created value) created,
    required TResult Function(_Upserted value) upserted,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Created value)? created,
    TResult? Function(_Upserted value)? upserted,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Created value)? created,
    TResult Function(_Upserted value)? upserted,
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

abstract class _Loading implements EntityMetaState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$CreatedImplCopyWith<$Res> {
  factory _$$CreatedImplCopyWith(
    _$CreatedImpl value,
    $Res Function(_$CreatedImpl) then,
  ) = __$$CreatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreatedImplCopyWithImpl<$Res>
    extends _$EntityMetaStateCopyWithImpl<$Res, _$CreatedImpl>
    implements _$$CreatedImplCopyWith<$Res> {
  __$$CreatedImplCopyWithImpl(
    _$CreatedImpl _value,
    $Res Function(_$CreatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EntityMetaState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CreatedImpl implements _Created {
  const _$CreatedImpl();

  @override
  String toString() {
    return 'EntityMetaState.created()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CreatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() created,
    required TResult Function(EntityMeta meta) upserted,
    required TResult Function() deleted,
    required TResult Function(String message) error,
  }) {
    return created();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? created,
    TResult? Function(EntityMeta meta)? upserted,
    TResult? Function()? deleted,
    TResult? Function(String message)? error,
  }) {
    return created?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? created,
    TResult Function(EntityMeta meta)? upserted,
    TResult Function()? deleted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (created != null) {
      return created();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Created value) created,
    required TResult Function(_Upserted value) upserted,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) {
    return created(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Created value)? created,
    TResult? Function(_Upserted value)? upserted,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Error value)? error,
  }) {
    return created?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Created value)? created,
    TResult Function(_Upserted value)? upserted,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (created != null) {
      return created(this);
    }
    return orElse();
  }
}

abstract class _Created implements EntityMetaState {
  const factory _Created() = _$CreatedImpl;
}

/// @nodoc
abstract class _$$UpsertedImplCopyWith<$Res> {
  factory _$$UpsertedImplCopyWith(
    _$UpsertedImpl value,
    $Res Function(_$UpsertedImpl) then,
  ) = __$$UpsertedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({EntityMeta meta});

  $EntityMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$UpsertedImplCopyWithImpl<$Res>
    extends _$EntityMetaStateCopyWithImpl<$Res, _$UpsertedImpl>
    implements _$$UpsertedImplCopyWith<$Res> {
  __$$UpsertedImplCopyWithImpl(
    _$UpsertedImpl _value,
    $Res Function(_$UpsertedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EntityMetaState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? meta = null}) {
    return _then(
      _$UpsertedImpl(
        null == meta
            ? _value.meta
            : meta // ignore: cast_nullable_to_non_nullable
                as EntityMeta,
      ),
    );
  }

  /// Create a copy of EntityMetaState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EntityMetaCopyWith<$Res> get meta {
    return $EntityMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value));
    });
  }
}

/// @nodoc

class _$UpsertedImpl implements _Upserted {
  const _$UpsertedImpl(this.meta);

  @override
  final EntityMeta meta;

  @override
  String toString() {
    return 'EntityMetaState.upserted(meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpsertedImpl &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @override
  int get hashCode => Object.hash(runtimeType, meta);

  /// Create a copy of EntityMetaState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpsertedImplCopyWith<_$UpsertedImpl> get copyWith =>
      __$$UpsertedImplCopyWithImpl<_$UpsertedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() created,
    required TResult Function(EntityMeta meta) upserted,
    required TResult Function() deleted,
    required TResult Function(String message) error,
  }) {
    return upserted(meta);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? created,
    TResult? Function(EntityMeta meta)? upserted,
    TResult? Function()? deleted,
    TResult? Function(String message)? error,
  }) {
    return upserted?.call(meta);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? created,
    TResult Function(EntityMeta meta)? upserted,
    TResult Function()? deleted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (upserted != null) {
      return upserted(meta);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Created value) created,
    required TResult Function(_Upserted value) upserted,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) {
    return upserted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Created value)? created,
    TResult? Function(_Upserted value)? upserted,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Error value)? error,
  }) {
    return upserted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Created value)? created,
    TResult Function(_Upserted value)? upserted,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (upserted != null) {
      return upserted(this);
    }
    return orElse();
  }
}

abstract class _Upserted implements EntityMetaState {
  const factory _Upserted(final EntityMeta meta) = _$UpsertedImpl;

  EntityMeta get meta;

  /// Create a copy of EntityMetaState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpsertedImplCopyWith<_$UpsertedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeletedImplCopyWith<$Res> {
  factory _$$DeletedImplCopyWith(
    _$DeletedImpl value,
    $Res Function(_$DeletedImpl) then,
  ) = __$$DeletedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeletedImplCopyWithImpl<$Res>
    extends _$EntityMetaStateCopyWithImpl<$Res, _$DeletedImpl>
    implements _$$DeletedImplCopyWith<$Res> {
  __$$DeletedImplCopyWithImpl(
    _$DeletedImpl _value,
    $Res Function(_$DeletedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EntityMetaState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeletedImpl implements _Deleted {
  const _$DeletedImpl();

  @override
  String toString() {
    return 'EntityMetaState.deleted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeletedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() created,
    required TResult Function(EntityMeta meta) upserted,
    required TResult Function() deleted,
    required TResult Function(String message) error,
  }) {
    return deleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? created,
    TResult? Function(EntityMeta meta)? upserted,
    TResult? Function()? deleted,
    TResult? Function(String message)? error,
  }) {
    return deleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? created,
    TResult Function(EntityMeta meta)? upserted,
    TResult Function()? deleted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Created value) created,
    required TResult Function(_Upserted value) upserted,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) {
    return deleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Created value)? created,
    TResult? Function(_Upserted value)? upserted,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Error value)? error,
  }) {
    return deleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Created value)? created,
    TResult Function(_Upserted value)? upserted,
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

abstract class _Deleted implements EntityMetaState {
  const factory _Deleted() = _$DeletedImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$EntityMetaStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EntityMetaState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'EntityMetaState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of EntityMetaState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() created,
    required TResult Function(EntityMeta meta) upserted,
    required TResult Function() deleted,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? created,
    TResult? Function(EntityMeta meta)? upserted,
    TResult? Function()? deleted,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? created,
    TResult Function(EntityMeta meta)? upserted,
    TResult Function()? deleted,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Created value) created,
    required TResult Function(_Upserted value) upserted,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Created value)? created,
    TResult? Function(_Upserted value)? upserted,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Created value)? created,
    TResult Function(_Upserted value)? upserted,
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

abstract class _Error implements EntityMetaState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of EntityMetaState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
