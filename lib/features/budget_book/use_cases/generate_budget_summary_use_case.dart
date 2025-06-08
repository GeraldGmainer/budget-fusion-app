import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../view_models/budget_page_data.dart';
import '../view_models/summary_view_data.dart';
import 'service/summary_data_generator.dart';

@lazySingleton
class GenerateBudgetSummaryUseCase {
  final ProfileSettingDataManager _profileSettingDataManager;
  final CategoryDataManager _categoryDataManager;
  final SummaryDataGenerator _summaryDataGenerator;

  GenerateBudgetSummaryUseCase(this._profileSettingDataManager, this._categoryDataManager, this._summaryDataGenerator);

  Future<List<SummaryViewData>> call(List<BudgetPageData> datas) async {
    final results = await Future.wait([_profileSettingDataManager.getCurrency(), _categoryDataManager.getAll()]);
    final currency = results[0] as Currency;
    final categories = results[1] as List<Category>;
    return datas.map((data) => _summaryDataGenerator.generate(data, currency, categories)).toList();
  }
}
