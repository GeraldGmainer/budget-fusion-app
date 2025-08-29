// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entity_meta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$EntityMeta {
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;
  bool get isPending => throw _privateConstructorUsedError;
  bool get isPendingDelete => throw _privateConstructorUsedError;
  int get attempts => throw _privateConstructorUsedError;

  /// Create a copy of EntityMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EntityMetaCopyWith<EntityMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntityMetaCopyWith<$Res> {
  factory $EntityMetaCopyWith(
    EntityMeta value,
    $Res Function(EntityMeta) then,
  ) = _$EntityMetaCopyWithImpl<$Res, EntityMeta>;
  @useResult
  $Res call({
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    bool isPending,
    bool isPendingDelete,
    int attempts,
  });
}

/// @nodoc
class _$EntityMetaCopyWithImpl<$Res, $Val extends EntityMeta>
    implements $EntityMetaCopyWith<$Res> {
  _$EntityMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EntityMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
    Object? isPending = null,
    Object? isPendingDelete = null,
    Object? attempts = null,
  }) {
    return _then(
      _value.copyWith(
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            updatedAt:
                freezed == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            deletedAt:
                freezed == deletedAt
                    ? _value.deletedAt
                    : deletedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            isPending:
                null == isPending
                    ? _value.isPending
                    : isPending // ignore: cast_nullable_to_non_nullable
                        as bool,
            isPendingDelete:
                null == isPendingDelete
                    ? _value.isPendingDelete
                    : isPendingDelete // ignore: cast_nullable_to_non_nullable
                        as bool,
            attempts:
                null == attempts
                    ? _value.attempts
                    : attempts // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EntityMetaImplCopyWith<$Res>
    implements $EntityMetaCopyWith<$Res> {
  factory _$$EntityMetaImplCopyWith(
    _$EntityMetaImpl value,
    $Res Function(_$EntityMetaImpl) then,
  ) = __$$EntityMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    bool isPending,
    bool isPendingDelete,
    int attempts,
  });
}

/// @nodoc
class __$$EntityMetaImplCopyWithImpl<$Res>
    extends _$EntityMetaCopyWithImpl<$Res, _$EntityMetaImpl>
    implements _$$EntityMetaImplCopyWith<$Res> {
  __$$EntityMetaImplCopyWithImpl(
    _$EntityMetaImpl _value,
    $Res Function(_$EntityMetaImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EntityMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
    Object? isPending = null,
    Object? isPendingDelete = null,
    Object? attempts = null,
  }) {
    return _then(
      _$EntityMetaImpl(
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        updatedAt:
            freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        deletedAt:
            freezed == deletedAt
                ? _value.deletedAt
                : deletedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        isPending:
            null == isPending
                ? _value.isPending
                : isPending // ignore: cast_nullable_to_non_nullable
                    as bool,
        isPendingDelete:
            null == isPendingDelete
                ? _value.isPendingDelete
                : isPendingDelete // ignore: cast_nullable_to_non_nullable
                    as bool,
        attempts:
            null == attempts
                ? _value.attempts
                : attempts // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc

class _$EntityMetaImpl implements _EntityMeta {
  const _$EntityMetaImpl({
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.isPending = false,
    this.isPendingDelete = false,
    this.attempts = 0,
  });

  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final DateTime? deletedAt;
  @override
  @JsonKey()
  final bool isPending;
  @override
  @JsonKey()
  final bool isPendingDelete;
  @override
  @JsonKey()
  final int attempts;

  @override
  String toString() {
    return 'EntityMeta(createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, isPending: $isPending, isPendingDelete: $isPendingDelete, attempts: $attempts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EntityMetaImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.isPending, isPending) ||
                other.isPending == isPending) &&
            (identical(other.isPendingDelete, isPendingDelete) ||
                other.isPendingDelete == isPendingDelete) &&
            (identical(other.attempts, attempts) ||
                other.attempts == attempts));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    createdAt,
    updatedAt,
    deletedAt,
    isPending,
    isPendingDelete,
    attempts,
  );

  /// Create a copy of EntityMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EntityMetaImplCopyWith<_$EntityMetaImpl> get copyWith =>
      __$$EntityMetaImplCopyWithImpl<_$EntityMetaImpl>(this, _$identity);
}

abstract class _EntityMeta implements EntityMeta {
  const factory _EntityMeta({
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final DateTime? deletedAt,
    final bool isPending,
    final bool isPendingDelete,
    final int attempts,
  }) = _$EntityMetaImpl;

  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  DateTime? get deletedAt;
  @override
  bool get isPending;
  @override
  bool get isPendingDelete;
  @override
  int get attempts;

  /// Create a copy of EntityMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EntityMetaImplCopyWith<_$EntityMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
