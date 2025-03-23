import 'dart:async';

import 'package:budget_fusion_app/features/profile/application/use_cases/profile/load_profile_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../../../../utils/utils.dart';
import '../../use_cases/profile/watch_profile_use_case.dart';

part 'profile_cubit.freezed.dart';
part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final WatchProfileUseCase _watchProfile;
  final LoadProfileUseCase _loadProfile;
  StreamSubscription? _sub;

  ProfileCubit(this._watchProfile, this._loadProfile) : super(const ProfileState.initial()) {
    _startWatching();
  }

  void _startWatching() {
    _sub?.cancel();
    _sub = _watchProfile().listen(
      (profile) => emit(ProfileState.loaded(profile)),
      onError: (error) => emit(ProfileState.error(error is TranslatedException ? error.message : 'error.default')),
    );
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }

  Future<void> load({String? profileId}) async {
    try {
      emit(const ProfileState.loading());
      await _loadProfile(Uuid(profileId ?? supabase.auth.currentUser!.id));
    } on TranslatedException catch (e, stackTrace) {
      BudgetLogger.instance.e("ProfileCubit TranslatedException", e, stackTrace);
      emit(ProfileState.error(e.message));
    } catch (e, stackTrace) {
      BudgetLogger.instance.e("ProfileCubit Exception", e, stackTrace);
      emit(ProfileState.error("error.default"));
    }
  }
}
