import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskly/core/extensions/context_ext.dart';
import 'package:taskly/core/extensions/double_ext.dart';

import 'common_elevated_button.dart';
import '../router/app_routes.dart';
import '../styles/custom_colors.dart';
import '../styles/dimension.dart';

class CommonItemTask extends StatelessWidget {

  const CommonItemTask({
    super.key, 
    this.status,
    required this.label,
    this.labelColor = CustomColors.primaryColor,
    this.statusColor = CustomColors.primaryColor,
    this.statusVisibility = true
  }) : assert(
    (statusVisibility == true && status == null) ? false : true
  );

  final bool statusVisibility;
  final Color statusColor;
  final String? status; 

  final Color labelColor;
  final String label;

  @override
  Widget build(BuildContext context) {

    int memberItemsLength = 10;
    bool isTabletOrIpad = (context.screenWidth() >= 600);
    int itemSize = (isTabletOrIpad) ? 150 : 80; 
    int minimumMembers = (context.screenWidth() / itemSize).floor();
    int membersLeft = (memberItemsLength - minimumMembers);
  
    return CommonElevatedButton(
      onButtonPressed: () => context.push(AppRoutes.taskDetails),
      padding: EdgeInsets.zero,
      backgroundColor: context.isDarkMode() ?CustomColors.gray2 : Colors.white,
      overlayColor: statusColor,
      custom: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: CustomColors.gray4),
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.transparent
            ),
            padding: EdgeInsets.symmetric(
              horizontal: Dimension.paddingSmall,
              vertical: Dimension.paddingSmall
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: "Easelife Mobile App ",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: context.isDarkMode() ? Colors.white : CustomColors.gray
                          ),
                          children: [
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Chip(
                                label: Text(
                                  label,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                                side: BorderSide.none,
                                backgroundColor: labelColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0)
                                ),
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                visualDensity: VisualDensity(horizontal: 0.0, vertical: -4),
                                labelPadding: EdgeInsets.symmetric(
                                  horizontal: Dimension.paddingMedium,
                                ),
                                padding: EdgeInsets.zero,
                              )
                            )
                          ]
                        ),
                        textScaler: MediaQuery.textScalerOf(context),
                      ),
                    ),
                    if (statusVisibility) SizedBox(width: 100.0),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  spacing: 4.0,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 4.0,
                      children: [
                        Icon(Icons.calendar_month, size: 20.0, color: context.isDarkMode() ? Colors.white60 : Colors.grey.shade600),
                        Text(
                          'February 14, 2025', 
                          style: TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.w400,
                            color: context.isDarkMode() ? Colors.white60 : Colors.grey.shade600
                          )
                        ),
                      ],
                    ),
                    RowSuper(
                      innerDistance: -14,
                      invert: true,
                      children: List.generate((memberItemsLength > minimumMembers) ? (minimumMembers + 1) : memberItemsLength, (index) {
                        Color? color;
                        if (index == 0) {
                          color = Colors.blue;
                        } else if (index == 1) {
                          color = Colors.green;
                        } else if (index == 2) {
                          color = Colors.cyan;
                        } else if (index == 3) {
                          color = Colors.amberAccent;
                        } else if (index == 4) {
                          color = Colors.deepOrange;
                        } else if (index == 5) {
                          color = Colors.pink;
                        } else if (index == 6) {
                          color = Colors.deepPurple;
                        } else if (index == 7) {
                          color = Colors.brown;
                        } else if (index == 8) {
                          color = Colors.blueGrey;
                        } else if (index == 9) {
                          color = Colors.blueGrey.shade300;
                        }
          
                        if (index >= minimumMembers) {
                          return CircleAvatar(
                            backgroundColor: Colors.grey.shade400,
                            radius: 16,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 15,
                              child: Text(
                                (membersLeft > 100) ? "+99" : "+$membersLeft",
                                style: TextStyle(
                                  fontSize: 13.0,
                                  color: statusColor,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            )
                          );
                        } else {
                          return CircleAvatar(
                            backgroundColor: Colors.grey.shade400,
                            radius: 16,
                            child: CircleAvatar(
                            backgroundColor: color,
                              radius: 15,
                              child: Icon(Icons.person, color: Colors.white, size: 20.0),
                            ),
                          );
                        }
                      }).reversed.toList(),
                    )
                  ],
                )
              ],
            )
          ),
          Visibility(
            visible: statusVisibility,
            child: Container(
              width: 85,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0)
                )
              ),
              padding: EdgeInsets.symmetric(
                vertical: Dimension.paddingSmall,
              ),
              margin: EdgeInsets.only(
                right: Dimension.marginSmall
              ),
              child: Text(
                status ?? "",
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}