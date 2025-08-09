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

  Future<void> applyRaw({
    required List<Map<String, dynamic>> upserts,
    required List<String> deletes,
  }) async {
    if (upserts.isNotEmpty) {
      final dtos = upserts.map(local.fromJson).toList();
      await local.saveAllNotSynced(List<E>.from(dtos));
    }
    for (final id in deletes) {
      await local.deleteById(id);
    }
  }

  List<E> fromJsons(List<Map<String, dynamic>> jsons) => jsons.map(local.fromJson).toList();

  E fromJson(Map<String, dynamic> json) => local.fromJson(json);
}
