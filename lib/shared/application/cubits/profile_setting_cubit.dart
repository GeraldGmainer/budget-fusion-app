import 'dart:async';

import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileSettingCubit extends Cubit<LoadableState<ProfileSetting>> {
  final WatchProfileSettingUseCase _watchProfileSetting;
  final LoadProfileSettingUseCase _loadProfileSetting;
  StreamSubscription? _sub;

  ProfileSettingCubit(this._watchProfileSetting, this._loadProfileSetting) : super(const LoadableState.initial()) {
    _startWatching();
  }

  void _startWatching() {
    _sub?.cancel();
    _sub = _watchProfileSetting().listen(
      (profile) => emit(LoadableState.loaded(profile)),
      onError: (error) => emit(LoadableState.error(error is TranslatedException ? error.message : 'error.default')),
    );
  }

  Future<void> load({String? userId}) async {
    try {
      DomainLogger.instance.d(runtimeType.toString(), "initiate load for ${DomainLogger.applyColor('profile_setting')}");
      emit(const LoadableState.loading());
      await _loadProfileSetting(Uuid(userId ?? supabase.auth.currentUser!.id));
    } on TranslatedException catch (e, stackTrace) {
      BudgetLogger.instance.e("${runtimeType.toString()} TranslatedException", e, stackTrace);
      emit(LoadableState.error(e.message));
    } catch (e, stackTrace) {
      BudgetLogger.instance.e("${runtimeType.toString()} Exception", e, stackTrace);
      emit(LoadableState.error("error.default"));
    }
  }
}
