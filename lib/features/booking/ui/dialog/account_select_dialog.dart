import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<Account?> showAccountDialog(
  BuildContext context, {
  required Account? selectedAccount,
  required String title,
  bool showEmpty = false,
  String emptyName = "account.all_accounts",
}) async {
  return await showDialog<Account?>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(title).tr(),
          content: BlocBuilder<AccountCubit, LoadableState<List<Account>>>(
            builder: (blocContext, state) {
              final accounts = state.whenOrNull(loaded: (accounts) => accounts) ?? [];
              return _buildContent(context, accounts, selectedAccount, showEmpty, emptyName);
            },
          ),
        );
      });
}

Widget _buildContent(
  BuildContext context,
  List<Account> accounts,
  Account? selectedAccount,
  bool showEmpty,
  String emptyName,
) {
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        if (showEmpty)
          ListTile(
            title: Text(emptyName).tr(),
            onTap: () {
              Navigator.pop(context, null);
            },
            leading: _RadioIcon(selected: selectedAccount == null),
          ),
        for (var account in accounts) ...[
          ListTile(
            title: Text(account.name),
            onTap: () {
              Navigator.pop(context, account);
            },
            leading: _RadioIcon(selected: selectedAccount == account),
          ),
        ],
      ],
    ),
  );
}

class _RadioIcon extends StatelessWidget {
  final bool selected;

  const _RadioIcon({required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 20.0,
        height: 20.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.secondaryTextColor,
          ),
          color: selected ? AppColors.accentColor : Colors.transparent,
        ),
        child: SizedBox.shrink());
  }
}
