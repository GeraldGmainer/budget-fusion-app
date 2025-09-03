import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../entities/currency.dart';

part 'money.freezed.dart';

@freezed
abstract class Money with _$Money {
  const Money._();

  const factory Money({required Decimal amount, required Currency? currency}) = _Money;

  factory Money.zero() => Money(amount: Decimal.zero, currency: null);

  int compareTo(Money other) {
    // TODO assert different currencies
    // assert(currency == other.currency);
    return amount.compareTo(other.amount);
  }
}

extension MoneyX on Money {
  bool isPositive() => amount >= Decimal.zero;

  bool isZero() => amount == Decimal.zero;

  Money operator +(Money other) {
    // TODO dont add different currencies
    // assert(currency.id == other.currency.id, 'Cannot add money expressed in different currencies');
    return Money(amount: amount + other.amount, currency: currency);
  }

  Money operator -(Money other) {
    // TODO dont add different currencies
    // assert(currency == other.currency, 'Cannot subtract money expressed in different currencies');
    return Money(amount: amount - other.amount, currency: currency);
  }

  Money operator -() => Money(amount: -amount, currency: currency);
}
