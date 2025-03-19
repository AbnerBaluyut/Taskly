import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_extension.dart';
import 'package:taskly/core/extensions/double_extension.dart';
import 'package:taskly/core/extensions/int_extension.dart';

import '../../../../../../core/styles/custom_colors.dart';
import '../../../../../../core/styles/dimension.dart';

class TeamsSection extends StatelessWidget {

  const TeamsSection({super.key, required this.theme});

  final Color theme;


  @override
  Widget build(BuildContext context) {

    int memberItemsLength = 20;
    int itemSize = 50; 
    int minimumMembers = (context.screenWidth() / itemSize).floor();
    int membersLeft = (memberItemsLength - minimumMembers);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimension.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Teams",
            style: TextStyle(
              color: context.isDarkMode() ? Colors.white :CustomColors.gray,
              fontSize: 18.0,
              fontWeight: FontWeight.w500
            ),
          ),
          4.height(),
          SizedBox(
            height: 60.0,
            child: RowSuper(
              innerDistance: -14,
              children: [
                ...List.generate((memberItemsLength > minimumMembers) ? (minimumMembers + 1) : memberItemsLength, (index) {
                  if (index >= minimumMembers) {
                    return CircleAvatar(
                    backgroundColor: Colors.grey.shade400,
                    radius: 24,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 23,
                      child: Text(
                        (membersLeft > 100) ? "+99" : "+$membersLeft",
                        style: TextStyle(
                          fontSize: 13.0,
                          color: theme,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  );
                  } else {
                    return CircleAvatar(
                      backgroundColor: Colors.grey.shade400,
                      radius: 24,
                      child: CircleAvatar(
                        backgroundColor: theme,
                        radius: 23,
                        child: Icon(Icons.person, color: Colors.white, size: 20.0)
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
          Dimension.spacingMedium.height()
        ],
      ),
    );
  }
}