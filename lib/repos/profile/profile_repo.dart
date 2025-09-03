import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../core/core.dart';
import '../../utils/utils.dart';
import '../currency/currency.dart';
import 'data_sources/profile_local_data_source.dart';
import 'data_sources/profile_remote_data_source.dart';
import 'dtos/profile_dto.dart';
import 'entities/profile.dart';
import 'entities/profile_setting.dart';

@singleton
class ProfileRepo extends Repo<Profile> with AutoSubscribe<Profile> {
  late final OfflineFirstDataManager<ProfileDto> _manager;
  late final Stream<List<Profile>> _sharedStream;
  final CurrencyRepo _currencyRepo;

  ProfileRepo(DataManagerFactory dmf, ProfileLocalDataSource lds, ProfileRemoteDataSource rds, this._currencyRepo)
    : _manager = dmf.createManager<ProfileDto>(entityType: EntityType.profile, localDataSource: lds, remoteDataSource: rds);

  @override
  void setupStreams() {
    _sharedStream = Rx.combineLatest2<List<ProfileDto>, List<Currency>, List<Profile>>(
      _manager.stream,
      _currencyRepo.watch(),
      (profileDtos, currencies) => _mapProfiles(profileDtos, currencies),
    ).debounceTime(FeatureConstants.mapperDebounceDuration).shareReplay(maxSize: 1);
    super.setupStreams();
  }

  List<Profile> _mapProfiles(List<ProfileDto> profileDtos, List<Currency> currencies) {
    return profileDtos.map((dto) {
      EntityLogger.instance.d("DataManager", EntityType.profile.text, "mapping Profile with ${currencies.length} currencies");
      final email = supabase.auth.currentUser?.email ?? "unknown email";
      final currency = currencies.firstWhereOrNull((c) => c.id == dto.settingDto.currencyId) ?? Currency.notFound();
      return Profile.fromDto(dto, email: email, currency: currency);
    }).toList();
  }

  @override
  Future<List<Profile>> loadAll({Map<String, dynamic>? filters, bool clearStream = false, bool invalidateCache = false}) async {
    await _manager.loadAll(filters: filters, invalidateCache: invalidateCache);
    return await _sharedStream.first;
  }

  @override
  Stream<List<Profile>> watch() => _sharedStream;

  Future<void> reset() => _manager.reset();

  Future<ProfileSetting> getSetting() async {
    final profiles = await getAll();
    return profiles.first.setting;
  }
}
