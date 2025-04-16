import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_ext.dart';

import '../../../../../core/common_widgets/common_back_button.dart';

class ChangePasswordAppBar extends AppBar {

  ChangePasswordAppBar({super.key, required this.onBackPressed}) : super(
    title: Builder(
      builder: (context) {
        return Text(
          'Change Password',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: context.isDarkMode() ? Colors.white : Colors.black,
          ),
        );
      }
    ),
    centerTitle: false,
    leading: Builder(
      builder: (context) {
        return CommonBackButton(
          color: context.isDarkMode() ? Colors.white : Colors.black,
          onBackPressed: onBackPressed,
        );
      }
    ),
  );

  final VoidCallback onBackPressed;
}