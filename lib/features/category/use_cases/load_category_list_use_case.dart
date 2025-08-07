import 'package:injectable/injectable.dart';

import '../../../core/core.dart';
import '../../../data_managers/category/category.dart';

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
