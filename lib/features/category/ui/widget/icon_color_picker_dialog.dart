import 'dart:convert';

import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class IconColorPickerDialog extends StatefulWidget {
  final String initialIconName;
  final String initialIconColor;

  const IconColorPickerDialog({
    Key? key,
    required this.initialIconName,
    required this.initialIconColor,
  }) : super(key: key);

  @override
  _IconColorPickerDialogState createState() => _IconColorPickerDialogState();
}

class _IconColorPickerDialogState extends State<IconColorPickerDialog> {
  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> _iconKeys = {};
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
    final map = json.decode(raw) as Map<String, dynamic>;
    final list = map['icons'] as List<dynamic>;
    final groups = list.map((g) {
      final name = g['name'] as String;
      final icons = (g['icons'] as List).cast<String>();
      return _IconGroup(
        name: name,
        icons: icons.map((i) => _IconOption(name: i)).toList(),
      );
    }).toList();
    final colorsData = map['colors'] as List<dynamic>;
    List<String> colors = [];
    for (var colorList in colorsData) {
      if (colorList is List) {
        colors.addAll(colorList.cast<String>());
      }
    }
    setState(() {
      _groups = groups;
      _colors = colors;
      _loading = false;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final key = _iconKeys[_selectedIconName];
      if (key?.currentContext != null) {
        Scrollable.ensureVisible(
          key!.currentContext!,
          duration: const Duration(milliseconds: 500),
          alignment: 0.5,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const SizedBox(
        height: 200,
        child: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        title: Text('Select Icon & Color'),
        elevation: 0,
        // backgroundColor: AppColors.surface,
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 8.0),
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
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _groups.map((group) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(group.name, style: Theme.of(context).textTheme.titleSmall),
                              const SizedBox(height: 8),
                              GridView.count(
                                crossAxisCount: 5,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                children: group.icons.map((opt) {
                                  final isSel = opt.name == _selectedIconName;
                                  final key = _iconKeys.putIfAbsent(opt.name, () => GlobalKey());
                                  return GestureDetector(
                                    onTap: () => setState(() => _selectedIconName = opt.name),
                                    child: Container(
                                      key: key,
                                      margin: const EdgeInsets.all(4),
                                      decoration: isSel
                                          ? BoxDecoration(
                                              border: Border.all(color: AppColors.primaryTextColor, width: 2),
                                              borderRadius: BorderRadius.circular(8),
                                            )
                                          : null,
                                      child: BudgetIcon(
                                        name: opt.name,
                                        color: isSel ? "#E0E0E0" : "#7F7F7F",
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
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: GridView.count(
                      crossAxisCount: 5,
                      children: _colors.map((hex) {
                        final isSel = hex == _selectedColor;
                        return GestureDetector(
                          onTap: () => setState(() => _selectedColor = hex),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Color(int.parse(hex.substring(1), radix: 16) | 0xFF000000),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              if (isSel)
                                Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop({
                    'iconName': _selectedIconName,
                    'iconColor': _selectedColor,
                  }),
                  child: const Text('OK'),
                ),
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

  _IconOption({required this.name});
}
