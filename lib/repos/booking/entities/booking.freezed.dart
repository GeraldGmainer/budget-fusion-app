// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Booking {
  Uuid get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  Money get money => throw _privateConstructorUsedError;
  Category get category => throw _privateConstructorUsedError;
  Account get account => throw _privateConstructorUsedError;
  SyncStatus? get syncStatus => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingCopyWith<Booking> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingCopyWith<$Res> {
  factory $BookingCopyWith(Booking value, $Res Function(Booking) then) =
      _$BookingCopyWithImpl<$Res, Booking>;
  @useResult
  $Res call({
    Uuid id,
    DateTime date,
    String? description,
    Money money,
    Category category,
    Account account,
    SyncStatus? syncStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  });

  $MoneyCopyWith<$Res> get money;
  $CategoryCopyWith<$Res> get category;
  $AccountCopyWith<$Res> get account;
}

/// @nodoc
class _$BookingCopyWithImpl<$Res, $Val extends Booking>
    implements $BookingCopyWith<$Res> {
  _$BookingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? description = freezed,
    Object? money = null,
    Object? category = null,
    Object? account = null,
    Object? syncStatus = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as Uuid,
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
            money:
                null == money
                    ? _value.money
                    : money // ignore: cast_nullable_to_non_nullable
                        as Money,
            category:
                null == category
                    ? _value.category
                    : category // ignore: cast_nullable_to_non_nullable
                        as Category,
            account:
                null == account
                    ? _value.account
                    : account // ignore: cast_nullable_to_non_nullable
                        as Account,
            syncStatus:
                freezed == syncStatus
                    ? _value.syncStatus
                    : syncStatus // ignore: cast_nullable_to_non_nullable
                        as SyncStatus?,
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

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MoneyCopyWith<$Res> get money {
    return $MoneyCopyWith<$Res>(_value.money, (value) {
      return _then(_value.copyWith(money: value) as $Val);
    });
  }

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res> get category {
    return $CategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccountCopyWith<$Res> get account {
    return $AccountCopyWith<$Res>(_value.account, (value) {
      return _then(_value.copyWith(account: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BookingImplCopyWith<$Res> implements $BookingCopyWith<$Res> {
  factory _$$BookingImplCopyWith(
    _$BookingImpl value,
    $Res Function(_$BookingImpl) then,
  ) = __$$BookingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Uuid id,
    DateTime date,
    String? description,
    Money money,
    Category category,
    Account account,
    SyncStatus? syncStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  });

  @override
  $MoneyCopyWith<$Res> get money;
  @override
  $CategoryCopyWith<$Res> get category;
  @override
  $AccountCopyWith<$Res> get account;
}

/// @nodoc
class __$$BookingImplCopyWithImpl<$Res>
    extends _$BookingCopyWithImpl<$Res, _$BookingImpl>
    implements _$$BookingImplCopyWith<$Res> {
  __$$BookingImplCopyWithImpl(
    _$BookingImpl _value,
    $Res Function(_$BookingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? description = freezed,
    Object? money = null,
    Object? category = null,
    Object? account = null,
    Object? syncStatus = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(
      _$BookingImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as Uuid,
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
        money:
            null == money
                ? _value.money
                : money // ignore: cast_nullable_to_non_nullable
                    as Money,
        category:
            null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                    as Category,
        account:
            null == account
                ? _value.account
                : account // ignore: cast_nullable_to_non_nullable
                    as Account,
        syncStatus:
            freezed == syncStatus
                ? _value.syncStatus
                : syncStatus // ignore: cast_nullable_to_non_nullable
                    as SyncStatus?,
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

class _$BookingImpl extends _Booking {
  const _$BookingImpl({
    required this.id,
    required this.date,
    required this.description,
    required this.money,
    required this.category,
    required this.account,
    this.syncStatus,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  }) : super._();

  @override
  final Uuid id;
  @override
  final DateTime date;
  @override
  final String? description;
  @override
  final Money money;
  @override
  final Category category;
  @override
  final Account account;
  @override
  final SyncStatus? syncStatus;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'Booking(id: $id, date: $date, description: $description, money: $money, category: $category, account: $account, syncStatus: $syncStatus, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.money, money) || other.money == money) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.syncStatus, syncStatus) ||
                other.syncStatus == syncStatus) &&
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
    money,
    category,
    account,
    syncStatus,
    createdAt,
    updatedAt,
    deletedAt,
  );

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingImplCopyWith<_$BookingImpl> get copyWith =>
      __$$BookingImplCopyWithImpl<_$BookingImpl>(this, _$identity);
}

abstract class _Booking extends Booking {
  const factory _Booking({
    required final Uuid id,
    required final DateTime date,
    required final String? description,
    required final Money money,
    required final Category category,
    required final Account account,
    final SyncStatus? syncStatus,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final DateTime? deletedAt,
  }) = _$BookingImpl;
  const _Booking._() : super._();

  @override
  Uuid get id;
  @override
  DateTime get date;
  @override
  String? get description;
  @override
  Money get money;
  @override
  Category get category;
  @override
  Account get account;
  @override
  SyncStatus? get syncStatus;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  DateTime? get deletedAt;

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingImplCopyWith<_$BookingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
