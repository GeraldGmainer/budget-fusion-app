import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/core.dart';
import '../../../../utils/utils.dart';

part 'profile_cubit.freezed.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;

  ProfileCubit(this._profileRepo) : super(const ProfileState.initial());

  Future<void> load(User? user) async {
    try {
      BudgetLogger.instance.i(user?.userMetadata);
      final profile = await _profileRepo.getProfile(user!.profileId!);
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
