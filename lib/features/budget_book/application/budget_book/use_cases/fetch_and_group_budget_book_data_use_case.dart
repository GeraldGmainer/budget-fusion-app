import 'package:budget_fusion_app/features/budget_book/domain/entities/budget_page_data.dart';
import 'package:injectable/injectable.dart';
import 'package:budget_fusion_app/core/core.dart';

@lazySingleton
class FetchAndGroupBudgetBookDataUseCase {
  Future<List<BudgetPageData>> call() async {
    return [];
  }
}
