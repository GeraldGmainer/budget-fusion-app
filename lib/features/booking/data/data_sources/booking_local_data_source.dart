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
      SELECT b.description AS suggestion, c.category_type
      FROM $table AS b
      JOIN category AS c ON b.category_id = c.id
      INNER JOIN (
        SELECT description, MAX(updated_at) as max_updated
        FROM $table
        WHERE description IS NOT NULL AND LENGTH(description) > 0
        GROUP BY description
      ) latest ON b.description = latest.description AND b.updated_at = latest.max_updated
      ORDER BY b.updated_at DESC
    ''');

    return rows.map((json) => BookingSuggestionDto.fromJson(json)).toList();
  }
}
