import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/features/booking/application/cubits/booking_save_cubit.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/booking_draft.dart';

class AccountSelectInput extends StatelessWidget {
  final BookingDraft draft;

  const AccountSelectInput({required this.draft});

  _onTap(BuildContext context) async {
    final accounts = context.read<AccountCubit>().state.whenOrNull(loaded: (accounts) => accounts) ?? [];

    final Account? selectedAccount = await showSelectionBottomSheet<Account>(
      context: context,
      title: "booking.select_account",
      items: accounts,
      selectedItem: draft.account,
      labelBuilder: (account) => Text(account.name),
      iconBuilder: (account) => BudgetIcon(name: account.iconName, color: account.iconColor),
    );

    if (selectedAccount != null && context.mounted) {
      context.read<BookingSaveCubit>().updateDraft((draft) => draft.copyWith(account: selectedAccount));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO translation
    final hasValue = draft.account != null;
    return ListTile(
      leading: hasValue
          ? BudgetIcon(name: draft.account!.iconName, color: draft.account!.iconColor)
          : Icon(CommunityMaterialIcons.bank, color: Theme.of(context).hintColor),
      title: Text(
        hasValue ? draft.account!.name : "Account",
        style: hasValue ? null : TextStyle(color: Theme.of(context).hintColor),
      ),
      subtitle: hasValue ? Text("Account") : null,
      trailing: Icon(CommunityMaterialIcons.chevron_right),
      onTap: () => _onTap(context),
      // onTap: onTap,
    );
  }
}
