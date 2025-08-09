import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/core.dart';

part 'currency_dto.freezed.dart';
part 'currency_dto.g.dart';

@freezed
class CurrencyDto with _$CurrencyDto implements Dto {
  const CurrencyDto._();

  const factory CurrencyDto({
    @UuidSerializer() required Uuid id,
    @DateTimeSerializer() @JsonKey(name: 'updated_at') required DateTime updatedAt,
    required String name,
    @JsonKey(name: 'decimal_precision') required int decimalPrecision,
    @BoolIntSerializer() @JsonKey(name: 'unit_position_front') required bool unitPositionFront,
    required String symbol,
    @JsonKey(name: 'ui_order') int? uiOrder,
  }) = _CurrencyDto;

  factory CurrencyDto.fromJson(Map<String, dynamic> json) => _$CurrencyDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$$CurrencyDtoImplToJson(this as _$CurrencyDtoImpl);
}
