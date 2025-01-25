import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../../../utils/utils.dart';

part 'profile_settings_cubit.freezed.dart';
part 'profile_settings_state.dart';

@injectable
class ProfileSettingsCubit extends Cubit<ProfileSettingsState> {
  final ProfileSettingsRepo _profileSettingsRepo;

  ProfileSettingsCubit(this._profileSettingsRepo) : super(const ProfileSettingsState.initial());

  Future<void> load() async {
    try {
      final user = supabase.auth.currentSession?.user;
      final profileSettings = await _profileSettingsRepo.getProfileSettings(user!.profileId!);
      emit(ProfileSettingsState.loaded(profileSettings));
    } on TranslatedException catch (e, stackTrace) {
      BudgetLogger.instance.e("ProfileSettingsCubit Exception", e, stackTrace);
      emit(ProfileSettingsState.error(e.message));
    } catch (e, stackTrace) {
      BudgetLogger.instance.e("ProfileSettingsCubit Exception", e, stackTrace);
      emit(ProfileSettingsState.error("error.default"));
    }
  }
}
