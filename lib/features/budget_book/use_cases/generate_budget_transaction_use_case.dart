import 'package:injectable/injectable.dart';

import '../view_models/budget_page_data.dart';
import '../view_models/transaction_view_data.dart';
import 'service/transaction_data_generator.dart';

@lazySingleton
class GenerateBudgetTransactionUseCase {
  final TransactionDataGenerator _transactionDataGenerator;

  GenerateBudgetTransactionUseCase(this._transactionDataGenerator);

  Future<List<TransactionViewData>> call(List<BudgetPageData> datas) async {
    return datas.map((data) => _transactionDataGenerator.generate(data)).toList();
  }
}
