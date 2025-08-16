import 'package:flutter/material.dart';

class CalendarView extends StatefulWidget {
  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  DateTime _focusedMonth = DateTime(DateTime.now().year, DateTime.now().month);
  DateTime? _selected;
  late final Map<DateTime, List<_Tx>> _data = _mockData();

  @override
  void initState() {
    super.initState();
    _selected = DateTime(_focusedMonth.year, _focusedMonth.month, DateTime.now().day);
  }

  @override
  Widget build(BuildContext context) {
    final days = _buildMonthDays(_focusedMonth);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 16.0),
        const _WeekdayRow(),
        const SizedBox(height: 4),
        Expanded(
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 0.8,
            ),
            itemCount: days.length,
            itemBuilder: (context, i) {
              final d = days[i];
              final isCurrentMonth = d.month == _focusedMonth.month;
              final isSelected = _strip(d) == _strip(_selected);
              final dayTx = _data[_strip(d)] ?? const [];
              final net = dayTx.fold<double>(0, (p, t) => p + (t.income ? t.amount : -t.amount));
              return Padding(
                padding: const EdgeInsets.all(4),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: isCurrentMonth ? () => setState(() => _selected = d) : null,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 160),
                    decoration: BoxDecoration(
                      color: isSelected ? Theme.of(context).colorScheme.primary.withOpacity(.12) : null,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 8.0),
                        Opacity(
                          opacity: isCurrentMonth ? 1 : .35,
                          child: Text('${d.day}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                        ),
                        SizedBox(height: 2.0),
                        if (dayTx.isNotEmpty)
                          Text(
                            _netLabel(net),
                            maxLines: 1,
                            softWrap: false,
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w600,
                              color:
                                  net == 0
                                      ? Theme.of(context).colorScheme.onSurfaceVariant
                                      : net > 0
                                      ? Colors.green
                                      : Colors.red,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  static String _netLabel(double v) {
    if (v == 0) return '';
    return v.abs().toStringAsFixed(v.abs() >= 10 ? 0 : 1);
  }

  static DateTime _strip(DateTime? d) => DateTime(d!.year, d.month, d.day);

  static List<DateTime> _buildMonthDays(DateTime anchor) {
    final first = DateTime(anchor.year, anchor.month, 1);
    final last = DateTime(anchor.year, anchor.month + 1, 0);
    final start = first.subtract(Duration(days: (first.weekday + 6) % 7));
    final end = last.add(Duration(days: (7 - (last.weekday % 7)) % 7));
    final days = <DateTime>[];
    for (var d = start; !d.isAfter(end); d = d.add(const Duration(days: 1))) {
      days.add(d);
    }
    return days;
  }

  static Map<DateTime, List<_Tx>> _mockData() {
    DateTime d(int day) => DateTime(DateTime.now().year, DateTime.now().month, day);
    return {
      d(10): [_Tx('Salary', 'Salary', 3600, true, Icons.work)],
      d(9): [_Tx('Games', 'Video Game Purchase', 50.19, false, Icons.sports_esports)],
      d(8): [_Tx('Games', 'Video Game Purchase', 73.50, false, Icons.sports_esports), _Tx('Books', 'Book Purchase', 16.34, false, Icons.menu_book)],
      d(6): [_Tx('Vehicle Maintenance', 'Car Maintenance', 104.49, false, Icons.build), _Tx('Pharmacy', 'Medicines Purchase', 40.67, false, Icons.local_pharmacy)],
      d(5): [_Tx('Public Transit', 'Transit', 46.80, false, Icons.directions_bus)],
      d(3): [_Tx('Refund', 'Return', 15.00, true, Icons.autorenew)],
      d(13): [_Tx('Gift', 'Cashback', 62.00, true, Icons.card_giftcard)],
      d(20): [_Tx('Side Job', 'Income', 5.00, true, Icons.attach_money)],
      d(14): [_Tx('Snack', 'Food', 8.90, false, Icons.fastfood)],
      d(16): [_Tx('Fuel', 'Car', 33.00, false, Icons.local_gas_station)],
      d(26): [_Tx('Groceries', 'Food', 22.10, false, Icons.shopping_bag)],
    }.map((k, v) => MapEntry(DateTime(k.year, k.month, k.day), v));
  }
}

class _WeekdayRow extends StatelessWidget {
  const _WeekdayRow();

  @override
  Widget build(BuildContext context) {
    final l = MaterialLocalizations.of(context);
    final days = List.generate(7, (i) => l.narrowWeekdays[(i + l.firstDayOfWeekIndex + 1) % 7].toUpperCase());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: days.map((d) => SizedBox(width: 36, child: Center(child: Text(d, style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant))))).toList(),
      ),
    );
  }
}

class _Tx {
  final String title;
  final String subtitle;
  final double amount;
  final bool income;
  final IconData icon;

  const _Tx(this.title, this.subtitle, this.amount, this.income, this.icon);
}
