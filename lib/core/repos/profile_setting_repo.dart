import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';

abstract class ProfileSettingRepo {
  Stream<ProfileSetting> watch();

  Future<void> loadByUserId(Uuid profileId);

  Future<void> save(ProfileSetting entity);

  Future<void> delete(ProfileSetting entity);

  Future<void> reset();

  void dispose();
}
