import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/features/booking/domain/entities/booking_draft.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SaveBookingUseCase {
  final BookingRepo bookingRepo;

  SaveBookingUseCase(this.bookingRepo);

  Future<void> call(BookingDraft draft) async {
    final userId = Uuid(supabase.auth.currentUser!.id);
    if (draft.description != null) {
      draft = draft.copyWith(description: draft.description!.trim());
    }
    await bookingRepo.save(draft.toBooking(userId));
  }
}
