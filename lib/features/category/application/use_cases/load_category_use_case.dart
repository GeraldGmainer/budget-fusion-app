import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoadCategoryUseCase {
  final CategoryRepo categoryRepo;

  LoadCategoryUseCase(this.categoryRepo);

  Future<Category?> call(Uuid id) async {
    return categoryRepo.loadById(id);
  }
}
