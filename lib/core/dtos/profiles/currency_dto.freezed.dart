// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CurrencyDto _$CurrencyDtoFromJson(Map<String, dynamic> json) {
  return _CurrencyDto.fromJson(json);
}

/// @nodoc
mixin _$CurrencyDto {
  Uuid get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'decimal_precision')
  int get decimalPrecision => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_position_front')
  bool get unitPositionFront => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  int? get uiOrder => throw _privateConstructorUsedError;

  /// Serializes this CurrencyDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CurrencyDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrencyDtoCopyWith<CurrencyDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyDtoCopyWith<$Res> {
  factory $CurrencyDtoCopyWith(
          CurrencyDto value, $Res Function(CurrencyDto) then) =
      _$CurrencyDtoCopyWithImpl<$Res, CurrencyDto>;
  @useResult
  $Res call(
      {Uuid id,
      String name,
      @JsonKey(name: 'decimal_precision') int decimalPrecision,
      @JsonKey(name: 'unit_position_front') bool unitPositionFront,
      String symbol,
      int? uiOrder});
}

/// @nodoc
class _$CurrencyDtoCopyWithImpl<$Res, $Val extends CurrencyDto>
    implements $CurrencyDtoCopyWith<$Res> {
  _$CurrencyDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrencyDto
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
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as Uuid,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      decimalPrecision: null == decimalPrecision
          ? _value.decimalPrecision
          : decimalPrecision // ignore: cast_nullable_to_non_nullable
              as int,
      unitPositionFront: null == unitPositionFront
          ? _value.unitPositionFront
          : unitPositionFront // ignore: cast_nullable_to_non_nullable
              as bool,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      uiOrder: freezed == uiOrder
          ? _value.uiOrder
          : uiOrder // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrencyDtoImplCopyWith<$Res>
    implements $CurrencyDtoCopyWith<$Res> {
  factory _$$CurrencyDtoImplCopyWith(
          _$CurrencyDtoImpl value, $Res Function(_$CurrencyDtoImpl) then) =
      __$$CurrencyDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Uuid id,
      String name,
      @JsonKey(name: 'decimal_precision') int decimalPrecision,
      @JsonKey(name: 'unit_position_front') bool unitPositionFront,
      String symbol,
      int? uiOrder});
}

/// @nodoc
class __$$CurrencyDtoImplCopyWithImpl<$Res>
    extends _$CurrencyDtoCopyWithImpl<$Res, _$CurrencyDtoImpl>
    implements _$$CurrencyDtoImplCopyWith<$Res> {
  __$$CurrencyDtoImplCopyWithImpl(
      _$CurrencyDtoImpl _value, $Res Function(_$CurrencyDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurrencyDto
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
  }) {
    return _then(_$CurrencyDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as Uuid,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      decimalPrecision: null == decimalPrecision
          ? _value.decimalPrecision
          : decimalPrecision // ignore: cast_nullable_to_non_nullable
              as int,
      unitPositionFront: null == unitPositionFront
          ? _value.unitPositionFront
          : unitPositionFront // ignore: cast_nullable_to_non_nullable
              as bool,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      uiOrder: freezed == uiOrder
          ? _value.uiOrder
          : uiOrder // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CurrencyDtoImpl extends _CurrencyDto {
  const _$CurrencyDtoImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'decimal_precision') required this.decimalPrecision,
      @JsonKey(name: 'unit_position_front') this.unitPositionFront = true,
      required this.symbol,
      this.uiOrder})
      : super._();

  factory _$CurrencyDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrencyDtoImplFromJson(json);

  @override
  final Uuid id;
  @override
  final String name;
  @override
  @JsonKey(name: 'decimal_precision')
  final int decimalPrecision;
  @override
  @JsonKey(name: 'unit_position_front')
  final bool unitPositionFront;
  @override
  final String symbol;
  @override
  final int? uiOrder;

  @override
  String toString() {
    return 'CurrencyDto(id: $id, name: $name, decimalPrecision: $decimalPrecision, unitPositionFront: $unitPositionFront, symbol: $symbol, uiOrder: $uiOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrencyDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.decimalPrecision, decimalPrecision) ||
                other.decimalPrecision == decimalPrecision) &&
            (identical(other.unitPositionFront, unitPositionFront) ||
                other.unitPositionFront == unitPositionFront) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.uiOrder, uiOrder) || other.uiOrder == uiOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, decimalPrecision,
      unitPositionFront, symbol, uiOrder);

  /// Create a copy of CurrencyDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrencyDtoImplCopyWith<_$CurrencyDtoImpl> get copyWith =>
      __$$CurrencyDtoImplCopyWithImpl<_$CurrencyDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrencyDtoImplToJson(
      this,
    );
  }
}

abstract class _CurrencyDto extends CurrencyDto {
  const factory _CurrencyDto(
      {required final Uuid id,
      required final String name,
      @JsonKey(name: 'decimal_precision') required final int decimalPrecision,
      @JsonKey(name: 'unit_position_front') final bool unitPositionFront,
      required final String symbol,
      final int? uiOrder}) = _$CurrencyDtoImpl;
  const _CurrencyDto._() : super._();

  factory _CurrencyDto.fromJson(Map<String, dynamic> json) =
      _$CurrencyDtoImpl.fromJson;

  @override
  Uuid get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'decimal_precision')
  int get decimalPrecision;
  @override
  @JsonKey(name: 'unit_position_front')
  bool get unitPositionFront;
  @override
  String get symbol;
  @override
  int? get uiOrder;

  /// Create a copy of CurrencyDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrencyDtoImplCopyWith<_$CurrencyDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
