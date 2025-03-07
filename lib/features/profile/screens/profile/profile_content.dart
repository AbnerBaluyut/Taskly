import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskly/core/extensions/context_extension.dart';
import 'package:taskly/core/extensions/double_extension.dart';

import '../../../../core/common_widgets/common_image.dart';
import '../../../../core/common_widgets/common_scaffold.dart';
import '../../../../core/styles/assets.dart';
import '../../../../core/styles/custom_colors.dart';
import '../../../../core/styles/dimension.dart';
import '../../../dashboard/bloc/bottom_nav_bloc.dart';
import '_components/menu_section.dart';

class ProfileContent extends StatefulWidget {
  const ProfileContent({super.key});

  @override
  State<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {

  final _scrollController = ScrollController();
  final _scrollThreshold = 100.0;

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {

    final currentScroll = _scrollController.offset;
    final isVisible = context.read<BottomNavBloc>().state;

    if (currentScroll >= _scrollThreshold && isVisible) {
      context.read<BottomNavBloc>().setIsHideBottomNav(false);
    } else if (currentScroll < _scrollThreshold && !isVisible) {
      context.read<BottomNavBloc>().setIsHideBottomNav(true);
    }
  }


  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Dimension.spacingSuperLarge.height(),
            Padding(
               padding: const EdgeInsets.symmetric(horizontal: Dimension.paddingMedium),  
              child: Text(
                "Profile",
                style: TextStyle(
                  color: context.isDarkMode() ? Colors.white : CustomColors.gray2,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Dimension.paddingMedium,
                vertical: Dimension.paddingSmall
              ),
              child: Row(
                children: [
                  CommonImage(
                    path: Assets.face,
                    height: 80.0,
                    width: 80.0,
                    fit: BoxFit.contain,
                    radius: 40.0
                  ),
                  const SizedBox(width: Dimension.spacingMedium),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "John Doe",
                          style: TextStyle(
                            color: context.isDarkMode() ? Colors.white : CustomColors.gray2,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                        Text(
                          "johndoe@gmail.com",
                          style: TextStyle(
                            color: context.isDarkMode() ? Colors.white : CustomColors.gray,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w300
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Dimension.spacingMedium,
                vertical: Dimension.spacingSmall
              ),
              child: Text(
                "Account Settings",
                style: TextStyle(
                  color: CustomColors.gray,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            MenuSection(
              icon: Assets.icEdit, 
              title: "Edit Profile", 
              onButtonPressed: () {}
            ),
            MenuSection(
              icon: Assets.icLock, 
              title: "Change Password", 
              onButtonPressed: () {}
            ),
            MenuSection(
              icon: Assets.icSupport, 
              title: "Help & Support", 
              onButtonPressed: () {}
            ),
            MenuSection(
              icon: Assets.icDocument, 
              title: "Terms & Conditions", 
              onButtonPressed: () {}
            ),
            MenuSection(
              icon: Assets.icSettings, 
              title: "Settings", 
              onButtonPressed: () {}
            ),
            MenuSection(
              icon: Assets.icLogout, 
              title: "Log out", 
              onButtonPressed: () {},
              isLogOut: true
            )
          ],
        ),
      ),
    );
  }
}