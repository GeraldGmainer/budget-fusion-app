import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/features/category/category.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteCategoryUseCase {
  final CategoryRepo categoryRepo;

  DeleteCategoryUseCase(this.categoryRepo);

  Future<void> call(CategoryDraft draft) async {
    await categoryRepo.delete(draft.toCategory());
  }
}
