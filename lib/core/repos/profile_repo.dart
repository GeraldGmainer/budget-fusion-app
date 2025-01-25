import 'package:budget_fusion_app/core/core.dart';

abstract class ProfileRepo {
  Future<Profile> getProfileById(String profileId);

  Future<void> save(Profile profile);
}
