import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common_widgets/common_scaffold.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/styles/assets.dart';
import '../../../../core/styles/custom_colors.dart';
import '../../../../core/styles/dimension.dart';
import '../../../dashboard/bloc/bottom_nav_bloc.dart';
import '_components/menu_section.dart';
import '_components/profile_header.dart';

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
            ProfileHeader(),
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
              onButtonPressed: () => context.push(AppRoutes.editProfile),
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
              onButtonPressed: () => context.go(AppRoutes.login),
              isLogOut: true
            )
          ],
        ),
      ),
    );
  }
}