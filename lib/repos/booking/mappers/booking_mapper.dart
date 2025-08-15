import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';

import '../../../../utils/utils.dart';
import '../../../core/core.dart';
import '../../account/account.dart';
import '../../category/category.dart';
import '../../currency/currency.dart';
import '../../profile/profile.dart';
import '../booking.dart';
import '../dtos/booking_dto.dart';

@lazySingleton
class BookingMapper {
  final Set<Uuid> _missingAccountIds = {};
  final Set<Uuid> _missingCategoryIds = {};
  bool _hasMissingCurrency = false;

  List<Booking> mapBookings(List<BookingDto> bookingDtos, List<Account> accounts, List<Category> categories, List<Profile> profiles) {
    _log(bookingDtos, accounts, categories);
    return bookingDtos.map((dto) {
      final account = accounts.firstWhereOrNull((acc) => acc.id == dto.accountId);
      final category = _findCategory(categories, dto.categoryId);
      final currency = profiles.firstOrNull?.setting.currency;

      if (account == null && _missingAccountIds.add(dto.accountId)) {
        BudgetLogger.instance.e('Null Account', 'No Account found for id ${dto.accountId} in booking ${dto.id}');
      }
      if (category == null && _missingCategoryIds.add(dto.categoryId)) {
        BudgetLogger.instance.e('Null Category', 'No Category found for id ${dto.categoryId} in booking ${dto.id}');
      }
      if (currency == null && !_hasMissingCurrency) {
        _hasMissingCurrency = true;
        BudgetLogger.instance.e('Null Currency', 'No Currency found in profile settings');
      }

      return Booking.fromDto(dto, account ?? Account.notFound(), category ?? Category.notFound(), currency ?? Currency.notFound());
    }).toList();
  }

  void _log(List<BookingDto> bookingDtos, List<Account> accounts, List<Category> categories) {
    EntityLogger.instance.d(
      "DataManager",
      EntityType.booking.text,
      "mapping ${EntityLogger.bold(bookingDtos.length)} bookings with ${accounts.length} accounts and ${categories.length} categories",
    );
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
