import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/budget_page_data.dart';
import '../../../domain/entities/transaction_view_data.dart';
import '../../../domain/service/transaction_data_generator.dart';

@lazySingleton
class GenerateBudgetTransactionUseCase {
  final ProfileSettingRepo _profileSettingRepo;
  final TransactionDataGenerator _transactionDataGenerator;

  GenerateBudgetTransactionUseCase(this._profileSettingRepo, this._transactionDataGenerator);

  Future<List<TransactionViewData>> call(List<BudgetPageData> datas) async {
    final currency = (await _profileSettingRepo.watch().first).currency;
    return datas.map((data) => _transactionDataGenerator.generate(data, currency)).toList();
  }
}
