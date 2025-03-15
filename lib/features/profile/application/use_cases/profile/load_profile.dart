import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoadProfile {
  final ProfileRepo _profileRepo;

  LoadProfile(this._profileRepo);

  Future<void> call({String? profileId}) async {
    await _profileRepo.loadProfileById(profileId ?? supabase.auth.currentSession!.user.profileId!);
  }
}
