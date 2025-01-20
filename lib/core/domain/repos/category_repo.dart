import '../../core.dart';

abstract class CategoryRepo {
  Future<List<Category>> getCategories();
}
