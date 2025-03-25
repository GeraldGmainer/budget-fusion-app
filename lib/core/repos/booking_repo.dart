import 'package:budget_fusion_app/core/core.dart';

abstract class BookingRepo {
  Stream<List<Booking>> watch();

  Future<void> loadAll();

  Future<void> save(Booking entity);

  void dispose();
}
