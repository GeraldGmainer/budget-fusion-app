import 'package:budget_fusion_app/core/core.dart';

abstract class ProfileSettingRepo {
  Stream<ProfileSetting> watch();

  Future<void> loadByUserId(Uuid userId);

  Future<void> save(ProfileSetting entity);

  Future<void> delete(ProfileSetting entity);

  Future<void> reset();

  void dispose();
}
