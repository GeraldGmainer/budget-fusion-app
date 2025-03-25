import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../dtos/booking_dto.dart';

@lazySingleton
class BookingLocalDataSource extends OfflineFirstLocalDataSource<BookingDto> {
  BookingLocalDataSource(super.db);

  @override
  String get table => "bookings";

  @override
  BookingDto fromJson(Map<String, dynamic> json) => BookingDto.fromJson(json);
}
