import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/features/budgeting/shared/shared.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../home.dart';

class AccountFilter extends StatefulWidget {
  @override
  State<AccountFilter> createState() => _AccountFilterState();
}

class _AccountFilterState extends State<AccountFilter> {
  Account? _selectedAccount;

  Future<void> _showAccountDialog() async {
    Account? selectedAccount = await showAccountDialog(
      context,
      selectedAccount: _selectedAccount,
      title: "account.display_account",
      showEmpty: true,
    );

    setState(() {
      _selectedAccount = selectedAccount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppDimensions.verticalPadding / 2,
        horizontal: AppDimensions.horizontalPadding,
      ),
      child: InkWell(
        onTap: _showAccountDialog,
        child: InputDecorator(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: AppDimensions.horizontalPadding),
            border: OutlineInputBorder(),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                _selectedAccount == null ? "account.all_accounts".tr() : (_selectedAccount!.name ?? "Account"),
                style: TextStyle(color: AppColors.secondaryTextColor, fontSize: 14),
              ),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }
}
