import '../enums/entity_type.dart';
import 'offline_first/data_sources/offline_first_local_data_source.dart';
import 'offline_first/data_sources/offline_first_remote_data_source.dart';
import 'offline_first/models/offline_first_dto.dart';

class DomainSyncAdapter<Dto extends OfflineFirstDto> {
  final EntityType type;
  final OfflineFirstLocalDataSource<Dto> local;
  final OfflineFirstRemoteDataSource<Dto> remote;

  const DomainSyncAdapter({
    required this.type,
    required this.local,
    required this.remote,
  });
}
