import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../dtos/profile_setting_dto.dart';

@lazySingleton
class ProfileSettingLocalDataSource extends OfflineFirstLocalDataSource<ProfileSettingDto> {
  ProfileSettingLocalDataSource(super.db);

  @override
  String get table => "profile_settings";

  @override
  ProfileSettingDto fromJson(Map<String, dynamic> json) => ProfileSettingDto.fromJson(json);
}
