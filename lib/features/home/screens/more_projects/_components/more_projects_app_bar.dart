import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_extension.dart';
import '../../../../../core/common_widgets/common_back_button.dart';
import '../../../../../core/styles/custom_colors.dart';

class MoreProjectsAppBar extends SliverAppBar {

  MoreProjectsAppBar({super.key, required this.onBackPressed}) : super(
    leading: Builder(
      builder: (context) {
        return CommonBackButton(
          color: context.isDarkMode() ? Colors.white : Colors.black,
          onBackPressed: onBackPressed,
        );
      }
    ),
    centerTitle: true,
    surfaceTintColor: Colors.transparent,
    title: Builder(
      builder: (context) {
        return Text(
          'Projects',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: context.isDarkMode() ? Colors.white :CustomColors.gray2,
          ),
        );
      }
    ),    
    floating: true,
    snap: true,
    pinned: false
  );

  final VoidCallback onBackPressed;
}