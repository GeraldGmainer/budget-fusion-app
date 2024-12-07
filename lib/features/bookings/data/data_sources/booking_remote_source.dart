import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:injectable/injectable.dart';

import '../dtos/dtos.dart';

@lazySingleton
class BookingRemoteSource extends SupabaseClient {
  Future<List<BookingDto>> fetchBookings({DateTime? from, DateTime? to}) async {
    final extraInfo = _getExtraDebugInfo(from: from, to: to);
    return execute("fetchBookings", extraInfo: extraInfo, () async {
      var query = supabase.from('bookings').select('id, booking_date, description, amount, category_id, account_id, is_deleted');
      final extraInfo = StringBuffer();

      if (from != null) {
        final fromIso = from.toIso8601String();
        query = query.gte('booking_date', fromIso);
        extraInfo.write("from $fromIso");
      }
      if (to != null) {
        final toIso = to.toIso8601String();
        query = query.lte('booking_date', toIso);
        extraInfo.write("to $toIso");
      }

      final response = await query.order('booking_date', ascending: true);
      return List.from(response).map((item) => BookingDto.fromJson(item)).toList();
    });
  }

  String? _getExtraDebugInfo({DateTime? from, DateTime? to}) {
    if (from != null && to != null) {
      final fromStr = DateTimeConverter.toYYYYMMdd(from);
      final toStr = DateTimeConverter.toYYYYMMdd(to);
      return "from $fromStr to $toStr";
    } else if (from != null) {
      final fromStr = DateTimeConverter.toYYYYMMdd(from);
      return "from $fromStr";
    } else if (to != null) {
      final toStr = DateTimeConverter.toYYYYMMdd(to);
      return "to $toStr";
    }
    return null;
  }
}
