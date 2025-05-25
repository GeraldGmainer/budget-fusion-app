import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoadProfileUseCase {
  final ProfileRepo _profileRepo;

  LoadProfileUseCase(this._profileRepo);

  Future<void> call(UserContext userContext) async {
    await _profileRepo.loadByUserId(filters: userContext.userFilter);
  }
}
