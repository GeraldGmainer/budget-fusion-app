import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../dtos/currency_dto.dart';

@lazySingleton
class CurrencyLocalDataSource extends OfflineFirstLocalDataSource<CurrencyDto> {
  CurrencyLocalDataSource(super.db);

  @override
  String get table => "currency";

  @override
  String? get defaultOrderBy => "name ASC";

  @override
  CurrencyDto fromJson(Map<String, dynamic> json) => CurrencyDto.fromJson(json);
}
