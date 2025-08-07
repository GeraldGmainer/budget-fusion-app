import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../dtos/currency_dto.dart';

@lazySingleton
class CurrencyRemoteDataSource extends OfflineFirstRemoteDataSource<CurrencyDto> {
  @override
  String get table => 'currency';

  @override
  String get columns => 'id, name, icon_name, icon_color, updated_at';

  @override
  CurrencyDto toDto(Map<String, dynamic> json) {
    return CurrencyDto.fromJson(json);
  }
}
