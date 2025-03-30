import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class WatchProfileUseCase {
  final ProfileRepo _profileRepo;

  WatchProfileUseCase(this._profileRepo);

  Stream<Profile> call() {
    return _profileRepo.watch();
  }
}
