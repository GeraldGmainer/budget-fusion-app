import 'package:budget_fusion_app/core/core.dart';

import '../entities/base/uuid.dart';

abstract class ProfileSettingRepo {
  Stream<ProfileSetting> watch();

  Future<void> loadByUserId(Uuid profileId);

  Future<void> save(ProfileSetting entity);

  Future<void> delete(ProfileSetting entity);

  Future<void> reset();

  void dispose();
}
