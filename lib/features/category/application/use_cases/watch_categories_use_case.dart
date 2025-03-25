import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class WatchCategoriesUseCase {
  final CategoryRepo _repo;

  WatchCategoriesUseCase(this._repo);

  Stream<List<Category>> call() {
    return _repo.watch();
  }
}
