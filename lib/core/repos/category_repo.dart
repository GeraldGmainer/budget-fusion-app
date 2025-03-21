import 'package:budget_fusion_app/core/core.dart';

abstract class CategoryRepo {
  Stream<List<CategoryLocalDto>> watch();

  Future<void> loadAll();

  Future<void> save(CategoryLocalDto dto);

  void dispose();
}
