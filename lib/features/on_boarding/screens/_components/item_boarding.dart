import 'package:flutter/material.dart';

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
          const SizedBox(height: Dimension.spacingLarge),
          Image.asset(image, height: 280, width: 280),
          const SizedBox(height: Dimension.spacingMedium),
          Text(
            title,
            style: TextStyle(
              color: CustomColors.primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Dimension.spacingSmall),
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