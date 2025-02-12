import 'package:flutter/material.dart';

import '../../../../../core/styles/custom_colors.dart';

class MoreProjectsAppBar extends AppBar {

  MoreProjectsAppBar({super.key, required this.onBackPressed}) : super(
    leading: IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.black),
      onPressed: onBackPressed,
    ),
    centerTitle: true,
    surfaceTintColor: Colors.transparent,
    title: Text(
      'Projects',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: CustomColors.gray2,
      ),
    ),
  );

  final VoidCallback onBackPressed;
}