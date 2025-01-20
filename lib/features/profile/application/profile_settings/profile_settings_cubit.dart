import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/core.dart';
import '../../../../utils/utils.dart';

part 'profile_settings_cubit.freezed.dart';
part 'profile_settings_state.dart';

@injectable
class ProfileSettingsCubit extends Cubit<ProfileSettingsState> {
  final ProfileRepo _profileRepo;

  ProfileSettingsCubit(this._profileRepo) : super(const ProfileSettingsState.initial());

  Future<void> load(User? user) async {
    try {
      final profileSettings = await _profileRepo.getProfileSettings(user!.profileId!);
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
