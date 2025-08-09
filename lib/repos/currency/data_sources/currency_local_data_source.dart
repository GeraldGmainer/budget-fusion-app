import 'package:injectable/injectable.dart';

import '../../../core/core.dart';
import '../dtos/currency_dto.dart';

@lazySingleton
class CurrencyLocalDataSource extends LocalDataSource<CurrencyDto> {
  CurrencyLocalDataSource(super.db);

  @override
  String get table => "currency";

  @override
  String? get defaultOrderBy => "name ASC";

  @override
  CurrencyDto fromJson(Map<String, dynamic> json) => CurrencyDto.fromJson(json);
}
