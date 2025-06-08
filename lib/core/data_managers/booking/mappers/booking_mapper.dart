import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';

import '../../../../utils/utils.dart';
import '../../../core.dart';
import '../dtos/booking_dto.dart';

@lazySingleton
class BookingMapper {
  final Set<Uuid> _missingAccountIds = {};
  final Set<Uuid> _missingCategoryIds = {};

  List<Booking> mapBookings(List<BookingDto> bookingDtos, List<Account> accounts, List<Category> categories, List<QueueItem> pendingItems) {
    return bookingDtos.map((dto) {
      Account? account = accounts.firstWhereOrNull((acc) => acc.id == dto.accountId);
      final category = _findCategory(categories, dto.categoryId);
      final bool isSynced = !pendingItems.any((q) => q.entityId == dto.id.value);

      if (account == null && _missingAccountIds.add(dto.accountId)) {
        BudgetLogger.instance.e('Null Account', 'No Account found for id ${dto.accountId} in booking ${dto.id}');
      }
      if (category == null && _missingCategoryIds.add(dto.categoryId)) {
        BudgetLogger.instance.e('Null Category', 'No Category found for id ${dto.categoryId} in booking ${dto.id}');
      }

      return Booking.fromDto(dto, account ?? Account.notFound(), category ?? Category.notFound(), isSynced);
    }).toList();
  }

  Category? _findCategory(List<Category> list, Uuid id) {
    for (final c in list) {
      if (c.id == id) return c;
      final found = _findCategory(c.subcategories, id);
      if (found != null) return found;
    }
    return null;
  }
}
