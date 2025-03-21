import 'dart:async';

import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class LoadAggregatedBookingsUseCase {
  final BookingRepo _bookingRepo;
  final CategoryRepo _categoryRepo;
  final AccountRepo _accountRepo;

  LoadAggregatedBookingsUseCase(this._bookingRepo, this._categoryRepo, this._accountRepo);

  Stream<List<Booking>> call() {
    return Rx.combineLatest3<List<BookingLocalDto>, List<CategoryLocalDto>, List<AccountLocalDto>, List<Booking>>(
      _bookingRepo.watch(),
      _categoryRepo.watch(),
      _accountRepo.watch(),
      (bookingDtos, categoryDtos, accountDtos) {
        final categories = categoryDtos.map((dto) => dto.toDomain()).toList();
        final accounts = accountDtos.map((dto) => dto.toDomain()).toList();
        final bookings = bookingDtos.map((dto) {
          final category = categories.firstWhere((c) => c.id.toJson() == dto.categoryId, orElse: () => Category.fallback());
          final account = accounts.firstWhere((a) => a.id.toJson() == dto.accountId, orElse: () => Account.fallback());
          return dto.toDomain(category, account);
        }).toList();
        return bookings;
      },
    );
  }
}
