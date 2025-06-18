import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../utils/utils.dart';
import '../../core.dart';
import 'data_sources/booking_local_data_source.dart';
import 'data_sources/booking_remote_data_source.dart';
import 'dtos/booking_dto.dart';
import 'mappers/booking_mapper.dart';

@singleton
class BookingDataManager extends DataManager<Booking> {
  late final OfflineFirstDataManager<BookingDto> _manager;
  final AccountDataManager _accountDataManager;
  final CategoryDataManager _categoryDataManager;
  final ProfileSettingDataManager _profileSettingDataManager;
  final BookingMapper _mapper;
  final BookingLocalDataSource _lds;
  late final Stream<List<Booking>> _sharedBookingsStream;
  late final StreamSubscription<List<Booking>> _sub;

  BookingDataManager(
    DataManagerFactory dmf,
    this._lds,
    BookingRemoteDataSource rds,
    this._mapper,
    this._accountDataManager,
    this._categoryDataManager,
    this._profileSettingDataManager,
  ) {
    _manager = dmf.createManager<BookingDto>(entityType: EntityType.booking, localDataSource: _lds, remoteDataSource: rds);
  }

  @override
  void setupStreams() {
    _sharedBookingsStream = Rx.combineLatest5<List<BookingDto>, List<Account>, List<Category>, List<ProfileSetting>, List<QueueItem>, List<Booking>>(
      _manager.stream,
      _accountDataManager.watch(),
      _categoryDataManager.watch(),
      _profileSettingDataManager.watch(),
      _manager.pendingItemsStream,
      (bookingDtos, accounts, categories, profileSettings, pendingItems) {
        final bookings = _mapper.mapBookings(bookingDtos, accounts, categories, profileSettings, pendingItems);
        EntityLogger.instance.d("DataManager", EntityType.booking.text, "Emitting ${EntityLogger.bold(bookings.length)} entities", darkColor: true);
        return bookings;
      },
    ).debounceTime(const Duration(milliseconds: 100)).shareReplay(maxSize: 1);

    _sub = watch().listen((_) {});
  }

  @override
  Future<void> disposeStreams() => _sub.cancel();

  @override
  Future<List<Booking>> loadAll({Map<String, dynamic>? filters}) async {
    await _manager.loadAll();
    return await _sharedBookingsStream.first;
  }

  @override
  Stream<List<Booking>> watch() => _sharedBookingsStream;

  Future<List<BookingSuggestion>> loadSuggestions() async => (await _lds.getSuggestions()).map((dto) => BookingSuggestion.fromDto(dto)).toList();

  Future<void> delete(Booking booking) async => await _manager.delete(booking.toDto());

  Future<void> save(Booking booking) async => await _manager.save(booking.toDto());

  void dispose() => _manager.dispose();

  Future<void> reset() => _manager.reset();
}
