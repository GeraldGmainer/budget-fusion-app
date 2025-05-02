import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/features/category/category.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteCategoryUseCase {
  final CategoryRepo categoryRepo;

  DeleteCategoryUseCase(this.categoryRepo);

  Future<void> call(CategoryDraft draft) async {
    final userId = Uuid(supabase.auth.currentUser!.id);
    await categoryRepo.delete(draft.toCategory(userId));
  }
}
