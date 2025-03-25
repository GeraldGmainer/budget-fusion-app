import 'dart:async';

import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchBookingsUseCase {
  final BookingRepo _bookingRepo;

  WatchBookingsUseCase(this._bookingRepo);

  Stream<List<Booking>> call() {
    return _bookingRepo.watch();
  }
}
