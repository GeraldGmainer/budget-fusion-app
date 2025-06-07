import 'package:json_annotation/json_annotation.dart';

import '../../models/uuid.dart';

class UuidSerializer extends JsonConverter<Uuid, String> {
  const UuidSerializer();

  @override
  Uuid fromJson(String json) => Uuid(json);

  @override
  String toJson(Uuid object) => object.value;
}
