import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taskly/core/extensions/int_extension.dart';

import '../../../../core/common_widgets/common_text_field.dart';

class HomeAppBar extends AppBar {

  HomeAppBar({super.key}) : super(
    leading: IconButton(
      icon: Icon(FontAwesomeIcons.barsStaggered, size: 20.0),
      padding: EdgeInsets.zero,
      onPressed: () {},
    ),
    toolbarHeight: 80.0,
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
      10.width(),
      IconButton(
        style: IconButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
            side: BorderSide(color: Colors.grey.shade400),
          ), 
          overlayColor: Colors.black54,
          backgroundColor: Colors.grey.shade200
        ),
        icon: Icon(Icons.notifications_none_outlined),
        iconSize: 24.0,
        onPressed: () {},
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
        icon: Icon(Icons.person_outline_sharp),
        onPressed: () {},
      ),
    ]
  );
}