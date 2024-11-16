import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'widgets/profile_info.dart';

class RightDrawer extends StatelessWidget {
  // _goToPage(BuildContext context, String route) {
  //   Navigator.pop(context);
  //   Navigator.of(context).pushNamed(route);
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        width: 230,
        child: ListView(
          children: [
            ProfileInfo(),
            ListTile(
              leading: Icon(Icons.category),
              title: Text("main.drawer.category_button").tr(),
              onTap: () {
                // TODO
                // _goToPage(context, CategoryListPage.route);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text("main.drawer.account_button").tr(),
              onTap: () {
                // TODO
                // _goToPage(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("main.drawer.settings_button").tr(),
              onTap: () {
                // TODO
                // _goToPage(context, SettingsPage.route);
              },
            ),
          ],
        ),
      ),
    );
  }
}
