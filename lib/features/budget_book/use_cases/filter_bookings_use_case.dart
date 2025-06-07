import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../view_models/budget_book_filter.dart';

@lazySingleton
class FilterBookingsUseCase {
  List<Booking> execute(List<Booking> bookings, BudgetBookFilter filter) {
    return bookings.where((booking) => _filterBooking(booking, filter) != null).toList();
  }

  Booking? _filterBooking(Booking booking, BudgetBookFilter filter) {
    if (filter.account?.id != booking.account.id) {
      return null;
    }
    final requiredCategoryType = (filter.transaction == TransactionType.income) ? CategoryType.income : CategoryType.outcome;
    if (requiredCategoryType != booking.category.categoryType) {
      return null;
    }
    final hasDescription = filter.description != null && filter.description!.isNotEmpty;
    if (hasDescription && !filter.description!.toLowerCase().contains(booking.description?.toLowerCase() ?? '')) {
      return null;
    }
    return booking;
  }
}
