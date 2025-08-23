import 'package:injectable/injectable.dart';

import '../../../repos/category/category.dart';

@lazySingleton
class LoadCategoryListUseCase {
  final CategoryRepo _repo;

  LoadCategoryListUseCase(this._repo);

  Future<List<Category>> load(bool clearCache) async {
    if (clearCache) {
      await _repo.reset();
    }
    return await _repo.loadAll();
  }

  Stream<List<Category>> watch() => _repo.watch();
}
