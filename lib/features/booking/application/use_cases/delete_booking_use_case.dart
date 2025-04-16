import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteBookingUseCase {
  final BookingRepo bookingRepo;

  DeleteBookingUseCase(this.bookingRepo);

  Future<void> call(Booking booking) async {
    await bookingRepo.delete(booking);
  }
}
