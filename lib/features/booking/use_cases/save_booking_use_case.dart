import 'package:budget_fusion_app/features/booking/domain/entities/booking_draft.dart';
import 'package:injectable/injectable.dart';

import '../../../repos/booking/booking.dart';
import '../../../repos/profile/profile.dart';

@lazySingleton
class SaveBookingUseCase {
  final BookingRepo _bookingRepo;
  final ProfileRepo _profileRepo;

  SaveBookingUseCase(this._bookingRepo, this._profileRepo);

  Future<void> save(BookingDraft draft) async {
    final currency = (await _profileRepo.getSetting()).currency;
    if (draft.description != null) {
      draft = draft.copyWith(description: draft.description!.trim());
    }
    await _bookingRepo.save(draft.toBooking(currency));
  }
}
