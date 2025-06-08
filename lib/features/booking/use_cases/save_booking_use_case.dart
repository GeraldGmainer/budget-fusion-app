import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/features/booking/domain/entities/booking_draft.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SaveBookingUseCase {
  final BookingDataManager _manager;

  SaveBookingUseCase(this._manager);

  Future<void> save(BookingDraft draft) async {
    if (draft.description != null) {
      draft = draft.copyWith(description: draft.description!.trim());
    }
    await _manager.save(draft.toBooking());
  }
}
