import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/domain/aggregator/profile_setting_aggregator.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCurrencyUseCase {
  final ProfileSettingAggregator _aggregator;

  GetCurrencyUseCase(this._aggregator);

  Future<Currency> call() async {
    final profileSetting = await _aggregator.getProfileSetting();
    return profileSetting.currency;
  }
}
