import 'package:injectable/injectable.dart';

import '../../core.dart';
import 'data_sources/profile_setting_local_data_source.dart';
import 'data_sources/profile_setting_remote_data_source.dart';
import 'dtos/profile_setting_dto.dart';

@lazySingleton
class ProfileSettingDataManager extends DataManager<ProfileSetting> with AutoSubscribe<ProfileSetting> {
  final OfflineFirstDataManager<ProfileSettingDto> _manager;

  ProfileSettingDataManager(DataManagerFactory dmf, ProfileSettingLocalDataSource lds, ProfileSettingRemoteDataSource rds)
    : _manager = dmf.createManager<ProfileSettingDto>(domainType: DomainType.profileSetting, localDataSource: lds, remoteDataSource: rds);

  @override
  Future<List<ProfileSetting>> loadAll({Map<String, dynamic>? filters}) async {
    final dtos = await _manager.loadAll(filters: filters);
    return _toEntities(dtos);
  }

  @override
  Stream<List<ProfileSetting>> watch() => _manager.stream.map((dtos) => _toEntities(dtos));

  void dispose() => _manager.dispose();

  Future<void> reset() => _manager.reset();

  List<ProfileSetting> _toEntities(List<ProfileSettingDto> dtos) => dtos.map((dto) => ProfileSetting.fromDto(dto)).toList();
}
