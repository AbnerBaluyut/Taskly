import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_ext.dart';

import '../../../../../core/common_widgets/common_back_button.dart';
import '../../../../../core/styles/custom_colors.dart';

class CreateProjectAppBar extends AppBar {

  CreateProjectAppBar({super.key}) : super(
    leading: Builder(
      builder: (context) {
        return CommonBackButton(
          onBackPressed: () => context.popSafely(),
        );
      }
    ),
    surfaceTintColor: Colors.transparent,
    title: Builder(
      builder: (context) {
        return Text(
          'Create Project',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: context.isDarkMode() ? Colors.white :CustomColors.gray2,
          ),
        );
      }
    ),
  );
}