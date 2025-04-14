import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/budget_page_data.dart';
import '../../../domain/entities/summary_view_data.dart';
import '../../../domain/service/summary_data_generator.dart';

@lazySingleton
class GenerateBudgetSummaryUseCase {
  final ProfileSettingRepo _profileSettingRepo;
  final CategoryRepo _categoryRepo;
  final SummaryDataGenerator _summaryDataGenerator;

  GenerateBudgetSummaryUseCase(this._profileSettingRepo, this._summaryDataGenerator, this._categoryRepo);

  Future<List<SummaryViewData>> call(List<BudgetPageData> datas) async {
    final currency = (await _profileSettingRepo.watch().first).currency;
    final flatCategories = await _categoryRepo.watch().first;
    return datas.map((data) => _summaryDataGenerator.generate(data, currency, flatCategories)).toList();
  }
}
