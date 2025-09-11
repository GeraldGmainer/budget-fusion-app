import 'package:decimal/decimal.dart';

extension DecimalExtensions on Decimal {
  String toStringAsFixed() => toDouble().toStringAsFixed(2);
}
