// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BookingDto _$BookingDtoFromJson(Map<String, dynamic> json) {
  return _BookingDto.fromJson(json);
}

/// @nodoc
mixin _$BookingDto {
  @UuidSerializer()
  Uuid get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'date')
  @DateSerializer()
  DateTime get date => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @DecimalConverter()
  Decimal get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  @UuidSerializer()
  Uuid get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_id')
  @UuidSerializer()
  Uuid get accountId => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  @DateTimeSerializer()
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this BookingDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BookingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingDtoCopyWith<BookingDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingDtoCopyWith<$Res> {
  factory $BookingDtoCopyWith(
    BookingDto value,
    $Res Function(BookingDto) then,
  ) = _$BookingDtoCopyWithImpl<$Res, BookingDto>;
  @useResult
  $Res call({
    @UuidSerializer() Uuid id,
    @JsonKey(name: 'date') @DateSerializer() DateTime date,
    String? description,
    @DecimalConverter() Decimal amount,
    @JsonKey(name: 'category_id') @UuidSerializer() Uuid categoryId,
    @JsonKey(name: 'account_id') @UuidSerializer() Uuid accountId,
    @JsonKey(name: 'updated_at') @DateTimeSerializer() DateTime updatedAt,
  });
}

/// @nodoc
class _$BookingDtoCopyWithImpl<$Res, $Val extends BookingDto>
    implements $BookingDtoCopyWith<$Res> {
  _$BookingDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookingDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? description = freezed,
    Object? amount = null,
    Object? categoryId = null,
    Object? accountId = null,
    Object? updatedAt = null,
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
            amount:
                null == amount
                    ? _value.amount
                    : amount // ignore: cast_nullable_to_non_nullable
                        as Decimal,
            categoryId:
                null == categoryId
                    ? _value.categoryId
                    : categoryId // ignore: cast_nullable_to_non_nullable
                        as Uuid,
            accountId:
                null == accountId
                    ? _value.accountId
                    : accountId // ignore: cast_nullable_to_non_nullable
                        as Uuid,
            updatedAt:
                null == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BookingDtoImplCopyWith<$Res>
    implements $BookingDtoCopyWith<$Res> {
  factory _$$BookingDtoImplCopyWith(
    _$BookingDtoImpl value,
    $Res Function(_$BookingDtoImpl) then,
  ) = __$$BookingDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @UuidSerializer() Uuid id,
    @JsonKey(name: 'date') @DateSerializer() DateTime date,
    String? description,
    @DecimalConverter() Decimal amount,
    @JsonKey(name: 'category_id') @UuidSerializer() Uuid categoryId,
    @JsonKey(name: 'account_id') @UuidSerializer() Uuid accountId,
    @JsonKey(name: 'updated_at') @DateTimeSerializer() DateTime updatedAt,
  });
}

/// @nodoc
class __$$BookingDtoImplCopyWithImpl<$Res>
    extends _$BookingDtoCopyWithImpl<$Res, _$BookingDtoImpl>
    implements _$$BookingDtoImplCopyWith<$Res> {
  __$$BookingDtoImplCopyWithImpl(
    _$BookingDtoImpl _value,
    $Res Function(_$BookingDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookingDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? description = freezed,
    Object? amount = null,
    Object? categoryId = null,
    Object? accountId = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$BookingDtoImpl(
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
        amount:
            null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                    as Decimal,
        categoryId:
            null == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                    as Uuid,
        accountId:
            null == accountId
                ? _value.accountId
                : accountId // ignore: cast_nullable_to_non_nullable
                    as Uuid,
        updatedAt:
            null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingDtoImpl extends _BookingDto {
  const _$BookingDtoImpl({
    @UuidSerializer() required this.id,
    @JsonKey(name: 'date') @DateSerializer() required this.date,
    this.description,
    @DecimalConverter() required this.amount,
    @JsonKey(name: 'category_id') @UuidSerializer() required this.categoryId,
    @JsonKey(name: 'account_id') @UuidSerializer() required this.accountId,
    @JsonKey(name: 'updated_at') @DateTimeSerializer() required this.updatedAt,
  }) : super._();

  factory _$BookingDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingDtoImplFromJson(json);

  @override
  @UuidSerializer()
  final Uuid id;
  @override
  @JsonKey(name: 'date')
  @DateSerializer()
  final DateTime date;
  @override
  final String? description;
  @override
  @DecimalConverter()
  final Decimal amount;
  @override
  @JsonKey(name: 'category_id')
  @UuidSerializer()
  final Uuid categoryId;
  @override
  @JsonKey(name: 'account_id')
  @UuidSerializer()
  final Uuid accountId;
  @override
  @JsonKey(name: 'updated_at')
  @DateTimeSerializer()
  final DateTime updatedAt;

  @override
  String toString() {
    return 'BookingDto(id: $id, date: $date, description: $description, amount: $amount, categoryId: $categoryId, accountId: $accountId, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    date,
    description,
    amount,
    categoryId,
    accountId,
    updatedAt,
  );

  /// Create a copy of BookingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingDtoImplCopyWith<_$BookingDtoImpl> get copyWith =>
      __$$BookingDtoImplCopyWithImpl<_$BookingDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingDtoImplToJson(this);
  }
}

abstract class _BookingDto extends BookingDto {
  const factory _BookingDto({
    @UuidSerializer() required final Uuid id,
    @JsonKey(name: 'date') @DateSerializer() required final DateTime date,
    final String? description,
    @DecimalConverter() required final Decimal amount,
    @JsonKey(name: 'category_id')
    @UuidSerializer()
    required final Uuid categoryId,
    @JsonKey(name: 'account_id')
    @UuidSerializer()
    required final Uuid accountId,
    @JsonKey(name: 'updated_at')
    @DateTimeSerializer()
    required final DateTime updatedAt,
  }) = _$BookingDtoImpl;
  const _BookingDto._() : super._();

  factory _BookingDto.fromJson(Map<String, dynamic> json) =
      _$BookingDtoImpl.fromJson;

  @override
  @UuidSerializer()
  Uuid get id;
  @override
  @JsonKey(name: 'date')
  @DateSerializer()
  DateTime get date;
  @override
  String? get description;
  @override
  @DecimalConverter()
  Decimal get amount;
  @override
  @JsonKey(name: 'category_id')
  @UuidSerializer()
  Uuid get categoryId;
  @override
  @JsonKey(name: 'account_id')
  @UuidSerializer()
  Uuid get accountId;
  @override
  @JsonKey(name: 'updated_at')
  @DateTimeSerializer()
  DateTime get updatedAt;

  /// Create a copy of BookingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingDtoImplCopyWith<_$BookingDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
