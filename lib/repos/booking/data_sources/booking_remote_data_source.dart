import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../dtos/booking_dto.dart';

@lazySingleton
class BookingRemoteDataSource extends RemoteDataSource<BookingDto> {
  @override
  String get table => 'booking';

  @override
  String get columns => 'id, date, description, amount, category_id, account_id, created_at, updated_at, deleted_at';

  @override
  String get deleteRpcName => 'booking_delete';

  @override
  BookingDto toDto(Map<String, dynamic> json) => BookingDto.fromJson(json);
}
