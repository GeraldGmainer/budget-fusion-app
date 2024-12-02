import '../entities/entities.dart';

abstract class BookingRepo {
  Future<List<Booking>> getBookings({DateTime? from, DateTime? to});
}
