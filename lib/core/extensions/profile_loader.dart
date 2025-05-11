import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/features/booking/booking.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension ProfileLoader on BuildContext {
  Future<void> loadUserProfileData({String? userId}) async {
    read<OfflineFirstQueueCubit>().init();
    read<ProfileCubit>().load(userId: userId);
    read<ProfileSettingCubit>().load(userId: userId);
    read<AccountCubit>().load(userId: userId);
    read<CategoryCubit>().load(userId: userId);
    read<BookingCubit>().load(userId: userId);
  }
}
