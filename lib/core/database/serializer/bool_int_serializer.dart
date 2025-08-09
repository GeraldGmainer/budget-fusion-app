import 'package:json_annotation/json_annotation.dart';

class BoolIntSerializer implements JsonConverter<bool, dynamic> {
  const BoolIntSerializer();

  @override
  bool fromJson(dynamic json) {
    if (json is bool) return json;
    if (json is int) return json != 0;
    throw FormatException('Invalid bool value: $json');
  }

  @override
  int toJson(bool object) => object ? 1 : 0;
}
