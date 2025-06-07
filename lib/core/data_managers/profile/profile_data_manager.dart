import 'package:injectable/injectable.dart';

import '../../core.dart';
import 'data_sources/profile_local_data_source.dart';
import 'data_sources/profile_remote_data_source.dart';
import 'dtos/profile_dto.dart';

// TODO rename it to my profile repo or active profile repo? because later, need to load multiple profiles. Also need correctly map the email to entity
@lazySingleton
class ProfileDataManager extends DataManager<Profile> with AutoSubscribe<Profile> {
  late final OfflineFirstDataManager<ProfileDto> _manager;

  ProfileDataManager(DataManagerFactory dmf, ProfileLocalDataSource lds, ProfileRemoteDataSource rds)
    : _manager = dmf.createManager<ProfileDto>(domainType: DomainType.profile, localDataSource: lds, remoteDataSource: rds);

  @override
  Future<List<Profile>> loadAll({Map<String, dynamic>? filters}) async {
    final dtos = await _manager.loadAll(filters: filters);
    return _toEntities(dtos);
  }

  @override
  Stream<List<Profile>> watch() => _manager.stream.map((dtos) => _toEntities(dtos));

  void dispose() => _manager.dispose();

  Future<void> reset() => _manager.reset();

  List<Profile> _toEntities(List<ProfileDto> dtos) {
    final email = supabase.auth.currentUser?.email ?? "unknown email";
    return dtos.map((dto) => Profile.fromDto(dto, email)).toList();
  }
}
