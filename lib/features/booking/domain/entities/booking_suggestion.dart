import '../../../../core/core.dart';
import '../../../../repos/booking/dtos/booking_suggestion_dto.dart';

class BookingSuggestion {
  final String suggestion;
  final CategoryType categoryType;

  BookingSuggestion(this.suggestion, this.categoryType);

  factory BookingSuggestion.fromDto(BookingSuggestionDto dto) => BookingSuggestion(dto.suggestion, dto.categoryType);

  @override
  String toString() => 'BookingSuggestion(suggestion: $suggestion / categoryType: $categoryType)';
}
