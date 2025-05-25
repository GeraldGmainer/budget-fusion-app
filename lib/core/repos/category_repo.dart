import 'package:budget_fusion_app/core/core.dart';

abstract class CategoryRepo {
  Stream<List<Category>> watch();

  Future<void> loadAll({Map<String, dynamic>? filters});

  Future<Category?> loadById(Uuid id);

  Future<void> save(Category entity);

  Future<void> delete(Category entity);

  Future<void> reset();

  void dispose();
}
