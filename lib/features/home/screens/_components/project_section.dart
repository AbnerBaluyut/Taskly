import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/double_extension.dart';
import 'package:taskly/core/extensions/int_extension.dart';

import '../../../../core/styles/custom_colors.dart';
import '../../../../core/styles/dimension.dart';
import 'item_project.dart';

class ProjectSection extends StatelessWidget {

  const ProjectSection({super.key});
  

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
                'Project',
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
        SizedBox(
          height: 320,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(
              horizontal: Dimension.paddingMedium
            ),
            itemBuilder: (ctx, index) {
              if (index == 0) {
                return ItemProject(
                  tagColor: Colors.red,
                );  
              }


              return ItemProject(
                tagColor: CustomColors.primaryColor,
              );
            }, 
            separatorBuilder: (ctx, index) {
              return Dimension.paddingMedium.width();
            }, 
            itemCount: 2
          ),
        )
      ],
    );
  }
}