import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/features/booking/application/cubits/save_booking_cubit.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/booking_draft.dart';

class AccountSelectInput extends StatelessWidget {
  final BookingDraft draft;

  const AccountSelectInput({required this.draft});

  _onTap(BuildContext context) async {
    final accounts = context.read<AccountCubit>().state.whenOrNull(loaded: (accounts) => accounts) ?? [];

    final Account? selectedAccount = await showSelectionBottomSheet<Account?>(
      context: context,
      title: "booking.select_account",
      items: accounts,
      selectedItem: draft.account,
      itemLabelBuilder: (account) {
        return Text(account?.name ?? "unknonwn");
      },
    );

    if (selectedAccount != null && context.mounted) {
      context.read<SaveBookingCubit>().updateDraft((draft) => draft.copyWith(account: selectedAccount));
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _onTap(context);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        // color: Colors.red,
        child: Icon(IconConverter.getIcon(draft.account?.iconName), size: 28),
      ),
    );
  }
}
