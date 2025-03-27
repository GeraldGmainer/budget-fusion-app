import 'dart:async';

import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ProfileSettingAggregator {
  final ProfileSettingRepo _repo;

  ProfileSettingAggregator(this._repo);

  Future<ProfileSetting> getProfileSetting() async {
    return await _repo.watch().first;
  }
}
