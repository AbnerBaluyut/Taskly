import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_extension.dart';
import 'package:taskly/core/extensions/int_extension.dart';

import '../../../../../core/common_widgets/common_text_field.dart';
import '../../../../../core/styles/assets.dart';

class HomeAppBar extends AppBar {

  HomeAppBar({super.key, required this.onTapSideMenu, required this.onTapNotifications}) : super(
    leading: Builder(
      builder: (context) {
        return IconButton(
          icon: Image.asset(
            Assets.menu, 
            height: 26, 
            width: 26,
            color: context.isDarkMode() ? Colors.white : Colors.black,
          ),
          padding: EdgeInsets.zero,
          onPressed: onTapSideMenu,
        );
      }
    ),
    centerTitle: true,
    surfaceTintColor: Colors.transparent,
    title: CommonTextField(
      hintText: "Search Task",
      prefixIcon: Icon(Icons.search, size: 24.0, color: Colors.grey.shade500),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100.0),
        borderSide: BorderSide(color: Colors.grey.shade400)
      ),
    ),
    titleSpacing: 0.0,
    actions: [
      5.width(),
      IconButton(
        style: IconButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
            side: BorderSide(color: Colors.grey.shade400),
          ), 
          overlayColor: Colors.black54,
          backgroundColor: Colors.grey.shade200
        ),
        icon: Stack(
          alignment: Alignment.topRight,
          children: [
            Icon(Icons.notifications_none_outlined, color: Colors.black54),
            CircleAvatar(
              radius: 4,
              backgroundColor: Colors.red,
            )
          ],
        ),
        iconSize: 25.0,
        onPressed: onTapNotifications,
      ),
      IconButton(
        style: IconButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
            side: BorderSide(color: Colors.grey.shade400),
          ),
          backgroundColor: Colors.grey.shade200,
          overlayColor: Colors.black54,
        ),
        iconSize: 25,
        icon: Image.asset(
          Assets.face,
          height: 25.0,
          width: 25.0,
          fit: BoxFit.contain,
        ),
        onPressed: () {},
      ),
      8.width(),
    ]
  );

  final VoidCallback onTapSideMenu;
  final VoidCallback onTapNotifications;
}