import 'package:budget_fusion_app/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_suggestion_dto.freezed.dart';
part 'booking_suggestion_dto.g.dart';

@freezed
abstract class BookingSuggestionDto with _$BookingSuggestionDto {
  const BookingSuggestionDto._();

  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory BookingSuggestionDto({
    required String suggestion,
    @CategoryTypeSerializer() required CategoryType categoryType,
  }) = _BookingSuggestionDto;

  factory BookingSuggestionDto.fromJson(Map<String, dynamic> json) => _$BookingSuggestionDtoFromJson(json);
}
