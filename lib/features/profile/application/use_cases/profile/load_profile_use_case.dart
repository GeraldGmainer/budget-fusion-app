import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoadProfileUseCase {
  final ProfileRepo _profileRepo;

  LoadProfileUseCase(this._profileRepo);

  Future<void> call(Uuid profileId) async {
    await _profileRepo.loadById(profileId);
  }
}
