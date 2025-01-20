import '../../core.dart';

abstract class BookingRepo {
  Future<List<Booking>> getBookings({DateTime? from, DateTime? to});

  Future<bool> hasBookingsBefore(DateTime date);
}
