import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';

abstract class ProfileSettingRepo {
  Stream<ProfileSetting> watch();

  Future<void> loadById(Uuid profileId);

  Future<void> save(ProfileSetting entity);

  void dispose();
}
