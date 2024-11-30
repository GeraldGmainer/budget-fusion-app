import '../entities/entities.dart';

abstract class BookingRepo {
  // Future<List<Booking>> getBookings({required DateTime fromDate, required DateTime toDate});
  Future<List<Booking>> getBookings();
}
