import 'package:budget_fusion_app/core/core.dart';

abstract class ProfileRepo {
  Stream<ProfileLocalDto> watch();

  Future<void> loadById(String profileId);

  Future<void> save(ProfileLocalDto profile);

  void dispose();
}
