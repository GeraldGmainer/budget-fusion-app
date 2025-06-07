import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/core.dart';

class CurrencyText extends StatelessWidget {
  static const double defaultFontSize = 14;

  final Decimal? value;
  final Currency? currency;
  final double fontSize;
  final Color color;
  final bool showSymbol;

  const CurrencyText({super.key, this.currency, required this.value, this.fontSize = defaultFontSize, this.showSymbol = true, this.color = AppColors.primaryTextColor});

  @override
  Widget build(BuildContext context) {
    if (currency != null) {
      _buildText(context, currency!);
    }
    return DataManagerSingleNullable<ProfileSetting>(
      builder: (context, data) {
        if (data == null) {
          return _buildDefaultText(context);
        }
        return _buildText(context, data.currency);
      },
    );
  }

  Widget _buildText(BuildContext context, Currency currency) {
    final int decimalPrecision = currency.decimalPrecision;
    final bool isUnitPositionFront = currency.unitPositionFront;
    final String symbol = currency.symbol;
    final decimalSeparator = _getDecimalSeparator(context);
    final groupSeparator = _getGroupSeparator(context);

    final String formattedValue = (value ?? Decimal.zero).toStringAsFixed(decimalPrecision);
    final List<String> parts = formattedValue.split('.');
    final RegExp regExp = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    final String integerPart = parts[0].replaceAllMapped(regExp, (Match match) {
      return '${match[1]}$groupSeparator';
    });
    final String decimalPart = parts.length > 1 ? decimalSeparator + parts[1] : '';

    final style = TextStyle(fontSize: fontSize, color: color);

    return FittedBox(
      fit: BoxFit.fitWidth,
      child: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: [
            if (showSymbol && isUnitPositionFront) TextSpan(text: "$symbol ", style: style),
            TextSpan(text: integerPart, style: style),
            TextSpan(text: decimalPart, style: style.copyWith(fontSize: fontSize - (fontSize * 0.3))),
            if (showSymbol && !isUnitPositionFront) TextSpan(text: " $symbol", style: style),
          ],
        ),
      ),
    );
  }

  Widget _buildDefaultText(BuildContext context) {
    return Text((value ?? Decimal.zero).toStringAsFixed(0), style: TextStyle(fontSize: fontSize, color: color));
  }

  String _getDecimalSeparator(BuildContext context) {
    // TODO get locale
    // final locale = Localizations.localeOf(context);
    const locale = "de_DE";
    final format = NumberFormat.decimalPattern(locale);
    return format.symbols.DECIMAL_SEP;
  }

  String _getGroupSeparator(BuildContext context) {
    // TODO get locale
    // final locale = Localizations.localeOf(context);
    const locale = "de_DE";
    final format = NumberFormat.decimalPattern(locale);
    return format.symbols.GROUP_SEP;
  }
}
