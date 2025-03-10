import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_extension.dart';
import 'package:taskly/core/extensions/double_extension.dart';
import 'package:taskly/core/extensions/int_extension.dart';

import '../../../../../core/styles/custom_colors.dart';
import '../../../../../core/styles/dimension.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {

    var value = 50.0 / 100.0; 

    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimension.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Dimension.spacingSmall.height(),
          Text(
            "Easelife Mobile App",
            style: TextStyle(
              color: CustomColors.gray2,
              fontSize: 24.0,
              fontWeight: FontWeight.w600
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 4.0,
            children: [
              Icon(Icons.calendar_month, size: 20.0, color: context.isDarkMode() ? Colors.white60 : Colors.grey.shade600),
              Text(
                "14, February 2025", 
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: context.isDarkMode() ? Colors.white60 : Colors.grey.shade600
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "In Progress",
                style: TextStyle(
                  color: CustomColors.gray,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500
                ),
              ),
              Text(
                "50%",
                style: TextStyle(
                  color: CustomColors.gray,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500
                ),
              )
            ],
          ),
          4.height(),
          LinearProgressIndicator(
            value: value,
            backgroundColor: CustomColors.lightGray,
            color: CustomColors.primaryColor,
            minHeight: 5.0,
            borderRadius: BorderRadius.circular(Dimension.radiusLarge),
          ),
          Dimension.spacingMedium.height()
        ],
      ),
    );
  }
}