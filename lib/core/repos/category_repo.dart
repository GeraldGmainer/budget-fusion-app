import 'package:budget_fusion_app/core/core.dart';

abstract class CategoryRepo {
  Stream<List<Category>> watch();

  Future<void> loadAll();

  Future<void> save(Category entity);

  void dispose();
}
