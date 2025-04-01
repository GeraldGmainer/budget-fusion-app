import 'package:decimal/decimal.dart';

extension DecimalExtensions on Decimal {
  toStringAsFixed() => toDouble().toStringAsFixed(2);
}
