import 'package:injectable/injectable.dart';

import '../../../repos/category/category.dart';
import '../view_models/budget_page_data.dart';
import '../view_models/summary_view_data.dart';
import 'service/summary_data_generator.dart';

@lazySingleton
class GenerateBudgetSummaryUseCase {
  final CategoryRepo _categoryRepo;
  final SummaryDataGenerator _summaryDataGenerator;

  GenerateBudgetSummaryUseCase(this._categoryRepo, this._summaryDataGenerator);

  Future<List<SummaryViewData>> generate(List<BudgetPageData> datas) async {
    final categories = await _categoryRepo.getAll();
    final viewDatas = datas.map((data) => _summaryDataGenerator.generate(data, categories)).toList();
    return viewDatas;
  }
}
