enum TransactionType { outcome, income }

extension TransactionTypeExtension on TransactionType {
  String get label {
    switch (this) {
      case TransactionType.outcome:
        return "booking.enums.categoryType.outcome";

      case TransactionType.income:
        return "booking.enums.categoryType.income";
    }
  }
}
