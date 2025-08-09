import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../features/booking/domain/entities/booking_suggestion.dart';
import '../../core/core.dart';
import '../account/account.dart';
import '../category/category.dart';
import '../profile/profile.dart';
import 'data_sources/booking_local_data_source.dart';
import 'data_sources/booking_remote_data_source.dart';
import 'dtos/booking_dto.dart';
import 'entities/booking.dart';
import 'mappers/booking_mapper.dart';

@singleton
class BookingRepo extends Repo<Booking> with AutoSubscribe<Booking> {
  late final OfflineFirstDataManager<BookingDto> _manager;
  final AccountRepo _accountRepo;
  final CategoryRepo _categoryRepo;
  final ProfileRepo _profileRepo;
  final BookingMapper _mapper;
  final BookingLocalDataSource _lds;
  late final Stream<List<Booking>> _sharedStream;

  BookingRepo(DataManagerFactory dmf, this._lds, BookingRemoteDataSource rds, this._mapper, this._accountRepo, this._categoryRepo, this._profileRepo) {
    _manager = dmf.createManager<BookingDto>(entityType: EntityType.booking, localDataSource: _lds, remoteDataSource: rds);
  }

  @override
  void setupStreams() {
    _sharedStream = Rx.combineLatest4<List<SyncedDto<BookingDto>>, List<Account>, List<Category>, List<Profile>, List<Booking>>(
      _manager.stream,
      _accountRepo.watch(),
      _categoryRepo.watch(),
      _profileRepo.watch().startWith([]).where((profiles) => profiles.isNotEmpty),
      (bookingDtos, accounts, categories, profiles) => _mapper.mapBookings(bookingDtos, accounts, categories, profiles),
    ).debounceTime(FeatureConstants.mapperDebounceDuration).shareReplay(maxSize: 1);
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

  Future<void> delete(Booking booking) async => await _manager.delete(booking.toDto());

  Future<void> save(Booking booking) async => await _manager.save(booking.toDto());

  Future<List<BookingSuggestion>> loadSuggestions() async => (await _lds.getSuggestions()).map((dto) => BookingSuggestion.fromDto(dto)).toList();
}
