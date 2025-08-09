import 'package:budget_fusion_app/core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../repos/booking/booking.dart';

class AnalyticsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: RepoList<Booking>(
        builder: (context, data) {
          return _buildBookings(data);
        },
      ),
    );
  }

  Widget _buildBookings(List<Booking> bookings) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: bookings.map((booking) => _buildBooking(booking)).toList());
  }

  Widget _buildBooking(Booking booking) {
    final formattedDate = DateFormat('dd.MM.yyyy').format(booking.date);
    // final description = booking.description ?? 'No description';
    final amount = booking.amount.toString();
    final category = booking.category.name;
    return Text('$formattedDate | $amount | $category');
  }
}
