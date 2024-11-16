import 'package:flutter/material.dart';
import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (profile) {
            final avatarUrl = profile.avatarUrl;
            return _buildInfo(profile.name, profile.email, avatarUrl != null ? _buildAvatar(avatarUrl) : _buildEmptyPicture());
          },
          orElse: () => _buildInfo(null, null, _buildEmptyPicture()),
        );
      },
    );
  }

  _buildInfo(String? name, String? email, Widget picture) {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(color: AppColors.accentColor),
      accountName: Text(name ?? "Unknown Name", style: TextStyle(fontSize: 22, color: AppColors.primaryTextColor)),
      accountEmail: email != null ? Text(email, style: TextStyle(fontSize: 16, color: AppColors.primaryTextColor)) : null,
      currentAccountPicture: picture,
    );
  }

  Widget _buildAvatar(String url) {
    throw "TODO build avatar widget";
  }

  Widget _buildEmptyPicture() {
    return CircleAvatar(
      backgroundColor: AppColors.secondaryTextColor,
      child: Icon(
        Icons.person,
        size: 48,
      ),
    );
  }
}
