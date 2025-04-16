import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_ext.dart';
import '../../../../../../core/styles/custom_colors.dart';

class DateAndTimeSection extends StatelessWidget {

  const DateAndTimeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 4.0,
      children: [
        Icon(Icons.calendar_month, size: 20.0, color: context.isDarkMode() ? Colors.white60 : CustomColors.gray3),
        Text(
          'February 14, 2025', 
          style: TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.w400,
            color: context.isDarkMode() ? Colors.white : CustomColors.gray3
          )
        ),
      ],
    );
  }
}