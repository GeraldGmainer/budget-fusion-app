import 'package:budget_fusion_app/core/core.dart';
import 'package:json_annotation/json_annotation.dart';

class UuidConverter extends JsonConverter<List<int>, String> {
  const UuidConverter();

  @override
  List<int> fromJson(String json) {
    return Uuid.parseJson(json);
  }

  @override
  String toJson(List<int> object) {
    return object.toString();
  }
}
