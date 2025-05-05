import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/category_draft.dart';

@lazySingleton
class SaveCategoryUseCase {
  final CategoryRepo categoryRepo;

  SaveCategoryUseCase(this.categoryRepo);

  Future<void> call(CategoryDraft draft) async {
    await categoryRepo.save(draft.toCategory());
  }
}
