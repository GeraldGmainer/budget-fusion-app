import 'package:budget_fusion_app/core/core.dart';

abstract class BookingRepo {
  Stream<List<BookingLocalDto>> watch();

  Future<void> loadAll();

  Future<void> save(BookingLocalDto dto);

  void dispose();
}
