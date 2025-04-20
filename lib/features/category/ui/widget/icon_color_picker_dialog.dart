import 'dart:convert';

import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class IconColorPickerDialog extends StatefulWidget {
  final String initialIconName;
  final String initialIconColor;

  const IconColorPickerDialog({super.key, required this.initialIconName, required this.initialIconColor});

  @override
  _IconColorPickerDialogState createState() => _IconColorPickerDialogState();
}

class _IconColorPickerDialogState extends State<IconColorPickerDialog> {
  List<_IconGroup> _groups = [];
  List<String> _colors = [];
  bool _loading = true;

  late String _selectedIconName;
  late String _selectedColor;

  @override
  void initState() {
    super.initState();
    _selectedIconName = widget.initialIconName;
    _selectedColor = widget.initialIconColor;
    _loadJson();
  }

  Future<void> _loadJson() async {
    final raw = await rootBundle.loadString('assets/category_icons.json');
    final list = json.decode(raw) as List<dynamic>;

    final groups = list.map((rawGroup) {
      final parentIcon = rawGroup['icon_name'] as String;
      final parentColor = rawGroup['icon_color'] as String;
      final subs = (rawGroup['sub_categories'] as List<dynamic>)
          .map((sub) => _IconOption(
                name: sub['icon_name'] as String,
                color: sub['icon_color'] as String,
              ))
          .toList();

      return _IconGroup(
        name: rawGroup['name'] as String,
        icons: [
          _IconOption(name: parentIcon, color: parentColor),
          ...subs,
        ],
      );
    }).toList();

    final allColors = <String>{};
    for (var g in groups) {
      for (var opt in g.icons) allColors.add(opt.color);
    }

    setState(() {
      _groups = groups;
      _colors = allColors.toList();
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return SizedBox(
        height: 200,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return SafeArea(
      top: true,
      child: DefaultTabController(
        length: 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Material(
                type: MaterialType.circle,
                elevation: 4,
                color: AppColors.cardColor,
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: Center(
                    child: BudgetIcon(
                      name: _selectedIconName,
                      color: _selectedColor,
                      size: 44,
                    ),
                  ),
                ),
              ),
            ),

            const TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.center,
              tabs: [
                Tab(text: 'Icon'),
                Tab(text: 'Color'),
              ],
            ),

            Expanded(
              child: TabBarView(children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _groups.map((group) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              group.name,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(height: 8),
                            GridView.count(
                              crossAxisCount: 5,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: group.icons.map((opt) {
                                final isSel = opt.name == _selectedIconName;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedIconName = opt.name;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(4),
                                    decoration: isSel
                                        ? BoxDecoration(
                                            border: Border.all(
                                              color: AppColors.accentColor,
                                              width: 2,
                                            ),
                                            borderRadius: BorderRadius.circular(8),
                                          )
                                        : null,
                                    child: BudgetIcon(
                                      name: opt.name,
                                      color: "#7F7F7F",
                                      size: 32,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),

                // COLOR GRID
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: GridView.count(
                    crossAxisCount: 6,
                    children: _colors.map((hex) {
                      final isSel = hex == _selectedColor;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedColor = hex;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Color(
                              int.parse(hex.substring(1), radix: 16) | 0xFF000000,
                            ),
                            shape: BoxShape.circle,
                            border: isSel
                                ? Border.all(
                                    color: AppColors.accentColor,
                                    width: 2,
                                  )
                                : null,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ]),
            ),

            // OK button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop({
                    'iconName': _selectedIconName,
                    'iconColor': _selectedColor,
                  });
                },
                child: const Text('OK'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _IconGroup {
  final String name;
  final List<_IconOption> icons;

  _IconGroup({required this.name, required this.icons});
}

class _IconOption {
  final String name;
  final String color;

  _IconOption({required this.name, required this.color});
}
