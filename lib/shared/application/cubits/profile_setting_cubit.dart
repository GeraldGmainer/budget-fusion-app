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
      onError: (error) => emit(LoadableState.error(error is TranslatedException ? error.error : AppError.unknown)),
    );
  }

  Future<void> load() async {
    try {
      DomainLogger.instance.d(runtimeType.toString(), DomainType.profileSetting.name, "initiate load");
      emit(const LoadableState.loading());
      await _loadProfileSetting(supabase.auth.currentUser!.userContext);
    } on TranslatedException catch (e, stackTrace) {
      BudgetLogger.instance.e("${runtimeType.toString()} TranslatedException", e, stackTrace);
      emit(LoadableState.error(e.error));
    } catch (e, stackTrace) {
      BudgetLogger.instance.e("${runtimeType.toString()} Exception", e, stackTrace);
      emit(LoadableState.error(AppError.unknown));
    }
  }
}
