import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../../shared/shared.dart';
import '../../../profile/profile.dart';

class OverviewTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("OverviewTab"),
          SizedBox(height: 20),
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              return state.when(
                initial: () => LoadingIndicator(),
                loading: () => LoadingIndicator(),
                loaded: (profile) => _buildProfile(profile),
                error: (message) => ErrorText(message: message),
              );
            },
          ),
          ElevatedButton(
              onPressed: () {
                context.read<ProfileCubit>().load();
              },
              child: Text("load"))
        ],
      ),
    );
  }

  Widget _buildProfile(Profile profile) {
    return Column(
      children: [
        Text("id: ${profile.id}"),
        Text("userId: ${profile.userId}"),
        Text("name: ${profile.name}"),
        Text("Email: ${profile.email}"),
      ],
    );
  }
}
