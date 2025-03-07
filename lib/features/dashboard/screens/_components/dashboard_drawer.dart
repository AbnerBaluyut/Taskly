import 'package:flutter/material.dart';

import '../../../../../core/styles/custom_colors.dart';

class DashboardDrawer extends StatelessWidget {

  const DashboardDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: CustomColors.primaryColor,
            ),
            child: Text(
              'Taskly',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Projects'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}