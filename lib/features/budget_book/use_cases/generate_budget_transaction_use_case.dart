import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../view_models/budget_page_data.dart';
import '../view_models/transaction_view_data.dart';
import 'service/transaction_data_generator.dart';

@lazySingleton
class GenerateBudgetTransactionUseCase {
  final ProfileSettingDataManager _profileSettingDataManager;
  final TransactionDataGenerator _transactionDataGenerator;

  GenerateBudgetTransactionUseCase(this._profileSettingDataManager, this._transactionDataGenerator);

  Future<List<TransactionViewData>> call(List<BudgetPageData> datas) async {
    final currency = await _profileSettingDataManager.getCurrency();
    return datas.map((data) => _transactionDataGenerator.generate(data, currency)).toList();
  }
}
