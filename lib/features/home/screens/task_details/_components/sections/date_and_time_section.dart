import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_extension.dart';
import '../../../../../../core/styles/custom_colors.dart';
import '../../../../../../core/styles/dimension.dart';

class DateAndTimeSection extends StatelessWidget {

  const DateAndTimeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: Dimension.spacingMedium,
      children: [
        Row(
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
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 4.0,
          children: [
            Icon(Icons.access_time_outlined, size: 20.0, color: context.isDarkMode() ? Colors.white60 : CustomColors.gray3),
            Text(
              '01:00 AM - 10:00 PM', 
              style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w400,
                color: context.isDarkMode() ? Colors.white : CustomColors.gray3
              )
            ),
          ],
        ),
      ],
    );
  }
}