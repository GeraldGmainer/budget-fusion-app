import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../data_sources/booking_local_data_source.dart';
import '../data_sources/booking_remote_data_source.dart';
import '../dtos/booking_dto.dart';

@Singleton(as: BookingRepo)
class BookingRepoImpl extends OfflineFirstListRepo<Booking, BookingDto> implements BookingRepo {
  final AccountRepo _accountRepo;
  final CategoryRepo _categoryRepo;
  late final Stream<List<Booking>> _sharedBookingsStream;
  final Set<Uuid> _missingAccountIds = {};
  final Set<Uuid> _missingCategoryIds = {};

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
    _sharedBookingsStream = Rx.combineLatest4<List<BookingDto>, List<Account>, List<Category>, List<QueueItem>, List<Booking>>(
      manager.stream,
      _accountRepo.watch(),
      _categoryRepo.watch(),
      manager.pendingItemsStream,
      (bookingDtos, accounts, categories, pendingItems) {
        return bookingDtos.map((dto) {
          final Account? account = accounts.firstWhereOrNull((acc) => acc.id == dto.accountId);
          final Category? category = categories.firstWhereOrNull((cat) => cat.id == dto.categoryId);
          final bool isSynced = !pendingItems.any((q) => q.entityId == dto.id.value);

          if (account == null && _missingAccountIds.add(dto.accountId)) {
            BudgetLogger.instance.e('Null Account', 'No Account found for id ${dto.accountId} in booking ${dto.id}');
          }
          if (category == null && _missingCategoryIds.add(dto.categoryId)) {
            BudgetLogger.instance.e('Null Category', 'No Category found for id ${dto.categoryId} in booking ${dto.id}');
          }

          return _toDomain(dto, account, category, isSynced);
        }).toList();
      },
    ).shareReplay(maxSize: 1);
  }

  @override
  Future<Booking> toEntity(BookingDto dto) async {
    final account = await _accountRepo.loadById(dto.accountId);
    final category = await _categoryRepo.loadById(dto.categoryId);
    final isSynced = manager.isSynced(dto.id.value);
    return _toDomain(dto, account, category, isSynced);
  }

  Booking _toDomain(BookingDto dto, Account? account, Category? category, bool isSynced) {
    return Booking(
      id: dto.id,
      date: dto.date,
      description: dto.description,
      amount: dto.amount,
      account: account,
      category: category,
      updatedAt: dto.updatedAt,
      isSynced: isSynced,
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
      // TODO is it OK to leave isSynced as false?
    );
  }
}
