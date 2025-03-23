import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../../domain/aggregator/profile_setting_aggregator.dart';

@lazySingleton
class GetProfileSettingUseCase {
  final ProfileSettingAggregator _aggregator;

  GetProfileSettingUseCase(this._aggregator);

  Future<ProfileSetting> call() async {
    return await _aggregator.getProfileSetting();
  }
}
