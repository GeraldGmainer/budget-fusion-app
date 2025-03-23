import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoadProfileSettingUseCase {
  final ProfileSettingRepo _repo;

  LoadProfileSettingUseCase(this._repo);

  Future<void> call(Uuid profileId) async {
    await _repo.loadById(profileId);
  }
}
