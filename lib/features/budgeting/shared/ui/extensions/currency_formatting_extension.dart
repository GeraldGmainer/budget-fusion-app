import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../shared/domain/entities/currency.dart';

extension CurrencyFormatting on Decimal {
  String formatCurrency({
    required Currency currency,
    required BuildContext context,
    bool showSymbol = true,
  }) {
    final locale = Localizations.localeOf(context).toString();
    final decimalDigits = currency.decimalPrecision;

    final format = NumberFormat.currency(
      locale: locale,
      decimalDigits: decimalDigits,
      symbol: showSymbol ? currency.symbol : '',
    );

    String formattedValue = format.format(toDouble());

    if (showSymbol && !currency.unitPositionFront) {
      formattedValue = formattedValue.replaceFirst(currency.symbol, '').trim();
      formattedValue += ' ${currency.symbol}';
    }

    return formattedValue;
  }
}
