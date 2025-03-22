abstract class OfflineFirstListRepo<T> {
  Stream<List<T>> watch();

  Future<void> loadAll();

  Future<void> save(T entity);

  Future<void> delete(T entity);

  void dispose();
}
