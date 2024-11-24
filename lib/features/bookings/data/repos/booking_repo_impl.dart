import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../data_sources/data_sources.dart';
import '../dtos/dtos.dart';

@LazySingleton(as: BookingRepo)
class BookingRepoImpl implements BookingRepo {
  static const Duration cacheDuration = Duration(minutes: 5);
  final _cache = InMemoryCache<List<Booking>>(cacheDuration: cacheDuration);
  final BookingRemoteSource _bookingRemoteSource;
  final CategoryRepo _categoryRepo;
  final AccountRepo _accountRepo;

  BookingRepoImpl(this._bookingRemoteSource, this._categoryRepo, this._accountRepo);

  @override
  Future<List<Booking>> getBookings() async {
    return await _cache.fetch(() async {
      final results = await Future.wait([
        _bookingRemoteSource.fetchAllBookings(),
        _categoryRepo.getCategories(),
        _accountRepo.getAccounts(),
      ]);

      final bookingDtos = results[0] as List<BookingDto>;
      final categories = results[1] as List<Category>;
      final accounts = results[2] as List<Account>;
      final categoriesMap = {for (var value in categories) value.id: value};
      final accountsMap = {for (var value in accounts) value.id: value};

      final bookings = bookingDtos.map((dto) {
        final category = categoriesMap[dto.categoryId];
        final account = accountsMap[dto.accountId];

        if (category == null || account == null) {
          // TODO Exception
          throw Exception('Category or Account not found for Booking ID: ${dto.id}');
        }

        return dto.toDomain(category, account);
      }).toList();

      return bookings;
    });
  }
}
