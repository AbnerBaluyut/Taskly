import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/double_ext.dart';

import '../../../../core/styles/custom_colors.dart';
import '../../../../core/styles/dimension.dart';

class ItemBoarding extends StatelessWidget {


  const ItemBoarding({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
   
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimension.spacingExtraLarge
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Dimension.spacingLarge.height(),
          Image.asset(image, height: 280, width: 280),
          Dimension.spacingMedium.height(),
          Text(
            title,
            style: TextStyle(
              color: CustomColors.primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          Dimension.spacingSmall.height(),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ), 
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}