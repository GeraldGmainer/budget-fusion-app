abstract class OfflineFirstLocalDataSource<Dto> {
  Future<List<Dto>> fetchAll({Map<String, dynamic>? filters});

  Future<Dto?> fetchById(String id);

  Future<void> save(Dto dto);

  Future<void> saveAll(List<Dto> dtos);

  Future<DateTime?> fetchMaxUpdatedAt();

  Future<void> markAsSynced(String id, DateTime updated);
}
