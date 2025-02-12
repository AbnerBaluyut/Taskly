import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_extension.dart';
import 'package:taskly/core/extensions/double_extension.dart';
import 'package:taskly/core/extensions/int_extension.dart';

import '../../../../../../core/styles/custom_colors.dart';
import '../../../../../../core/styles/dimension.dart';
import '../cells/item_task.dart';

class TodayTaskSection extends StatelessWidget {
  
  const TodayTaskSection({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        20.height(),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimension.paddingMedium
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Task Today',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: context.isDarkMode() ? Colors.white :CustomColors.gray2,
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  overlayColor: Colors.transparent,
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact
                ),
                onPressed: () {},
                child: Text(
                  "View More",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: CustomColors.primaryColor,
                  ),
                ),
              )
            ],
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: Dimension.paddingMedium,
            vertical: Dimension.paddingMedium
          ),
          itemBuilder: (ctx, index) {

            if (index == 0) {
              return ItemTask(
                status: "In Progress",
                statusColor: Colors.red,
                label: "Low",
                labelColor: Colors.green.shade900,
              );  
            } else if (index == 1) {
              return ItemTask(
                status: "Done",
                statusColor: Colors.green.shade900,
                label: "Mid",
                labelColor: Colors.blue.shade900,
              );
            } else {
              return ItemTask(
                status: "To Do",
                statusColor: Colors.blue.shade900,
                label: "High",
                labelColor: Colors.red,
              );
            }
          }, 
          separatorBuilder: (ctx, index) {
            return Dimension.paddingMedium.height();
          }, 
          itemCount: 3
        )
      ],
    );
  }


}