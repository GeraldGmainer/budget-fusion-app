import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/features/budgeting/shared/shared.dart';
import 'package:injectable/injectable.dart';

import '../data_sources/data_sources.dart';

@LazySingleton(as: CategoryRepo)
class CategoryRepoImpl implements CategoryRepo {
  static const Duration cacheDuration = Duration(minutes: 30);
  final _cache = InMemoryCache<List<Category>>(cacheDuration: cacheDuration);
  final CategoryRemoteSource _categoryRemoteSource;

  CategoryRepoImpl(this._categoryRemoteSource);

  @override
  Future<List<Category>> getCategories() {
    return _cache.fetch(_fetchCategoriesFromRemote);
  }

  Future<List<Category>> _fetchCategoriesFromRemote() async {
    final categoryDtos = await _categoryRemoteSource.fetchAllCategories();
    return categoryDtos.map((dto) => dto.toDomain()).toList();
  }
}
