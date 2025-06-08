import 'package:injectable/injectable.dart';

import '../../../core/core.dart';

@lazySingleton
class LoadCategoryListUseCase {
  final CategoryDataManager _manager;

  LoadCategoryListUseCase(this._manager);

  Future<List<Category>> load(bool clearCache) async {
    if (clearCache) {
      await _manager.reset();
    }
    return await _manager.loadAll();
  }
}
