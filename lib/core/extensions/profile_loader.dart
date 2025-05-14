import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/features/booking/booking.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

extension ProfileLoader on BuildContext {
  Future<void> loadUserProfileData({String? userId}) async {
    await _refreshToken();
    read<OfflineFirstQueueCubit>().init();
    read<ProfileCubit>().load(userId: userId);
    read<ProfileSettingCubit>().load(userId: userId);
    read<AccountCubit>().load(userId: userId);
    read<CategoryCubit>().load(userId: userId);
    read<BookingCubit>().load(userId: userId);
  }

  Future<void> _refreshToken() async {
    try {
      if (supabase.auth.currentUser == null || supabase.auth.currentSession == null) {
        throw UnauthenticatedException();
      }
      Session session = supabase.auth.currentSession!;
      if ((session.expiresAt! - 5) < (DateTime.now().millisecondsSinceEpoch / 1000).round()) {
        BudgetLogger.instance.i("REFRESH TOKEN");
        await supabase.auth.refreshSession();
      }
    } catch (e, stackTrace) {
      BudgetLogger.instance.e("Error refreshing session", e, stackTrace);
    }
  }
}
