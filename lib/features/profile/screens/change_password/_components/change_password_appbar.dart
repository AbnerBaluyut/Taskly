import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_extension.dart';

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
        return IconButton(
          icon: Icon(Icons.arrow_back, color: context.isDarkMode() ? Colors.white : Colors.black),
          onPressed: onBackPressed,
        );
      }
    ),
  );

  final VoidCallback onBackPressed;
}