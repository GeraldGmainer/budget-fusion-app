import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

class UuidConverter extends JsonConverter<List<int>, String> {
  const UuidConverter();

  @override
  List<int> fromJson(String json) {
    return Uuid.parse(json);
  }

  @override
  String toJson(List<int> object) {
    return object.toString();
  }
}
