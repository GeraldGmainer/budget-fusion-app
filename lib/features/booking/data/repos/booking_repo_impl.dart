import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../data_sources/booking_local_data_source.dart';
import '../data_sources/booking_remote_data_source.dart';
import '../dtos/booking_dto.dart';

@LazySingleton(as: BookingRepo)
class BookingRepoImpl extends OfflineFirstListRepo<Booking, BookingDto> implements BookingRepo {
  final AccountRepo _accountRepo;
  final CategoryRepo _categoryRepo;

  BookingRepoImpl(
    DataManagerFactory dmf,
    BookingLocalDataSource lds,
    BookingRemoteDataSource rds,
    this._accountRepo,
    this._categoryRepo,
  ) : super(DomainType.booking, dmf, lds, rds);

  @override
  Stream<List<Booking>> watch() {
    return Rx.combineLatest3<List<BookingDto>, List<Account>, List<Category>, List<Booking>>(
      manager.stream,
      _accountRepo.watch(),
      _categoryRepo.watch(),
      (bookingDtos, accounts, categories) {
        return bookingDtos.map((dto) {
          final account = accounts.firstWhere((acc) => acc.id == dto.accountId);
          final category = categories.firstWhere((cat) => cat.id == dto.categoryId);
          return Booking(
            id: dto.id,
            userId: dto.userId,
            date: dto.date,
            description: dto.description,
            amount: dto.amount,
            account: account,
            category: category,
            updatedAt: dto.updatedAt,
          );
        }).toList();
      },
    );
  }

  @override
  BookingDto toDto(Booking entity) {
    return BookingDto(
      id: entity.id,
      userId: entity.userId,
      date: entity.date,
      description: entity.description,
      amount: entity.amount,
      accountId: entity.account.id,
      categoryId: entity.category.id,
      updatedAt: entity.updatedAt,
    );
  }

  @override
  Booking toDomain(BookingDto dto) {
    throw UnimplementedError('Use the watch() method for aggregated bookings.');
  }
}
