import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoadProfileSettingUseCase {
  final ProfileSettingRepo _repo;

  LoadProfileSettingUseCase(this._repo);

  Future<void> call(UserContext userContext) async {
    await _repo.loadByUserId(filters: userContext.profileFilter);
  }
}
