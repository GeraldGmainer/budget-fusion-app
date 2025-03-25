import 'dart:async';

import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../use_cases/load_profile_use_case.dart';
import '../use_cases/watch_profile_use_case.dart';

@injectable
class ProfileCubit extends Cubit<LoadableState<Profile>> {
  final WatchProfileUseCase _watchProfile;
  final LoadProfileUseCase _loadProfile;
  StreamSubscription? _sub;

  ProfileCubit(this._watchProfile, this._loadProfile) : super(const LoadableState.initial()) {
    _startWatching();
  }

  void _startWatching() {
    _sub?.cancel();
    _sub = _watchProfile().listen(
      (profile) => emit(LoadableState.loaded(profile)),
      onError: (error) => emit(LoadableState.error(error is TranslatedException ? error.message : 'error.default')),
    );
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }

  Future<void> load({String? userId}) async {
    try {
      emit(const LoadableState.loading());
      await _loadProfile(Uuid(userId ?? supabase.auth.currentUser!.id));
    } on TranslatedException catch (e, stackTrace) {
      BudgetLogger.instance.e("${runtimeType.toString()} TranslatedException", e, stackTrace);
      emit(LoadableState.error(e.message));
    } catch (e, stackTrace) {
      BudgetLogger.instance.e("${runtimeType.toString()} Exception", e, stackTrace);
      emit(LoadableState.error("error.default"));
    }
  }
}
