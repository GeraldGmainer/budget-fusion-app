import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoadProfileUseCase {
  final ProfileRepo _profileRepo;

  LoadProfileUseCase(this._profileRepo);

  Future<void> call(Uuid userId) async {
    await _profileRepo.loadByUserId(userId);
  }
}
