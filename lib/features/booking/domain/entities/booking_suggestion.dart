import '../../../../core/core.dart';
import '../../../../data_managers/booking/dtos/booking_suggestion_dto.dart';

class BookingSuggestion {
  final String suggestion;
  final CategoryType categoryType;

  BookingSuggestion(this.suggestion, this.categoryType);

  factory BookingSuggestion.fromDto(BookingSuggestionDto dto) => BookingSuggestion(dto.suggestion, dto.categoryType);

  @override
  String toString() => 'BookingSuggestion(suggestion: $suggestion / categoryType: $categoryType)';
}
