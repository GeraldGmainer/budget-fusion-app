import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../dtos/currency_dto.dart';

class CurrencyDtoSerializer implements JsonConverter<CurrencyDto, dynamic> {
  const CurrencyDtoSerializer();

  @override
  CurrencyDto fromJson(dynamic json) {
    if (json is String) {
      final Map<String, dynamic> map = jsonDecode(json) as Map<String, dynamic>;
      return CurrencyDto.fromJson(map);
    } else if (json is Map<String, dynamic>) {
      return CurrencyDto.fromJson(json);
    } else {
      throw Exception("Unexpected type: ${json.runtimeType}");
    }
  }

  @override
  dynamic toJson(CurrencyDto object) => object.toJson();
}
