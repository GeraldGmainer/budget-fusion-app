import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';

@lazySingleton
class GetProfile {
  final ProfileRepo _profileRepo;

  GetProfile(this._profileRepo);

  Future<Profile> call() async {
    final user = supabase.auth.currentSession?.user;
    return await _profileRepo.getProfileById(user!.profileId!);
  }
}
