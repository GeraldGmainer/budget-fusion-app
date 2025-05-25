import 'dart:async';

import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

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
      onError: (error) => emit(LoadableState.error(error is TranslatedException ? error.error : AppError.unknown)),
    );
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }

  Future<void> load() async {
    try {
      DomainLogger.instance.d(runtimeType.toString(), DomainType.profile.name, "initiate load");
      emit(const LoadableState.loading());
      await _loadProfile(supabase.auth.currentUser!.userContext);
    } on TranslatedException catch (e, stackTrace) {
      BudgetLogger.instance.e("${runtimeType.toString()} TranslatedException", e, stackTrace);
      emit(LoadableState.error(e.error));
    } catch (e, stackTrace) {
      BudgetLogger.instance.e("${runtimeType.toString()} Exception", e, stackTrace);
      emit(LoadableState.error(AppError.unknown));
    }
  }
}
