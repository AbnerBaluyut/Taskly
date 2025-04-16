import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_ext.dart';
import 'package:taskly/core/extensions/int_ext.dart';

import '../../../../../core/common_widgets/common_text_field.dart';
import '../../../../../core/styles/custom_colors.dart';
import '../../../../../core/styles/dimension.dart';

class SearchHeaderDelegate extends SliverPersistentHeaderDelegate {

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {

    double topPadding = shrinkOffset > 0.0 ? 20.0 : 0.0;
    
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(50, 120),
          bottomRight: Radius.elliptical(50, 120),
        ),
        color: context.isDarkMode() ? CustomColors.gray2 :Colors.white,
      ),
      alignment: Alignment.center,
      child: AnimatedContainer(
        duration: 300.milliseconds(),
        curve: Curves.easeInOut,
        padding: EdgeInsets.only(
          right: Dimension.paddingMedium,
          left: Dimension.paddingMedium,
          top: topPadding
        ),
        child: CommonTextField(
          hintText: "Search Project",
          hintStyle: TextStyle(
            fontSize: 15.0,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide(color: Colors.grey.shade400)
          ),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }
  
  @override
  double get maxExtent => 70.0;
  
  @override
  double get minExtent => 70.0;
  
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}