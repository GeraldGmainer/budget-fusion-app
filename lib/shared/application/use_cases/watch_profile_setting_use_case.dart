import 'dart:async';

import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchProfileSettingUseCase {
  final ProfileSettingRepo _repo;

  WatchProfileSettingUseCase(this._repo);

  Stream<ProfileSetting> call() {
    return _repo.watch();
  }
}
