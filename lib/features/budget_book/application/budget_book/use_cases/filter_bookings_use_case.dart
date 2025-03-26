import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../../domain/entities/budget_book_filter.dart';
import '../../../domain/entities/budget_page_data.dart';

@lazySingleton
class FilterBookingsUseCase {
  List<BudgetPageData> execute(List<BudgetPageData> datas, BudgetBookFilter filter) {
    return datas.map((pageData) {
      final filteredBookings = pageData.bookings.where((booking) => _filterBooking(booking, filter) != null).toList();

      return pageData.copyWith(
        bookings: filteredBookings,
        income: filteredBookings.incomeBookings.totalAmount,
        outcome: filteredBookings.outcomeBookings.totalAmount,
      );
    }).toList();
  }

  Booking? _filterBooking(Booking booking, BudgetBookFilter filter) {
    if (filter.account?.id != booking.account?.id) {
      return null;
    }
    final requiredCategoryType = (filter.transaction == TransactionType.income) ? CategoryType.income : CategoryType.outcome;
    if (requiredCategoryType != booking.category?.categoryType) {
      return null;
    }
    final hasDescription = filter.description != null && filter.description!.isNotEmpty;
    if (hasDescription && !filter.description!.toLowerCase().contains(booking.description?.toLowerCase() ?? '')) {
      return null;
    }
    return booking;
  }
}
