import 'package:budget_fusion_app/core/core.dart';

import '../entities/base/uuid.dart';

abstract class CategoryRepo {
  Stream<List<Category>> watch();

  Future<void> loadAll();

  Future<Category?> loadById(Uuid id);

  Future<void> save(Category entity);

  Future<void> delete(Category entity);

  Future<void> reset();

  void dispose();
}
