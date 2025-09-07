import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/core.dart';

part 'currency_dto.freezed.dart';
part 'currency_dto.g.dart';

@freezed
abstract class CurrencyDto with _$CurrencyDto implements Dto {
  const CurrencyDto._();

  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory CurrencyDto({
    @UuidSerializer() required Uuid id,
    required String name,
    required int decimalPrecision,
    @BoolIntSerializer() required bool unitPositionFront,
    required String symbol,
    int? uiOrder,
    @SyncStatusSerializer() required SyncStatus? syncStatus,
    @DateTimeSerializer() required DateTime? createdAt,
    @DateTimeSerializer() required DateTime? updatedAt,
    @DateTimeSerializer() required DateTime? deletedAt,
  }) = _CurrencyDto;

  factory CurrencyDto.fromJson(Map<String, dynamic> json) => _$CurrencyDtoFromJson(json);
}
