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
class ProfileDataManager extends DataManager<Profile> with AutoSubscribe<Profile> {
  late final OfflineFirstDataManager<ProfileDto> _manager;
  late final Stream<List<Profile>> _sharedStream;
  final CurrencyDataManager _currencyDataManager;

  ProfileDataManager(DataManagerFactory dmf, ProfileLocalDataSource lds, ProfileRemoteDataSource rds, this._currencyDataManager)
    : _manager = dmf.createManager<ProfileDto>(entityType: EntityType.profile, localDataSource: lds, remoteDataSource: rds);

  @override
  void setupStreams() {
    _sharedStream = Rx.combineLatest2<List<SyncedDto<ProfileDto>>, List<Currency>, List<Profile>>(
      _manager.stream,
      _currencyDataManager.watch(),
      (profileDtos, currencies) => _mapProfiles(profileDtos, currencies),
    ).debounceTime(FeatureConstants.mapperDebounceDuration).shareReplay(maxSize: 1);
    super.setupStreams();
  }

  List<Profile> _mapProfiles(List<SyncedDto<ProfileDto>> profileDtos, List<Currency> currencies) {
    return profileDtos.map((dto) {
      EntityLogger.instance.d("DataManager", EntityType.profile.text, "mapping Profile with ${currencies.length} currencies");
      final email = supabase.auth.currentUser?.email ?? "unknown email";
      final currency = currencies.firstWhereOrNull((c) => c.id == dto.dto.settingDto.currencyId) ?? Currency.notFound();
      return Profile.fromDto(dto.dto, email: email, isSynced: dto.isSynced, currency: currency);
    }).toList();
  }

  @override
  Future<List<Profile>> loadAll({Map<String, dynamic>? filters}) async {
    await _manager.loadAll(filters: filters);
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
