import 'package:json_annotation/json_annotation.dart';

class DateTimeSerializer implements JsonConverter<DateTime, dynamic> {
  const DateTimeSerializer();

  @override
  DateTime fromJson(dynamic json) {
    if (json is int) {
      return DateTime.fromMillisecondsSinceEpoch(json, isUtc: true).toLocal();
    }
    if (json is String) {
      return DateTime.parse(json).toLocal();
    }
    throw FormatException('Cannot convert $json to DateTime');
  }

  @override
  dynamic toJson(DateTime object) {
    return object.toUtc().toIso8601String();
  }
}
