import 'dart:async';

import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../use_cases/profile/load_profile_setting_use_case.dart';

part 'profile_setting_cubit.freezed.dart';

part 'profile_setting_state.dart';

@injectable
class ProfileSettingCubit extends Cubit<ProfileSettingState> {
  final WatchProfileSettingUseCase _watchProfileSetting;
  final LoadProfileSettingUseCase _loadProfileSetting;
  StreamSubscription? _sub;

  ProfileSettingCubit(this._watchProfileSetting, this._loadProfileSetting) : super(const ProfileSettingState.initial()) {
    _startWatching();
  }

  void _startWatching() {
    _sub?.cancel();
    _sub = _watchProfileSetting().listen(
      (profile) => emit(ProfileSettingState.loaded(profile)),
      onError: (error) => emit(ProfileSettingState.error(error is TranslatedException ? error.message : 'error.default')),
    );
  }

  Future<void> load({String? userId}) async {
    try {
      emit(const ProfileSettingState.loading());
      await _loadProfileSetting(Uuid(userId ?? supabase.auth.currentUser!.id));
    } on TranslatedException catch (e, stackTrace) {
      BudgetLogger.instance.e("ProfileSettingsCubit Exception", e, stackTrace);
      emit(ProfileSettingState.error(e.message));
    } catch (e, stackTrace) {
      BudgetLogger.instance.e("ProfileSettingsCubit Exception", e, stackTrace);
      emit(ProfileSettingState.error("error.default"));
    }
  }
}
