import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core.dart';
import '../dtos/currency_dto.dart';

part 'currency.freezed.dart';

@freezed
class Currency with _$Currency implements Entity {
  const Currency._();

  const factory Currency({
    required Uuid id,
    required String name,
    required int decimalPrecision,
    required bool unitPositionFront,
    required String symbol,
    int? uiOrder,
    required bool isSynced,
  }) = _Currency;

  factory Currency.fromDto(CurrencyDto dto, {required bool isSynced}) {
    return Currency(
      id: dto.id,
      name: dto.name,
      decimalPrecision: dto.decimalPrecision,
      unitPositionFront: dto.unitPositionFront,
      symbol: dto.symbol,
      uiOrder: dto.uiOrder,
      isSynced: isSynced,
    );
  }

  // TODO load currency from offline only database
  factory Currency.notFound() {
    return Currency(id: Uuid.generate(), name: "not found", decimalPrecision: 2, symbol: "€", unitPositionFront: false, uiOrder: 1, isSynced: true);
  }

  CurrencyDto toDto() {
    return CurrencyDto(id: id, name: name, decimalPrecision: decimalPrecision, unitPositionFront: unitPositionFront, symbol: symbol, uiOrder: uiOrder, updatedAt: DateTime.now());
  }
}
