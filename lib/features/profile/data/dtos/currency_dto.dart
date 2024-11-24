import 'package:budget_fusion_app/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_dto.freezed.dart';

part 'currency_dto.g.dart';

@freezed
class CurrencyDto with _$CurrencyDto {
  const CurrencyDto._();

  const factory CurrencyDto({
    required int id,
    required String name,
    @JsonKey(name: 'decimal_precision') required int decimalPrecision,
    @JsonKey(name: 'unit_position_front') @Default(true) bool unitPositionFront,
    required String symbol,
    int? uiOrder,
  }) = _CurrencyDto;

  factory CurrencyDto.fromJson(Map<String, dynamic> json) => _$CurrencyDtoFromJson(json);

  Currency toDomain() {
    return Currency(
      id: id,
      name: name,
      decimalPrecision: decimalPrecision,
      unitPositionFront: unitPositionFront,
      symbol: symbol,
      uiOrder: uiOrder,
    );
  }
}
