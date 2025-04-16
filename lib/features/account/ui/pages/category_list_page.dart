import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CategoryListPage extends StatefulWidget {
  @override
  State<CategoryListPage> createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories").tr(),
      ),
      body: Center(child: Text("Categories")),
    );
  }
}
