import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_extension.dart';

import '../../../../core/styles/custom_colors.dart';
import 'sections/tabs_section.dart';

class ChatPersistentDelegate extends SliverPersistentHeaderDelegate {

  ChatPersistentDelegate({
    required this.controller,
    this.onTap
  });

  TabController? controller;
  final void Function(int)? onTap;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {

    double topPadding = shrinkOffset > 0.0 ? 25.0 : 0.0;
    
    return Container(
      padding: EdgeInsets.only(
        top: topPadding
      ),
      decoration: BoxDecoration(
        color: context.isDarkMode() ? CustomColors.gray2 :Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(50, 120),
          bottomRight: Radius.elliptical(50, 120),
        ),
      ),
      child: TabsSection(
        controller: controller,
        onTap: onTap,
      ),
    );
  }

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}