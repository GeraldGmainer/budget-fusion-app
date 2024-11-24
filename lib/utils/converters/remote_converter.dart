import 'package:decimal/decimal.dart';
import 'package:json_annotation/json_annotation.dart';

class DecimalConverter implements JsonConverter<Decimal, dynamic> {
  const DecimalConverter();

  @override
  Decimal fromJson(dynamic json) {
    if (json is String) {
      return Decimal.parse(json);
    } else if (json is num) {
      return Decimal.parse(json.toString());
    } else {
      throw Exception('Cannot convert $json to Decimal');
    }
  }

  @override
  dynamic toJson(Decimal object) => object.toString();
}
