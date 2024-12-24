enum TransactionType {
  outcome,
  income,
}

extension TransactionTypeExtension on TransactionType {
  String get label {
    switch (this) {
      case TransactionType.outcome:
        return "transaction_type.outcome";

      case TransactionType.income:
        return "transaction_type.income";
    }
  }
}
