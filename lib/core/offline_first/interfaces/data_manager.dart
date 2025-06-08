import 'dart:async';

abstract class DataManager<T> {
  Future<List<T>> loadAll({Map<String, dynamic>? filters});

  Stream<List<T>> watch();

  Future<List<T>> getAll() => watch().first;

  void setupStreams();

  Future<void> disposeStreams();
}

mixin AutoSubscribe<T> on DataManager<T> {
  late final StreamSubscription<List<T>> _sub;

  @override
  void setupStreams() {
    // kick off the watch() stream so it fires its local + remote sync
    _sub = watch().listen((_) {});
  }

  @override
  Future<void> disposeStreams() async {
    await _sub.cancel();
  }
}
