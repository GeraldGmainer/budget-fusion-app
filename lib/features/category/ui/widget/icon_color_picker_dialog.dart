import 'dart:convert';

import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class IconColorPickerDialog extends StatefulWidget {
  final String initialIconName;
  final String initialIconColor;

  const IconColorPickerDialog({
    super.key,
    required this.initialIconName,
    required this.initialIconColor,
  });

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
            _buildPreview(),
            _buildTabs(),
            _buildTabViews(),
            _buildOkButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildPreview() {
    return Padding(
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
    );
  }

  Widget _buildTabs() {
    return const TabBar(
      isScrollable: true,
      tabAlignment: TabAlignment.center,
      tabs: [
        Tab(text: 'Icon'),
        Tab(text: 'Color'),
      ],
    );
  }

  Widget _buildTabViews() {
    return Expanded(
      child: TabBarView(
        children: [
          IconSelectionTab(
            groups: _groups,
            selectedIconName: _selectedIconName,
            onIconSelected: (name) => setState(() => _selectedIconName = name),
          ),
          ColorSelectionTab(
            colors: _colors,
            selectedColor: _selectedColor,
            onColorSelected: (color) => setState(() => _selectedColor = color),
          ),
        ],
      ),
    );
  }

  Widget _buildOkButton() {
    return Align(
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

class ColorSelectionTab extends StatefulWidget {
  final List<String> colors;
  final String selectedColor;
  final Function(String) onColorSelected;

  const ColorSelectionTab({
    super.key,
    required this.colors,
    required this.selectedColor,
    required this.onColorSelected,
  });

  @override
  State<ColorSelectionTab> createState() => _ColorSelectionTabState();
}

class _ColorSelectionTabState extends State<ColorSelectionTab> {
  final Map<String, GlobalKey> _colorKeys = {};
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final key = _colorKeys[widget.selectedColor];
      if (key?.currentContext != null) {
        Scrollable.ensureVisible(
          key!.currentContext!,
          duration: Duration(milliseconds: 500),
          alignment: 0.5,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.count(
        controller: _scrollController,
        crossAxisCount: 5,
        children: widget.colors.map((hex) {
          final isSel = hex == widget.selectedColor;
          final key = _colorKeys.putIfAbsent(hex, () => GlobalKey());
          return GestureDetector(
            onTap: () => widget.onColorSelected(hex),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  key: key,
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
    );
  }
}

class IconSelectionTab extends StatefulWidget {
  final List<_IconGroup> groups;
  final String selectedIconName;
  final Function(String) onIconSelected;

  const IconSelectionTab({
    super.key,
    required this.groups,
    required this.selectedIconName,
    required this.onIconSelected,
  });

  @override
  State<IconSelectionTab> createState() => _IconSelectionTabState();
}

class _IconSelectionTabState extends State<IconSelectionTab> {
  final Map<String, GlobalKey> _iconKeys = {};
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final key = _iconKeys[widget.selectedIconName];
      if (key?.currentContext != null) {
        Scrollable.ensureVisible(
          key!.currentContext!,
          duration: Duration(milliseconds: 500),
          alignment: 0.5,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.groups.map((group) {
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
                    final isSel = opt.name == widget.selectedIconName;
                    final key = _iconKeys.putIfAbsent(opt.name, () => GlobalKey());
                    return GestureDetector(
                      onTap: () => widget.onIconSelected(opt.name),
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
    );
  }
}
