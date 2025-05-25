import 'package:budget_fusion_app/core/core.dart';

abstract class BookingRepo {
  Stream<List<Booking>> watch();

  Future<void> loadAll({Map<String, dynamic>? filters});

  Future<void> save(Booking entity);

  Future<void> delete(Booking entity);

  Future<void> reset();

  void dispose();
}
