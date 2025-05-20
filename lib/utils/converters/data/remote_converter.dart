import 'package:budget_fusion_app/utils/singletons/budget_logger.dart';
import 'package:decimal/decimal.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../core/exceptions/decimal_parsing_exception.dart';

class DecimalConverter implements JsonConverter<Decimal, dynamic> {
  const DecimalConverter();

  @override
  Decimal fromJson(dynamic json) {
    if (json is String) {
      return Decimal.parse(json);
    } else if (json is num) {
      return Decimal.parse(json.toString());
    }
    BudgetLogger.instance.i('Cannot convert $json to Decimal');
    throw DecimalParsingException();
  }

  @override
  dynamic toJson(Decimal object) => object.toString();
}
