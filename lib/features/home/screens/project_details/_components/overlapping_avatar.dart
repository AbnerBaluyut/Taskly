import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_extension.dart';

import '../../../../../core/common_widgets/common_image.dart';
import '../../../../../core/styles/assets.dart';
import '../../../../../core/styles/custom_colors.dart';

class OverlappingAvatar extends StatelessWidget {
  
  const OverlappingAvatar({
    super.key, 
    required this.index,
    this.height = 56.0,
    this.width = 56.0,
    this.left = 40.0,
    this.right = 20.0
  });

  final int index;
  final double? height;
  final double? width;
  final double left;
  final double right;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: right == 0.0 ? null  : index * right,
      left: left == 0.0 ? null : index * left,
      child: CommonImage(
        path: Assets.face,
        height: height,
        width: width,
        fit: BoxFit.contain,
        backgroundColor: context.isDarkMode() ? Colors.white : CustomColors.gray2,
        radius: 28.0,
        border: 1.0,
        borderColor: CustomColors.lightGray2,
      )
    );
  }
}