abstract class OfflineFirstLocalDataSource<Entity, LocalDto> {
  Future<List<LocalDto>> fetchAll();

  Future<LocalDto?> fetchById(String id);

  Future<void> save(LocalDto dto);

  Future<void> saveAll(List<LocalDto> dtos);

  Future<DateTime?> fetchMaxUpdatedAt();

  Future<void> markAsSynced(String id, DateTime updated);
}
