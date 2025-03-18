import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_extension.dart';
import 'package:taskly/core/extensions/double_extension.dart';

import '../../../../../../core/common_widgets/common_elevated_button.dart';
import '../../../../../../core/styles/custom_colors.dart';
import '../../../../../../core/styles/dimension.dart';

class TaskItem extends StatelessWidget {

  const TaskItem({super.key, required this.theme});

  final Color theme; 

  @override
  Widget build(BuildContext context) {

    int memberItemsLength = 10;
    bool isTabletOrIpad = (context.screenWidth() >= 600);

    int itemSize = (isTabletOrIpad) ? 150 : 80; 
    int minimumMembers = (context.screenWidth() / itemSize).floor();
    int membersLeft = (memberItemsLength - minimumMembers);
    
    return CommonElevatedButton(
      onButtonPressed: () {},
      padding: EdgeInsets.all(Dimension.paddingSmall),
      backgroundColor: context.isDarkMode() ? CustomColors.gray2 : Colors.white,
      overlayColor: theme,
      borderSide: BorderSide(color: CustomColors.gray4),
      borderRadius: BorderRadius.circular(8.0),
      custom: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: Dimension.spacingSmall,
                  children: [
                    Flexible(
                      child: Text(
                        "Easelife Mobile App",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: context.isDarkMode() ? Colors.white : CustomColors.gray
                        ),
                      ),
                    ),
                    Chip(
                      label: Text(
                        "Low",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      side: BorderSide.none,
                      backgroundColor: Colors.blue.shade900,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0)
                      ),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity(horizontal: 0.0, vertical: -4),
                      labelPadding: EdgeInsets.symmetric(
                        horizontal: Dimension.paddingMedium
                      ),
                      padding: EdgeInsets.zero
                    ),
                  ],
                ),
              ),
              Dimension.spacingMedium.width(),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: RowSuper(
                    innerDistance: -14,
                    invert: true,
                    children: [
                      ...List.generate((memberItemsLength > minimumMembers) ? (minimumMembers + 1) : memberItemsLength, (index) {      
                        if (index >= minimumMembers) {
                          return CircleAvatar(
                            backgroundColor: Colors.grey.shade400,
                            radius: 16,
                            child: CircleAvatar(
                              backgroundColor: theme,
                              radius: 15,
                              child: Text(
                                (membersLeft > 100) ? "+99" : "+$membersLeft",
                                style: TextStyle(
                                  fontSize: 13.0,
                                  color: context.isDarkMode() ? CustomColors.gray2 : Colors.white,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                          );
                        } else {
                          return CircleAvatar(
                            backgroundColor: Colors.grey.shade400,
                            radius: 16,
                            child: CircleAvatar(
                              backgroundColor: context.isDarkMode() ? CustomColors.gray2 : Colors.white,
                              radius: 15,
                              child: Icon(Icons.person, color: theme, size: 20.0)
                            ),
                          );
                        }
                      }).reversed,
                    ],
                  ),
                ),
              )
            ],
          ),
          Dimension.spacingSmall.height(),
          Text(
            "UI Enhancement: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua consequ ut labore et dolore magna aliqu fugiat nulla pariatur. Excepteur sint",
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
              color: context.isDarkMode() ? Colors.white : CustomColors.gray
            ),
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
          Dimension.spacingSmall.height(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 4.0,
            children: [
              Icon(Icons.calendar_month, size: 20.0, color: context.isDarkMode() ? Colors.white60 : Colors.grey.shade600),
              Text(
                'February 16, 2025 - 01:00 PM', 
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w400,
                  color: context.isDarkMode() ? Colors.white60 : Colors.grey.shade600
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}