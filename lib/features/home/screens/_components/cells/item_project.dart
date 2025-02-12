import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_extension.dart';
import 'package:taskly/core/extensions/double_extension.dart';
import 'package:taskly/core/extensions/int_extension.dart';

import '../../../../../core/common_widgets/common_elevated_button.dart';
import '../../../../../core/styles/custom_colors.dart';
import '../../../../../core/styles/dimension.dart';

class ItemProject extends StatelessWidget {
  const ItemProject({
    super.key, 
    this.tagColor = Colors.transparent
  });

  final Color tagColor;

  @override
  Widget build(BuildContext context) {

    int memberItemsLength = 10; // kung ilan members naka assign sa project

    bool isTabletOrIpad = (context.screenWidth() >= 600); // check if mobile or tablet/ipad gamit niya

    int itemSize = (isTabletOrIpad) ? 150 : 80;  // eto item size ng circled image para sa mobile or tablet/ipad

    int minimumMembers = (context.screenWidth() / itemSize).floor(); // compute mo if ilan members kakasya niya. mag base lang tayo sa screen width
    
    int membersLeft = (memberItemsLength - minimumMembers); // bawasan mo ng members
    
    return CommonElevatedButton(
      onButtonPressed: () {},
      overlayColor: tagColor,
      backgroundColor: context.isDarkMode() ? CustomColors.gray2 : Colors.white,
      padding: EdgeInsets.zero,
      custom: Container(
        width: 300,
        decoration: BoxDecoration(
          border: Border.all(color: CustomColors.gray4),
          borderRadius: BorderRadius.circular(8.0),
          gradient: LinearGradient(
            stops:  [0.03, 0.03],
            colors: [tagColor, Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: Dimension.paddingMedium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start ,
          children: [
            Dimension.spacingMedium.height(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    spacing: 4.0,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Easelife Mobile App', 
                        style: TextStyle(
                          fontSize: 16.0, 
                          fontWeight: FontWeight.w500,
                          color: context.isDarkMode() ? Colors.white :CustomColors.gray2
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 4.0,
                        children: [
                          Icon(Icons.calendar_month, size: 20.0, color: context.isDarkMode() ? Colors.white60 : Colors.grey.shade600),
                          Text(
                            '14 February 2025', 
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: context.isDarkMode() ? Colors.white60 : Colors.grey.shade600
                            )
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Dimension.spacingSmall.width(),
                CircleAvatar(
                  backgroundColor: tagColor,
                  radius: 34,
                  child: Icon(Icons.person_sharp, color: Colors.white, size: 50.0,),
                )
              ],
            ),
            Divider(thickness: 0.2, color: Colors.grey,), 
            Text(
              "Description:",
              style: TextStyle(
                fontSize: 15.0, 
                fontWeight: FontWeight.w400,
                color: context.isDarkMode() ? Colors.white70 : CustomColors.gray 
              ),
            ),
            4.height(),
            Expanded(
              child: Text(
                "Lorem Ipsum is Lorem Ipsum and amets Lorem Ipsum amet. Lorem Ipsum  is a utility for creating a Lorem Ipsum. Lorem Ipsum  is a utility for creating a Lorem Ipsum and a Lorem Ipsum is a utility for creating a Lorem Ipsum and a Lorem Ipsum is a utility for creating a Lorem Ipsum and a Lorem Ipsum is a utility for creating  a Lorem Ipsum and a Lorem Ipsum is a utility for creating",
                style: TextStyle(
                  fontSize: 14.0, 
                  fontWeight: FontWeight.w400,
                  color: context.isDarkMode() ? Colors.white54 : CustomColors.gray3
                ),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Teams:', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400, color: context.isDarkMode() ? Colors.white :CustomColors.gray)),
                      RowSuper(
                        innerDistance: -14,
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
                              radius: 20,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 19,
                                child: Text(
                                  (membersLeft > 100) ? "+99" : "+$membersLeft",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: tagColor,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return CircleAvatar(
                              backgroundColor: Colors.grey.shade400,
                              radius: 20,
                              child: CircleAvatar(
                                backgroundColor: color,
                                radius: 19,
                                child: Icon(Icons.person, color: Colors.white),
                              ),
                            );
                          }
                        }),
                      )
                    ],
                  ),
                ),
                Dimension.spacingSmall.width(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10.0,
                  children: [
                    Text('Progress:', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400, color: context.isDarkMode() ? Colors.white :CustomColors.gray)),
                    Row(
                      spacing: 6.0,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            value: 0.50,
                            color: tagColor,
                            backgroundColor: Colors.grey.shade200,
                          ),
                        ),
                        Text('50%', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: context.isDarkMode() ? Colors.white60 : CustomColors.gray2)),
                      ],
                    )
                  ],
                )
              ],
            ),
            Dimension.spacingLarge.height()
          ],
        )
      ),
    );
  }
}