import 'package:budget_fusion_app/core/core.dart';
import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../data_sources/booking_local_data_source.dart';
import '../data_sources/booking_remote_data_source.dart';
import '../dtos/booking_dto.dart';

@LazySingleton(as: BookingRepo)
class BookingRepoImpl extends OfflineFirstListRepo<Booking, BookingDto> implements BookingRepo {
  final AccountRepo _accountRepo;
  final CategoryRepo _categoryRepo;
  late final Stream<List<Booking>> _sharedBookingsStream;

  BookingRepoImpl(
    DataManagerFactory dmf,
    BookingLocalDataSource lds,
    BookingRemoteDataSource rds,
    this._accountRepo,
    this._categoryRepo,
  ) : super(DomainType.booking, dmf, lds, rds) {
    _setupStream();
  }

  void _setupStream() {
    _sharedBookingsStream = Rx.combineLatest3<List<BookingDto>, List<Account>, List<Category>, List<Booking>>(
      manager.stream,
      _accountRepo.watch(),
      _categoryRepo.watch(),
      (bookingDtos, accounts, categories) {
        return bookingDtos.map((dto) {
          final account = accounts.firstWhereOrNull((acc) => acc.id == dto.accountId);
          final category = categories.firstWhereOrNull((cat) => cat.id == dto.categoryId);
          return _toDomain(dto, account, category);
        }).toList();
      },
    ).shareReplay(maxSize: 1);
  }

  @override
  Future<Booking> toEntity(BookingDto dto) async {
    final account = await _accountRepo.loadById(dto.accountId);
    final category = await _categoryRepo.loadById(dto.categoryId);
    return _toDomain(dto, account, category);
  }

  Booking _toDomain(BookingDto dto, Account? account, Category? category) {
    return Booking(
      id: dto.id,
      date: dto.date,
      description: dto.description,
      amount: dto.amount,
      account: account,
      category: category,
      updatedAt: dto.updatedAt,
    );
  }

  @override
  Stream<List<Booking>> watch() {
    return _sharedBookingsStream;
  }

  @override
  BookingDto toDto(Booking entity) {
    return BookingDto(
      id: entity.id,
      date: entity.date,
      description: entity.description,
      amount: entity.amount,
      accountId: entity.account!.id,
      categoryId: entity.category!.id,
      updatedAt: entity.updatedAt,
    );
  }
}
