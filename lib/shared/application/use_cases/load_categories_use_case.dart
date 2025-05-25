import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoadCategoriesUseCase {
  final CategoryRepo _repo;

  LoadCategoriesUseCase(this._repo);

  Future<void> call(UserContext userContext, bool clearCache) async {
    if (clearCache) {
      await _repo.reset();
    }
    await _repo.loadAll(filters: userContext.profileFilter);
  }
}
