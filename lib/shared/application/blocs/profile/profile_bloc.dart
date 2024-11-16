import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/repos/repos.dart';

part 'profile_bloc.freezed.dart';

part 'profile_event.dart';

part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepo _profileRepo;

  ProfileBloc(this._profileRepo) : super(const ProfileState.initial()) {
    on<ProfileEvent>((event, emit) async {
      await event.map(
        load: (loadEvent) => _onLoad(emit, loadEvent.user),
      );
    });
  }

  Future<void> _onLoad(Emitter<ProfileState> emit, User user) async {
    try {
      emit(ProfileState.loading());
      final supabaseUser = SupabaseUser.fromGoTrueUser(user);
      final profile = await _profileRepo.getProfile(supabaseUser);
      emit(ProfileState.loaded(profile));
    } on TranslatedException catch (e, stackTrace) {
      BudgetLogger.instance.e("ProfileBloc Exception", e, stackTrace);
      emit(ProfileState.error(e.message));
    } catch (e, stackTrace) {
      BudgetLogger.instance.e("ProfileBloc Exception", e, stackTrace);
      emit(ProfileState.error("error.default"));
    }
  }
}
