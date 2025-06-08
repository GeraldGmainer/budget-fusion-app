import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core.dart';

part 'currency_dto.freezed.dart';
part 'currency_dto.g.dart';

@freezed
class CurrencyDto with _$CurrencyDto {
  const CurrencyDto._();

  const factory CurrencyDto({
    @UuidSerializer() required Uuid id,
    required String name,
    @JsonKey(name: 'decimal_precision') required int decimalPrecision,
    @JsonKey(name: 'unit_position_front') @Default(true) bool unitPositionFront,
    required String symbol,
    int? uiOrder,
  }) = _CurrencyDto;

  factory CurrencyDto.fromJson(Map<String, dynamic> json) => _$CurrencyDtoFromJson(json);
}
