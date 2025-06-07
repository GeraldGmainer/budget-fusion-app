import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_suggestion_dto.freezed.dart';
part 'booking_suggestion_dto.g.dart';

@freezed
class BookingSuggestionDto with _$BookingSuggestionDto {
  const BookingSuggestionDto._();

  const factory BookingSuggestionDto({
    required String suggestion,
    @JsonKey(name: 'category_type') @CategoryTypeSerializer() required CategoryType categoryType,
  }) = _BookingSuggestionDto;

  factory BookingSuggestionDto.fromJson(Map<String, dynamic> json) => _$BookingSuggestionDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$$BookingSuggestionDtoImplToJson(this as _$BookingSuggestionDtoImpl);
}
