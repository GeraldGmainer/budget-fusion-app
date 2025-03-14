import 'dart:async';

import '../models/offline_first_remote_dto.dart';

abstract class OfflineFirstRemoteDataSource<Entity, RemoteDto> {
  String get table;

  String get columns;

  Future<List<RemoteDto>> fetchAll();

  Future<List<RemoteDto>> fetchAllNewer(DateTime? updatedAt);

  Future<RemoteDto> fetchById(String id);

  Future<OfflineFirstRemoteDto> upsert(RemoteDto dto);

  Future<void> upsertAll(List<RemoteDto> dtos);

  Future<void> delete(String id);
}
