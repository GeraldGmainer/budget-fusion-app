import 'package:json_annotation/json_annotation.dart';

class DateTimeSerializer extends JsonConverter<DateTime, String> {
  const DateTimeSerializer();

  @override
  DateTime fromJson(String json) => DateTime.parse(json).toUtc();

  @override
  String toJson(DateTime object) => object.toUtc().toIso8601String();
}
