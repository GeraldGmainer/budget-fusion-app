import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteCategoryUseCase {
  final CategoryRepo categoryRepo;

  DeleteCategoryUseCase(this.categoryRepo);

  Future<void> call(Category category) async {
    await categoryRepo.delete(category);
  }
}
