import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_extension.dart';
import 'package:taskly/core/extensions/double_extension.dart';

import '../../../../core/styles/custom_colors.dart';
import '../../../../core/styles/dimension.dart';

class ItemProject extends StatelessWidget {
  const ItemProject({super.key, required this.tagColor});

  final Color? tagColor;

  @override
  Widget build(BuildContext context) {

    int memberItemsLength = 8;
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    int itemSize = (isPortrait) ? 80 : 150; 
    int minMember = (context.screenWidth() / itemSize).floor();
    
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: 300,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.symmetric(horizontal: Dimension.paddingMedium),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start ,
            children: [
              Dimension.spacingMedium.height(),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('{{Project Name}}', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                        Row(
                          spacing: 4.0,
                          children: [
                            Icon(Icons.calendar_month, size: 20.0,),
                            Text('14 Februart 2025', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold))
                          ],
                        )
                      ],
                    ),
                  ),
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
                  color: CustomColors.gray 
                ),
              ),
              Expanded(
                child: Text(
                  "Lorem Ipsum is Lorem Ipsum and amets Lorem Ipsum amet. Lorem Ipsum  is a utility for creating a Lorem Ipsum. Lorem Ipsum  is a utility for creating a Lorem Ipsum and a Lorem Ipsum is a utility for creating a Lorem Ipsum and a Lorem Ipsum is a utility for creating a Lorem Ipsum and a Lorem Ipsum is a utility for creating  a Lorem Ipsum and a Lorem Ipsum is a utility for creating",
                  style: TextStyle(
                    fontSize: 14.0, 
                    fontWeight: FontWeight.w400,
                    color: CustomColors.gray3
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
                        Text('Teams:', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400, color: CustomColors.gray)),
                        RowSuper(
                          innerDistance: -14,
                          children: List.generate((memberItemsLength > minMember) ? (minMember + 1) : memberItemsLength, (index) {
                            int numLeft = memberItemsLength - minMember;
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

                            if (index >= minMember) {
                              return CircleAvatar(
                                backgroundColor: Colors.grey.shade600,
                                radius: 20,
                                child: Text(
                                  (numLeft > 100) ? "+99" : "+${memberItemsLength - minMember}",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                              );
                            } else {
                              return CircleAvatar(
                                backgroundColor: color,
                                radius: 20,
                                child: Icon(Icons.person, color: Colors.white),
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
                      Text('Progress:', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400, color: CustomColors.gray)),
                      Row(
                        spacing: 6.0,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              value: 0.55,
                              color: tagColor,
                              backgroundColor: Colors.grey.shade200,
                            ),
                          ),
                          Text('75%', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: CustomColors.gray2)),
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
        Container(
          height: 10,
          width: 300.0,
          decoration: BoxDecoration(
            color: tagColor,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.0), bottomRight: Radius.circular(8.0)),
          ),
        )
      ],
    );
  }
}