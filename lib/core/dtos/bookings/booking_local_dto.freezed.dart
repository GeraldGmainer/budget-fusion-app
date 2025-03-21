// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_local_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookingLocalDto {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'booking_date')
  DateTime get bookingDate => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @DecimalConverter()
  Decimal get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_id')
  int get accountId => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of BookingLocalDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingLocalDtoCopyWith<BookingLocalDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingLocalDtoCopyWith<$Res> {
  factory $BookingLocalDtoCopyWith(
          BookingLocalDto value, $Res Function(BookingLocalDto) then) =
      _$BookingLocalDtoCopyWithImpl<$Res, BookingLocalDto>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'booking_date') DateTime bookingDate,
      String? description,
      @DecimalConverter() Decimal amount,
      @JsonKey(name: 'category_id') int categoryId,
      @JsonKey(name: 'account_id') int accountId,
      DateTime updatedAt});
}

/// @nodoc
class _$BookingLocalDtoCopyWithImpl<$Res, $Val extends BookingLocalDto>
    implements $BookingLocalDtoCopyWith<$Res> {
  _$BookingLocalDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookingLocalDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bookingDate = null,
    Object? description = freezed,
    Object? amount = null,
    Object? categoryId = null,
    Object? accountId = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      bookingDate: null == bookingDate
          ? _value.bookingDate
          : bookingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Decimal,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingLocalDtoImplCopyWith<$Res>
    implements $BookingLocalDtoCopyWith<$Res> {
  factory _$$BookingLocalDtoImplCopyWith(_$BookingLocalDtoImpl value,
          $Res Function(_$BookingLocalDtoImpl) then) =
      __$$BookingLocalDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'booking_date') DateTime bookingDate,
      String? description,
      @DecimalConverter() Decimal amount,
      @JsonKey(name: 'category_id') int categoryId,
      @JsonKey(name: 'account_id') int accountId,
      DateTime updatedAt});
}

/// @nodoc
class __$$BookingLocalDtoImplCopyWithImpl<$Res>
    extends _$BookingLocalDtoCopyWithImpl<$Res, _$BookingLocalDtoImpl>
    implements _$$BookingLocalDtoImplCopyWith<$Res> {
  __$$BookingLocalDtoImplCopyWithImpl(
      _$BookingLocalDtoImpl _value, $Res Function(_$BookingLocalDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookingLocalDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bookingDate = null,
    Object? description = freezed,
    Object? amount = null,
    Object? categoryId = null,
    Object? accountId = null,
    Object? updatedAt = null,
  }) {
    return _then(_$BookingLocalDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      bookingDate: null == bookingDate
          ? _value.bookingDate
          : bookingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Decimal,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$BookingLocalDtoImpl extends _BookingLocalDto {
  const _$BookingLocalDtoImpl(
      {required this.id,
      @JsonKey(name: 'booking_date') required this.bookingDate,
      this.description,
      @DecimalConverter() required this.amount,
      @JsonKey(name: 'category_id') required this.categoryId,
      @JsonKey(name: 'account_id') required this.accountId,
      required this.updatedAt})
      : super._();

  @override
  final String id;
  @override
  @JsonKey(name: 'booking_date')
  final DateTime bookingDate;
  @override
  final String? description;
  @override
  @DecimalConverter()
  final Decimal amount;
  @override
  @JsonKey(name: 'category_id')
  final int categoryId;
  @override
  @JsonKey(name: 'account_id')
  final int accountId;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'BookingLocalDto(id: $id, bookingDate: $bookingDate, description: $description, amount: $amount, categoryId: $categoryId, accountId: $accountId, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingLocalDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bookingDate, bookingDate) ||
                other.bookingDate == bookingDate) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, bookingDate, description,
      amount, categoryId, accountId, updatedAt);

  /// Create a copy of BookingLocalDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingLocalDtoImplCopyWith<_$BookingLocalDtoImpl> get copyWith =>
      __$$BookingLocalDtoImplCopyWithImpl<_$BookingLocalDtoImpl>(
          this, _$identity);
}

abstract class _BookingLocalDto extends BookingLocalDto {
  const factory _BookingLocalDto(
      {required final String id,
      @JsonKey(name: 'booking_date') required final DateTime bookingDate,
      final String? description,
      @DecimalConverter() required final Decimal amount,
      @JsonKey(name: 'category_id') required final int categoryId,
      @JsonKey(name: 'account_id') required final int accountId,
      required final DateTime updatedAt}) = _$BookingLocalDtoImpl;
  const _BookingLocalDto._() : super._();

  @override
  String get id;
  @override
  @JsonKey(name: 'booking_date')
  DateTime get bookingDate;
  @override
  String? get description;
  @override
  @DecimalConverter()
  Decimal get amount;
  @override
  @JsonKey(name: 'category_id')
  int get categoryId;
  @override
  @JsonKey(name: 'account_id')
  int get accountId;
  @override
  DateTime get updatedAt;

  /// Create a copy of BookingLocalDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingLocalDtoImplCopyWith<_$BookingLocalDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
