import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskly/core/extensions/context_extension.dart';

import '../../../../../core/common_widgets/common_back_button.dart';
import '../../../../../core/styles/custom_colors.dart';

class ViewNotificationsAppBar extends AppBar {

  ViewNotificationsAppBar({super.key}) : super(
    title: Builder(
      builder: (context) {
        return Text(
          'Notifications',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color: context.isDarkMode() ? Colors.white : CustomColors.gray2
          ),
        );
      }
    ),
    leading: Builder(
      builder: (context) {
        return CommonBackButton(
          onBackPressed: () => context.pop(),
        );
      }
    ),
    centerTitle: true,
  );
}