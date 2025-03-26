import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_extension.dart';
import 'package:taskly/core/extensions/double_extension.dart';
import 'package:taskly/core/extensions/int_extension.dart';

import '../../../../../../core/styles/custom_colors.dart';
import '../../../../../../core/styles/dimension.dart';

class ItemNotification2 extends StatelessWidget {
  
  const ItemNotification2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Colors.grey.shade400,
          width: 0.5
        )
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Dimension.paddingSmall,
        vertical: Dimension.paddingMedium,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            radius: 18.0,
            child: Icon(Icons.notifications_none_rounded, color: Colors.black, size: 20.0),
          ),
          Dimension.spacingSmall.width(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: Dimension.spacingSmall,
                  children: [
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: "Task Reminder ",
                          children: [
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Badge(
                                smallSize: 6.0,
                                backgroundColor: CustomColors.primaryColor,
                              )
                            ),
                          ],
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            color: context.isDarkMode() ? Colors.white : CustomColors.gray2,
                          ),
                        ),
                        textScaler: MediaQuery.textScalerOf(context),
                      ),
                    ),
                    Text(
                      "1h ago",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: context.isDarkMode() ? Colors.white : CustomColors.gray3,
                      ),
                    )   
                  ],
                ),
                4.height(),
                RichText(
                  text: TextSpan(
                    text: "You have only",
                    children: [
                      TextSpan(
                        text: " 1 hour left",
                      ),
                      TextSpan(
                        text: " to complete your task in the",
                      ),
                      TextSpan(
                        text: " Easelife Mobile App.",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                          color: context.isDarkMode() ? Colors.white : CustomColors.gray2
                        ),
                      ),
                      TextSpan(
                        text: " Please finish it before the deadline."
                      )
                    ],
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: context.isDarkMode() ? Colors.white70 : CustomColors.gray2
                    ),
                  ),
                  textScaler: MediaQuery.textScalerOf(context),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}