import 'package:budget_fusion_app/utils/extensions/date_time_extension.dart';
import 'package:json_annotation/json_annotation.dart';

class DateSerializer extends JsonConverter<DateTime, String> {
  const DateSerializer();

  @override
  DateTime fromJson(String json) => DateTime.parse(json).toLocal().startOfDay;

  @override
  String toJson(DateTime date) => date.startOfDay.toIso8601String();
}
