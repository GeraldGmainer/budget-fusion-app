import '../../enums/entity_type.dart';
import '../models/dto.dart';
import 'local_data_source.dart';
import 'remote_data_source.dart';

class DataSourceAdapter<E extends Dto> {
  final EntityType type;
  final LocalDataSource<E> local;
  final RemoteDataSource<E> remote;

  const DataSourceAdapter({
    required this.type,
    required this.local,
    required this.remote,
  });
}
