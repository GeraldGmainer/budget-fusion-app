import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

import '../../../domain/domain.dart';

class SummaryView extends StatefulWidget {
  final List<ChartViewData> charts;

  const SummaryView({super.key, required this.charts});

  @override
  State<SummaryView> createState() => _SummaryViewState();
}

class _SummaryViewState extends State<SummaryView> {
  PageController? _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.charts.length - 1);
    _currentPage = widget.charts.length - 1;
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.charts.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final chart = widget.charts[index];
              final balance = chart.period.income - chart.period.outcome;
              final date = chart.period.filter.dateTime ?? DateTime.now();

              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _buildChartCard(chart, balance, date),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildChartCard(ChartViewData chart, Decimal balance, DateTime date) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Currency Display
        Text(
          "${date.year}.${date.month.toString().padLeft(2, '0')}",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),

        // Income Display
        _buildRow("Income:", "${chart.currency.symbol}${chart.period.income.toDouble().toStringAsFixed(2)}", Colors.green),

        const SizedBox(height: 4.0),

        // Outcome Display
        _buildRow("Outcome:", "${chart.currency.symbol}${chart.period.outcome.toDouble().toStringAsFixed(2)}", Colors.red),

        const SizedBox(height: 4.0),

        // Balance Display
        _buildRow(
          "Balance:",
          "${chart.currency.symbol}${balance.toDouble().toStringAsFixed(2)}",
          balance >= Decimal.zero ? Colors.green : Colors.red,
        ),

        const SizedBox(height: 12.0),

        // Categories Display
        Text(
          "Categories:",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: chart.categorySummaries.length,
            itemBuilder: (context, index) {
              final summary = chart.categorySummaries[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        summary.categoryName,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "${summary.percentage}%",
                        style: const TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        summary.value.toStringAsFixed(2),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRow(String label, String value, Color valueColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 16, color: valueColor),
        ),
      ],
    );
  }
}
