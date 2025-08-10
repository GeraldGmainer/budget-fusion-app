import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../../repos/booking/booking.dart';
import '../../../../utils/utils.dart';

class BookingsTab extends StatelessWidget {
  const BookingsTab();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepoCubit<Booking>, LoadableState<List<Booking>>>(
      builder:
          (context, state) => state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: (_) => const Center(child: CircularProgressIndicator()),
            error: (e) => Center(child: Text('Error: $e')),
            loaded: (data) {
              final items = [...data]..sort((a, b) => b.date.compareTo(a.date));
              if (items.isEmpty) return const Center(child: Text('No bookings'));
              return ListView.separated(
                padding: const EdgeInsets.all(0),
                itemCount: items.length,
                separatorBuilder:
                    (_, __) => const Divider(
                      thickness: 0,
                      color: AppColors.disabledTextColor,
                      height: 0,
                    ),
                itemBuilder: (_, i) {
                  final b = items[i];
                  return ListTile(
                    dense: true,
                    // contentPadding: EdgeInsets.zero,
                    title: Text(DateTimeConverter.todMMMMYYY(b.date)),
                    subtitle: Text(b.description?.trim().isEmpty == true ? '(no description)' : b.description ?? '(no description)'),
                    trailing: Text(_moneyText(b), style: TextStyle(fontWeight: FontWeight.w600, color: b.category.categoryType.color)),
                  );
                },
              );
            },
          ),
    );
  }

  String _moneyText(Booking b) => '${b.money.amount} ${b.money.currency!.symbol}';
}
