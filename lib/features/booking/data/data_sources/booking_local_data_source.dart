import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../dtos/booking_dto.dart';
import '../dtos/booking_suggestion_dto.dart';

@lazySingleton
class BookingLocalDataSource extends OfflineFirstLocalDataSource<BookingDto> {
  BookingLocalDataSource(super.db);

  @override
  String get table => "booking";

  @override
  String? get defaultOrderBy => "date DESC";

  @override
  BookingDto fromJson(Map<String, dynamic> json) => BookingDto.fromJson(json);

  Future<List<BookingSuggestionDto>> getSuggestions() async {
    final rows = await db.rawQuery('''
      SELECT DISTINCT b.description AS suggestion, c.category_type
      FROM $table AS b
      JOIN category AS c ON b.category_id = c.id
      WHERE b.description IS NOT NULL
      AND LENGTH(b.description) > 0
    ''');

    return rows.map((json) => BookingSuggestionDto.fromJson(json)).toList();
  }
}
