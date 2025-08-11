// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_draft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BookingDraft {
  Uuid? get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  Decimal get amount => throw _privateConstructorUsedError;
  Category? get category => throw _privateConstructorUsedError;
  Account? get account => throw _privateConstructorUsedError;
  CategoryType get categoryType => throw _privateConstructorUsedError;
  SyncMeta? get syncMeta => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Create a copy of BookingDraft
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingDraftCopyWith<BookingDraft> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingDraftCopyWith<$Res> {
  factory $BookingDraftCopyWith(
    BookingDraft value,
    $Res Function(BookingDraft) then,
  ) = _$BookingDraftCopyWithImpl<$Res, BookingDraft>;
  @useResult
  $Res call({
    Uuid? id,
    DateTime date,
    String? description,
    Decimal amount,
    Category? category,
    Account? account,
    CategoryType categoryType,
    SyncMeta? syncMeta,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  });

  $CategoryCopyWith<$Res>? get category;
  $AccountCopyWith<$Res>? get account;
}

/// @nodoc
class _$BookingDraftCopyWithImpl<$Res, $Val extends BookingDraft>
    implements $BookingDraftCopyWith<$Res> {
  _$BookingDraftCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookingDraft
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = null,
    Object? description = freezed,
    Object? amount = null,
    Object? category = freezed,
    Object? account = freezed,
    Object? categoryType = null,
    Object? syncMeta = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as Uuid?,
            date:
                null == date
                    ? _value.date
                    : date // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            description:
                freezed == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String?,
            amount:
                null == amount
                    ? _value.amount
                    : amount // ignore: cast_nullable_to_non_nullable
                        as Decimal,
            category:
                freezed == category
                    ? _value.category
                    : category // ignore: cast_nullable_to_non_nullable
                        as Category?,
            account:
                freezed == account
                    ? _value.account
                    : account // ignore: cast_nullable_to_non_nullable
                        as Account?,
            categoryType:
                null == categoryType
                    ? _value.categoryType
                    : categoryType // ignore: cast_nullable_to_non_nullable
                        as CategoryType,
            syncMeta:
                freezed == syncMeta
                    ? _value.syncMeta
                    : syncMeta // ignore: cast_nullable_to_non_nullable
                        as SyncMeta?,
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
          )
          as $Val,
    );
  }

  /// Create a copy of BookingDraft
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }

  /// Create a copy of BookingDraft
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccountCopyWith<$Res>? get account {
    if (_value.account == null) {
      return null;
    }

    return $AccountCopyWith<$Res>(_value.account!, (value) {
      return _then(_value.copyWith(account: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BookingDraftImplCopyWith<$Res>
    implements $BookingDraftCopyWith<$Res> {
  factory _$$BookingDraftImplCopyWith(
    _$BookingDraftImpl value,
    $Res Function(_$BookingDraftImpl) then,
  ) = __$$BookingDraftImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Uuid? id,
    DateTime date,
    String? description,
    Decimal amount,
    Category? category,
    Account? account,
    CategoryType categoryType,
    SyncMeta? syncMeta,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  });

  @override
  $CategoryCopyWith<$Res>? get category;
  @override
  $AccountCopyWith<$Res>? get account;
}

/// @nodoc
class __$$BookingDraftImplCopyWithImpl<$Res>
    extends _$BookingDraftCopyWithImpl<$Res, _$BookingDraftImpl>
    implements _$$BookingDraftImplCopyWith<$Res> {
  __$$BookingDraftImplCopyWithImpl(
    _$BookingDraftImpl _value,
    $Res Function(_$BookingDraftImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookingDraft
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = null,
    Object? description = freezed,
    Object? amount = null,
    Object? category = freezed,
    Object? account = freezed,
    Object? categoryType = null,
    Object? syncMeta = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(
      _$BookingDraftImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as Uuid?,
        date:
            null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        description:
            freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String?,
        amount:
            null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                    as Decimal,
        category:
            freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                    as Category?,
        account:
            freezed == account
                ? _value.account
                : account // ignore: cast_nullable_to_non_nullable
                    as Account?,
        categoryType:
            null == categoryType
                ? _value.categoryType
                : categoryType // ignore: cast_nullable_to_non_nullable
                    as CategoryType,
        syncMeta:
            freezed == syncMeta
                ? _value.syncMeta
                : syncMeta // ignore: cast_nullable_to_non_nullable
                    as SyncMeta?,
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
      ),
    );
  }
}

/// @nodoc

class _$BookingDraftImpl extends _BookingDraft {
  _$BookingDraftImpl({
    this.id,
    required this.date,
    this.description,
    required this.amount,
    this.category,
    this.account,
    this.categoryType = CategoryType.outcome,
    this.syncMeta,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  }) : super._();

  @override
  final Uuid? id;
  @override
  final DateTime date;
  @override
  final String? description;
  @override
  final Decimal amount;
  @override
  final Category? category;
  @override
  final Account? account;
  @override
  @JsonKey()
  final CategoryType categoryType;
  @override
  final SyncMeta? syncMeta;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'BookingDraft(id: $id, date: $date, description: $description, amount: $amount, category: $category, account: $account, categoryType: $categoryType, syncMeta: $syncMeta, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingDraftImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.syncMeta, syncMeta) ||
                other.syncMeta == syncMeta) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    date,
    description,
    amount,
    category,
    account,
    categoryType,
    syncMeta,
    createdAt,
    updatedAt,
    deletedAt,
  );

  /// Create a copy of BookingDraft
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingDraftImplCopyWith<_$BookingDraftImpl> get copyWith =>
      __$$BookingDraftImplCopyWithImpl<_$BookingDraftImpl>(this, _$identity);
}

abstract class _BookingDraft extends BookingDraft {
  factory _BookingDraft({
    final Uuid? id,
    required final DateTime date,
    final String? description,
    required final Decimal amount,
    final Category? category,
    final Account? account,
    final CategoryType categoryType,
    final SyncMeta? syncMeta,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final DateTime? deletedAt,
  }) = _$BookingDraftImpl;
  _BookingDraft._() : super._();

  @override
  Uuid? get id;
  @override
  DateTime get date;
  @override
  String? get description;
  @override
  Decimal get amount;
  @override
  Category? get category;
  @override
  Account? get account;
  @override
  CategoryType get categoryType;
  @override
  SyncMeta? get syncMeta;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  DateTime? get deletedAt;

  /// Create a copy of BookingDraft
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingDraftImplCopyWith<_$BookingDraftImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
