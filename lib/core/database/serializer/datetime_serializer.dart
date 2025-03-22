import 'package:json_annotation/json_annotation.dart';

class DateTimeSerializer extends JsonConverter<DateTime, String> {
  const DateTimeSerializer();

  @override
  DateTime fromJson(String json) => DateTime.parse(json);

  @override
  String toJson(DateTime object) => object.toIso8601String();
}
