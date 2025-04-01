import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/features/budget_book/domain/service/summary_data_generator.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/budget_page_data.dart';
import '../../../domain/entities/summary_view_data.dart';

@lazySingleton
class GenerateBudgetSummaryUseCase {
  final ProfileSettingRepo _profileSettingRepo;
  final SummaryDataGenerator _summaryDataGenerator;

  GenerateBudgetSummaryUseCase(this._profileSettingRepo, this._summaryDataGenerator);

  Future<List<SummaryViewData>> call(List<BudgetPageData> datas) async {
    final currency = (await _profileSettingRepo.watch().first).currency;
    return datas.map((data) => _summaryDataGenerator.generate(data, currency)).toList();
  }
}
