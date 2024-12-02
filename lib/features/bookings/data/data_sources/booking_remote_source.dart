import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/logging/logger.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';

@lazySingleton
class BookingRemoteSource extends SupabaseClient {
  Future<List<BookingDto>> fetchBookings({DateTime? from, DateTime? to}) async {
    return execute("fetchBookings", () async {
      BudgetLogger.instance.i("load booking by from: $from / to: $to");
      var query = supabase.from('bookings').select('id, booking_date, description, amount, category_id, account_id, is_deleted');

      if (from != null) {
        String fromIso = from.toIso8601String();
        query = query.gt('booking_date', fromIso);
      }

      if (to != null) {
        String toIso = to.toIso8601String();
        query = query.lte('booking_date', toIso);
      }

      final response = await query.order('booking_date', ascending: true);
      return List.from(response).map((item) => BookingDto.fromJson(item)).toList();
    });
  }
}
