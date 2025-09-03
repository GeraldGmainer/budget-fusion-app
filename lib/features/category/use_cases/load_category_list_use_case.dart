import 'package:injectable/injectable.dart';

import '../../../core/core.dart';
import '../../../repos/category/category.dart';

@lazySingleton
class LoadCategoryListUseCase {
  final CategoryRepo _repo;
  final QueueManager _queueManager;

  LoadCategoryListUseCase(this._repo, this._queueManager);

  Future<void> load(bool clearCache) async {
    if (clearCache) {
      await _repo.reset();
    }
    await _repo.loadAll();
    await _queueManager.wakePausedItemsAndProcess();
  }

  Stream<List<Category>> watch() => _repo.watch();
}
