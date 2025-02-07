import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_extension.dart';

import '../../../../../core/styles/custom_colors.dart';
import '../../../../../core/styles/dimension.dart';

class SelectMediaBottomSheet extends StatelessWidget {

  const SelectMediaBottomSheet({super.key, required this.onTapCamera, required this.onTapGallery});

  final VoidCallback onTapCamera;
  final VoidCallback onTapGallery;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Container(
        decoration: BoxDecoration(
          color: context.isDarkMode() ? CustomColors.gray2 : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8)
          )
        ),
        padding: EdgeInsets.all(Dimension.paddingMedium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                height: 6.0,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(5)
                ),
              )
            ),
            const SizedBox(height: Dimension.spacingLarge),
            Text(
              "Upload Profile Picture",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: context.isDarkMode() ? Colors.white : CustomColors.gray2
              ),
            ),
            const SizedBox(height: Dimension.spacingMedium),
            ListTile(
              leading: Icon(Icons.camera_alt, color: CustomColors.primaryColor,),
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: Text(
                "Take a photo",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: context.isDarkMode() ? Colors.white : CustomColors.gray2
                ),
              ),
              onTap: onTapCamera,
            ),
            ListTile(
              leading: Icon(Icons.image, color: CustomColors.primaryColor,),
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: Text(
                "Upload from Gallery",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: context.isDarkMode() ? Colors.white : CustomColors.gray2
                ),
              ),
              onTap: onTapGallery,
            )
          ],
        ),
      ),
    );
  }
}