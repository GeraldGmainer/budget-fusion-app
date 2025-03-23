import 'package:json_annotation/json_annotation.dart';

import '../dtos/currency_dto.dart';

class CurrencyDtoSerializer implements JsonConverter<CurrencyDto, Map<String, dynamic>> {
  const CurrencyDtoSerializer();

  @override
  CurrencyDto fromJson(Map<String, dynamic> json) => CurrencyDto.fromJson(json);

  @override
  Map<String, dynamic> toJson(CurrencyDto object) => object.toJson();
}
