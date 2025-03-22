import 'dart:convert';

import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import 'data_sources/profile_local_data_source.dart';
import 'data_sources/profile_remote_data_source.dart';
import 'dtos/profile_dto.dart';

// TODO remove
@lazySingleton
class ProfileQueueItemProcessor implements QueueItemProcessor {
  final ProfileRemoteDataSource remoteSource;
  final ProfileLocalDataSource localDataSource;

  ProfileQueueItemProcessor(this.remoteSource, this.localDataSource);

  // TODO enum for the domains? better way to handle the queue item processor
  @override
  String get domainKey => "profile";

  @override
  Future<void> processItem(QueueItem item) async {
    final jsonMap = jsonDecode(item.entityPayload) as Map<String, dynamic>;

    switch (item.type) {
      case QueueTaskType.upsert:
        final dto = ProfileDto.fromJson(jsonMap);
        final savedDto = await remoteSource.upsert(dto);
        await localDataSource.markAsSynced(savedDto.id.value, savedDto.updatedAt);
        break;

      case QueueTaskType.delete:
        final entityId = jsonMap["id"] as String;
        await remoteSource.delete(entityId);
        break;
    }
  }
}
