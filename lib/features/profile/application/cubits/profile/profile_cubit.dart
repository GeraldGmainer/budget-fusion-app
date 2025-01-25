import 'package:budget_fusion_app/features/profile/application/use_cases/profile/get_profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../../../../utils/utils.dart';

part 'profile_cubit.freezed.dart';
part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetProfile _getProfile;

  ProfileCubit(this._getProfile) : super(const ProfileState.initial());

  Future<void> load() async {
    try {
      final profile = await _getProfile();
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
