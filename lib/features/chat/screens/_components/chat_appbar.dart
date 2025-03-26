import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_extension.dart';
import '../../../../../core/styles/custom_colors.dart';

class ChatAppBar extends SliverAppBar {

  ChatAppBar({super.key}) : super(
    title: Builder(
      builder: (context) {
        return Text(
          "Chat",
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