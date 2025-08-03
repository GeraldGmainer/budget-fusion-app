import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../core.dart';
import 'data_sources/booking_local_data_source.dart';
import 'data_sources/booking_remote_data_source.dart';
import 'dtos/booking_dto.dart';
import 'mappers/booking_mapper.dart';

@singleton
class BookingDataManager extends DataManager<Booking> with AutoSubscribe<Booking> {
  late final OfflineFirstDataManager<BookingDto> _manager;
  final AccountDataManager _accountDataManager;
  final CategoryDataManager _categoryDataManager;
  final ProfileDataManager _profileDataManager;
  final BookingMapper _mapper;
  final BookingLocalDataSource _lds;
  late final Stream<List<Booking>> _sharedStream;

  BookingDataManager(DataManagerFactory dmf, this._lds, BookingRemoteDataSource rds, this._mapper, this._accountDataManager, this._categoryDataManager, this._profileDataManager) {
    _manager = dmf.createManager<BookingDto>(entityType: EntityType.booking, localDataSource: _lds, remoteDataSource: rds);
  }

  @override
  void setupStreams() {
    _sharedStream = Rx.combineLatest4<List<SyncedDto<BookingDto>>, List<Account>, List<Category>, List<Profile>, List<Booking>>(
      _manager.stream,
      _accountDataManager.watch(),
      _categoryDataManager.watch(),
      _profileDataManager.watch(),
      (bookingDtos, accounts, categories, profiles) => _mapper.mapBookings(bookingDtos, accounts, categories, profiles),
    ).debounceTime(const Duration(milliseconds: 100)).shareReplay(maxSize: 1);
    super.setupStreams();
  }

  @override
  Future<List<Booking>> loadAll({Map<String, dynamic>? filters}) async {
    await _manager.loadAll();
    return await _sharedStream.first;
  }

  @override
  Stream<List<Booking>> watch() => _sharedStream;

  Future<void> reset() => _manager.reset();

  Future<List<BookingSuggestion>> loadSuggestions() async => (await _lds.getSuggestions()).map((dto) => BookingSuggestion.fromDto(dto)).toList();

  Future<void> delete(Booking booking) async => await _manager.delete(booking.toDto());

  Future<void> save(Booking booking) async => await _manager.save(booking.toDto());
}
