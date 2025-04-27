import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/category_draft.dart';

@lazySingleton
class SaveCategoryUseCase {
  final CategoryRepo categoryRepo;

  SaveCategoryUseCase(this.categoryRepo);

  Future<void> call(CategoryDraft draft) async {
    final userId = Uuid(supabase.auth.currentUser!.id);
    await categoryRepo.save(draft.toCategory(userId));
  }
}
