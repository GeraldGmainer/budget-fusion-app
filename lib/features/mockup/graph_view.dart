import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class GraphView extends StatefulWidget {
  final String month;

  const GraphView({super.key, required this.month});

  @override
  _GraphViewState createState() => _GraphViewState();
}

class _GraphViewState extends State<GraphView> {
  final List<Map<String, dynamic>> _categories = [
    {'name': 'House', 'percentage': 88, 'amount': 3230.27, 'color': Colors.red, 'icon': Icons.house},
    {'name': 'Cloth', 'percentage': 12, 'amount': 426.0, 'color': Colors.purple, 'icon': Icons.checkroom},
    {'name': 'Other', 'percentage': 52, 'amount': 3972.0, 'color': Colors.grey, 'icon': Icons.miscellaneous_services},
    {'name': 'Hobby', 'percentage': 13, 'amount': 1014.0, 'color': Colors.blue, 'icon': Icons.sports_basketball},
    {'name': 'Food', 'percentage': 8, 'amount': 627.0, 'color': Colors.pink, 'icon': Icons.fastfood},
    {'name': 'Cloth', 'percentage': 4, 'amount': 315.5, 'color': Colors.blueAccent, 'icon': Icons.checkroom},
    // {'name': 'Genuss', 'percentage': 2, 'amount': 267.0, 'color': Colors.orange, 'icon': Icons.emoji_food_beverage},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.month,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.accentColor,
                ),
              ),
              SizedBox(width: 8),
              Text("345,19€", style: TextStyle(color: Colors.green, fontSize: 20)),
            ],
          ),
          SizedBox(height: 16),
          SizedBox(
            height: 270,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PieChart(
                  PieChartData(
                    sections: _categories
                        .map(
                          (category) => PieChartSectionData(
                            value: category['percentage'].toDouble(),
                            title: '',
                            color: category['color'],
                            radius: 40,
                            badgeWidget: Icon(
                              category['icon'],
                              size: 24,
                              color: Colors.white,
                            ),
                          ),
                        )
                        .toList(),
                    sectionsSpace: 3,
                    centerSpaceRadius: 100,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      '2000.00€',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      '2345,19 €',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              final category = _categories[index];
              return ListTile(
                dense: true,
                leading: Icon(
                  category['icon'],
                  color: category['color'],
                  size: 32,
                ),
                title: Text(
                  category['name'],
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                subtitle: Text(
                  '${category['percentage']}%',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                trailing: Text(
                  "${category['amount'].toStringAsFixed(2)} €",
                  style: TextStyle(
                    fontSize: 15,
                    color: category['amount'] >= 0 ? Colors.green : Colors.red,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(
              color: Colors.grey[800],
              thickness: 1,
              indent: 16,
              endIndent: 16,
            ),
          ),
        ],
      ),
    );
  }
}
