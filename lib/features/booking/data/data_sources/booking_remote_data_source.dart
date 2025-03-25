import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../dtos/booking_dto.dart';

@lazySingleton
class BookingRemoteDataSource extends OfflineFirstRemoteDataSource<BookingDto> {
  @override
  String get table => 'bookings';

  @override
  String get columns => 'id, user_id, date, description, amount, category_id, account_id, updated_at';

  @override
  BookingDto toDto(Map<String, dynamic> json) {
    return BookingDto.fromJson(json);
  }
}
