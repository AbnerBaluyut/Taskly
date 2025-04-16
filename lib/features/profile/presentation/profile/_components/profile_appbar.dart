import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_ext.dart';
import '../../../../../core/styles/custom_colors.dart';

class ProfileAppBar extends SliverAppBar {

  ProfileAppBar({super.key}) : super(
    title: Builder(
      builder: (context) {
        return Text(
          "Profile",
          style: TextStyle(
            color: context.isDarkMode() ? Colors.white : CustomColors.gray2,
            fontSize: 25.0,
            fontWeight: FontWeight.w600
          ),
        );
      }
    ),
    surfaceTintColor: Colors.transparent,
    centerTitle: false,
  );
}