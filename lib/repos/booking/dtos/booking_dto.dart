import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_dto.freezed.dart';
part 'booking_dto.g.dart';

@freezed
abstract class BookingDto with _$BookingDto implements Dto {
  const BookingDto._();

  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory BookingDto({
    @UuidSerializer() required Uuid id,
    @DateSerializer() required DateTime date,
    String? description,
    @DecimalConverter() required Decimal amount,
    @UuidSerializer() required Uuid categoryId,
    @UuidSerializer() required Uuid accountId,
    @SyncStatusSerializer() required SyncStatus? syncStatus,
    @DateTimeSerializer() required DateTime? createdAt,
    @DateTimeSerializer() required DateTime? updatedAt,
  }) = _BookingDto;

  factory BookingDto.fromJson(Map<String, dynamic> json) => _$BookingDtoFromJson(json);
}
