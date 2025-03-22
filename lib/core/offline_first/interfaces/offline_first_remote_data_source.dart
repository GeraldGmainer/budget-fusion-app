import 'dart:async';

import '../models/offline_first_dto.dart';

abstract class OfflineFirstRemoteDataSource<Dto> {
  String get table;

  String get columns;

  Future<List<Dto>> fetchAll({Map<String, dynamic>? filters});

  Future<List<Dto>> fetchAllNewer(DateTime? updatedAt, {Map<String, dynamic>? filters});

  Future<Dto> fetchById(String id);

  Future<OfflineFirstDto> upsert(Dto dto);

  Future<void> upsertAll(List<Dto> dtos);

  Future<void> delete(String id);
}
