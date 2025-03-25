import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/features/accounts/accounts.dart';
import 'package:budget_fusion_app/features/profile/profile.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DebugEntities extends StatelessWidget {
  const DebugEntities({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Profile', style: Theme.of(context).textTheme.bodyLarge),
          _buildProfile(),
          const Divider(height: 32),
          Text('Profile Setting', style: Theme.of(context).textTheme.bodyLarge),
          _buildProfileSetting(),
          const Divider(height: 32),
          Text('Accounts', style: Theme.of(context).textTheme.bodyLarge),
          _buildAccounts(),
        ],
      ),
    );
  }

  _buildProfile() {
    return BlocBuilder<ProfileCubit, LoadableState<Profile>>(
      builder: (context, state) {
        return state.when(
          initial: () => const Text('Initial'),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (profile) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (profile.name != null) Text('Name: ${profile.name}'),
              Text('Email: ${profile.email}'),
              if (profile.avatarUrl != null) Text('Avatar URL: ${profile.avatarUrl}'),
              Text('Updated At: ${_formatDate(profile.updatedAt)}'),
            ],
          ),
          error: (message) => Text('Error: $message'),
        );
      },
    );
  }

  _buildProfileSetting() {
    return BlocBuilder<ProfileSettingCubit, LoadableState<ProfileSetting>>(
      builder: (context, state) {
        return state.when(
          initial: () => const Text('Initial'),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (setting) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Currency: ${setting.currency.name} / ${setting.currency.symbol}'),
              Text('Updated At: ${_formatDate(setting.updatedAt)}'),
            ],
          ),
          error: (message) => Text('Error: $message'),
        );
      },
    );
  }

  _buildAccounts() {
    return BlocBuilder<AccountsCubit, LoadableState<List<Account>>>(
      builder: (context, state) {
        return state.when(
          initial: () => const Text('Initial'),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (accounts) {
            if (accounts.isEmpty) {
              return const Text('No accounts available');
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: accounts.map((account) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name: ${account.name}'),
                    if (account.iconName != null) Text('Icon Name: ${account.iconName}'),
                    if (account.iconColor != null) Text('Icon Color: ${account.iconColor}'),
                    Text('Updated At: ${_formatDate(account.updatedAt)}'),
                    SizedBox(height: 8),
                  ],
                );
              }).toList(),
            );
          },
          error: (message) => Text('Error: $message'),
        );
      },
    );
  }

  String _formatDate(DateTime dateTime) {
    return DateFormat('dd.MM.yyyy HH:mm:ss').format(dateTime);
  }
}
