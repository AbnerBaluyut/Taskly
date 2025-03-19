import 'package:flutter/material.dart';

import '../../../../../core/styles/custom_colors.dart';

class TaskDetailsAppBar extends SliverAppBar {

   TaskDetailsAppBar({super.key, required this.onBackPressed}) : super(
    leading: IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.white),
      onPressed: onBackPressed,
    ),
    title: Text(
      'UI Enhancement: Task Details',
      style: TextStyle(
        color: Colors.white,
        fontSize: 17.0,
        fontWeight: FontWeight.w500
      ),
    ),
    centerTitle: false,
    backgroundColor: CustomColors.primaryColor,
    pinned: true,
  );

  final VoidCallback onBackPressed;
} 