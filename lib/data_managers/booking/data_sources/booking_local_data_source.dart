import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../dtos/booking_dto.dart';
import '../dtos/booking_suggestion_dto.dart';

@lazySingleton
class BookingLocalDataSource extends LocalDataSource<BookingDto> {
  BookingLocalDataSource(super.db);

  @override
  String get table => "booking";

  @override
  String? get defaultOrderBy => "date DESC, updated_at DESC";

  @override
  BookingDto fromJson(Map<String, dynamic> json) => BookingDto.fromJson(json);

  Future<List<BookingSuggestionDto>> getSuggestions() async {
    final rows = await db.rawQuery('''
      WITH ranked AS (
        SELECT 
          b.description AS suggestion,
          c.category_type,
          b.updated_at AS max_updated,
          ROW_NUMBER() OVER (PARTITION BY b.description ORDER BY b.updated_at DESC) AS rn
        FROM $table AS b
        JOIN category AS c ON b.category_id = c.id
        WHERE b.description IS NOT NULL AND LENGTH(b.description) > 0
      )
      SELECT suggestion, category_type, max_updated
      FROM ranked
      WHERE rn = 1
      ORDER BY max_updated DESC
    ''');

    return rows.map((json) => BookingSuggestionDto.fromJson(json)).toList();
  }
}
