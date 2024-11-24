import '../entities/entities.dart';

abstract class CategoryRepo {
  Future<List<Category>> getCategories();
}
