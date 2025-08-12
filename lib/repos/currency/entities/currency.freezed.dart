// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Currency {
  Uuid get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get decimalPrecision => throw _privateConstructorUsedError;
  bool get unitPositionFront => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  int? get uiOrder => throw _privateConstructorUsedError;
  bool get isSynced => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrencyCopyWith<Currency> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyCopyWith<$Res> {
  factory $CurrencyCopyWith(Currency value, $Res Function(Currency) then) =
      _$CurrencyCopyWithImpl<$Res, Currency>;
  @useResult
  $Res call({
    Uuid id,
    String name,
    int decimalPrecision,
    bool unitPositionFront,
    String symbol,
    int? uiOrder,
    bool isSynced,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  });
}

/// @nodoc
class _$CurrencyCopyWithImpl<$Res, $Val extends Currency>
    implements $CurrencyCopyWith<$Res> {
  _$CurrencyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? decimalPrecision = null,
    Object? unitPositionFront = null,
    Object? symbol = null,
    Object? uiOrder = freezed,
    Object? isSynced = null,
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
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            decimalPrecision:
                null == decimalPrecision
                    ? _value.decimalPrecision
                    : decimalPrecision // ignore: cast_nullable_to_non_nullable
                        as int,
            unitPositionFront:
                null == unitPositionFront
                    ? _value.unitPositionFront
                    : unitPositionFront // ignore: cast_nullable_to_non_nullable
                        as bool,
            symbol:
                null == symbol
                    ? _value.symbol
                    : symbol // ignore: cast_nullable_to_non_nullable
                        as String,
            uiOrder:
                freezed == uiOrder
                    ? _value.uiOrder
                    : uiOrder // ignore: cast_nullable_to_non_nullable
                        as int?,
            isSynced:
                null == isSynced
                    ? _value.isSynced
                    : isSynced // ignore: cast_nullable_to_non_nullable
                        as bool,
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
}

/// @nodoc
abstract class _$$CurrencyImplCopyWith<$Res>
    implements $CurrencyCopyWith<$Res> {
  factory _$$CurrencyImplCopyWith(
    _$CurrencyImpl value,
    $Res Function(_$CurrencyImpl) then,
  ) = __$$CurrencyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Uuid id,
    String name,
    int decimalPrecision,
    bool unitPositionFront,
    String symbol,
    int? uiOrder,
    bool isSynced,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  });
}

/// @nodoc
class __$$CurrencyImplCopyWithImpl<$Res>
    extends _$CurrencyCopyWithImpl<$Res, _$CurrencyImpl>
    implements _$$CurrencyImplCopyWith<$Res> {
  __$$CurrencyImplCopyWithImpl(
    _$CurrencyImpl _value,
    $Res Function(_$CurrencyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? decimalPrecision = null,
    Object? unitPositionFront = null,
    Object? symbol = null,
    Object? uiOrder = freezed,
    Object? isSynced = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(
      _$CurrencyImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as Uuid,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        decimalPrecision:
            null == decimalPrecision
                ? _value.decimalPrecision
                : decimalPrecision // ignore: cast_nullable_to_non_nullable
                    as int,
        unitPositionFront:
            null == unitPositionFront
                ? _value.unitPositionFront
                : unitPositionFront // ignore: cast_nullable_to_non_nullable
                    as bool,
        symbol:
            null == symbol
                ? _value.symbol
                : symbol // ignore: cast_nullable_to_non_nullable
                    as String,
        uiOrder:
            freezed == uiOrder
                ? _value.uiOrder
                : uiOrder // ignore: cast_nullable_to_non_nullable
                    as int?,
        isSynced:
            null == isSynced
                ? _value.isSynced
                : isSynced // ignore: cast_nullable_to_non_nullable
                    as bool,
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

class _$CurrencyImpl extends _Currency {
  const _$CurrencyImpl({
    required this.id,
    required this.name,
    required this.decimalPrecision,
    required this.unitPositionFront,
    required this.symbol,
    this.uiOrder,
    required this.isSynced,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  }) : super._();

  @override
  final Uuid id;
  @override
  final String name;
  @override
  final int decimalPrecision;
  @override
  final bool unitPositionFront;
  @override
  final String symbol;
  @override
  final int? uiOrder;
  @override
  final bool isSynced;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'Currency(id: $id, name: $name, decimalPrecision: $decimalPrecision, unitPositionFront: $unitPositionFront, symbol: $symbol, uiOrder: $uiOrder, isSynced: $isSynced, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.decimalPrecision, decimalPrecision) ||
                other.decimalPrecision == decimalPrecision) &&
            (identical(other.unitPositionFront, unitPositionFront) ||
                other.unitPositionFront == unitPositionFront) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.uiOrder, uiOrder) || other.uiOrder == uiOrder) &&
            (identical(other.isSynced, isSynced) ||
                other.isSynced == isSynced) &&
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
    name,
    decimalPrecision,
    unitPositionFront,
    symbol,
    uiOrder,
    isSynced,
    createdAt,
    updatedAt,
    deletedAt,
  );

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencyImplCopyWith<_$CurrencyImpl> get copyWith =>
      __$$CurrencyImplCopyWithImpl<_$CurrencyImpl>(this, _$identity);
}

abstract class _Currency extends Currency {
  const factory _Currency({
    required final Uuid id,
    required final String name,
    required final int decimalPrecision,
    required final bool unitPositionFront,
    required final String symbol,
    final int? uiOrder,
    required final bool isSynced,
    required final DateTime? createdAt,
    required final DateTime? updatedAt,
    required final DateTime? deletedAt,
  }) = _$CurrencyImpl;
  const _Currency._() : super._();

  @override
  Uuid get id;
  @override
  String get name;
  @override
  int get decimalPrecision;
  @override
  bool get unitPositionFront;
  @override
  String get symbol;
  @override
  int? get uiOrder;
  @override
  bool get isSynced;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  DateTime? get deletedAt;

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrencyImplCopyWith<_$CurrencyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
