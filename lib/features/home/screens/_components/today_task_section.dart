import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/double_extension.dart';
import 'package:taskly/core/extensions/int_extension.dart';

import '../../../../core/styles/custom_colors.dart';
import '../../../../core/styles/dimension.dart';

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
                'Today Task',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: CustomColors.gray2,
                ),
              ),
              TextButton(
               style: TextButton.styleFrom(
                  overlayColor: Colors.transparent,
                  padding: EdgeInsets.zero
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
            return Container(
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(color: CustomColors.gray2),
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: Dimension.paddingMedium),
              child: Text(
                'Task Title',
                style: TextStyle(fontSize: 16.0),
              )
            );
          }, 
          separatorBuilder: (ctx, index) {
            return Dimension.paddingMedium.height();
          }, 
          itemCount: 10
        )
      ],
    );
  }


}