import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';

@lazySingleton
class BookingRemoteSource extends SupabaseClient {
  Future<List<BookingDto>> fetchAllBookings() async {
    return execute("fetchAllBookings", () async {
      final response = await supabase
          .from('bookings')
          .select('id, booking_date, description, amount, category_id, account_id, is_deleted')
          .order('booking_date', ascending: true);
      return List.from(response).map((item) => BookingDto.fromJson(item)).toList();
    });
  }
}
