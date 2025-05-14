import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/booking_draft.dart';

class CategorySelectInput extends StatelessWidget {
  final BookingDraft draft;

  const CategorySelectInput({required this.draft});

  _onTap(BuildContext context) async {
    final accounts = context.read<AccountCubit>().state.whenOrNull(loaded: (accounts) => accounts) ?? [];

    // final Account? selectedAccount = await showSelectionBottomSheet<Account>(
    //   context: context,
    //   title: "booking.select_account",
    //   items: accounts,
    //   selectedItem: draft.account,
    //   itemLabelBuilder: (account) {
    //     return Row(
    //       children: [
    //         SizedBox(
    //           width: 45,
    //           child: Icon(IconConverter.getIcon(account.iconName), color: ColorConverter.stringToColor(account.iconColor)),
    //         ),
    //         Text(account.name),
    //       ],
    //     );
    //   },
    // );

    // if (selectedAccount != null && context.mounted) {
    //   context.read<BookingSaveCubit>().updateDraft((draft) => draft.copyWith(account: selectedAccount));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onTap(context);
      },
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: "Category",
          labelStyle: TextStyle(fontSize: 12, color: AppColors.secondaryTextColor),
          suffixIcon: Icon(Icons.arrow_drop_down),
        ),
        child: Text(
          draft.account?.name ?? "Select Category",
          style: TextStyle(fontSize: 13, color: AppColors.primaryTextColor),
        ),
      ),
    );
  }
}
