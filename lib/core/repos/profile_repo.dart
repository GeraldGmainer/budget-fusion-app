import 'package:budget_fusion_app/core/core.dart';

abstract class ProfileRepo {
  Stream<Profile> watchProfile();

  Future<void> loadProfileById(String profileId);

  Future<void> save(Profile profile);

  void dispose();
}
