abstract class OfflineFirstSingleRepo<T> {
  Stream<T> watch();

  Future<void> load();

  Future<void> save(T dto);

  void dispose();
}
