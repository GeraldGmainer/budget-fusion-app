import 'package:injectable/injectable.dart';

import '../../core.dart';
import 'data_sources/profile_setting_local_data_source.dart';
import 'data_sources/profile_setting_remote_data_source.dart';
import 'dtos/profile_setting_dto.dart';

@singleton
class ProfileSettingDataManager extends DataManager<ProfileSetting> with AutoSubscribe<ProfileSetting> {
  final OfflineFirstDataManager<ProfileSettingDto> _manager;

  ProfileSettingDataManager(DataManagerFactory dmf, ProfileSettingLocalDataSource lds, ProfileSettingRemoteDataSource rds)
    : _manager = dmf.createManager<ProfileSettingDto>(entityType: EntityType.profileSetting, localDataSource: lds, remoteDataSource: rds);

  @override
  Future<List<ProfileSetting>> loadAll({Map<String, dynamic>? filters}) async {
    final dtos = await _manager.loadAll(filters: filters);
    return _toEntities(dtos);
  }

  @override
  Stream<List<ProfileSetting>> watch() => _manager.stream.map((dtos) => _toEntities(dtos));

  Future<Currency> getCurrency() => getAll().then((settings) => settings.first.currency);

  void dispose() => _manager.dispose();

  Future<void> reset() => _manager.reset();

  List<ProfileSetting> _toEntities(List<SyncedDto<ProfileSettingDto>> dtos) => dtos.map((dto) => ProfileSetting.fromDto(dto.dto, isSynced: dto.isSynced)).toList();
}
