import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/singletons/budget_logger.dart';
import 'package:injectable/injectable.dart';

import '../dtos/profile_setting_dto.dart';

@lazySingleton
class ProfileSettingRemoteDataSource extends OfflineFirstRemoteDataSource<ProfileSettingDto> {
  @override
  String get table => 'profile_settings';

  @override
  String get columns => 'id, user_id, currency_id, updated_at, '
      'currencies(id, name, decimal_precision, unit_position_front, symbol, ui_order, updated_at)';

  @override
  ProfileSettingDto toDto(Map<String, dynamic> json) {
    BudgetLogger.instance.i("toDto $json");
    return ProfileSettingDto.fromJson(json);
  }
}
