import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskly/core/extensions/context_extension.dart';
import 'package:taskly/core/extensions/double_extension.dart';

import '../../../../core/common_widgets/common_scaffold.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/styles/assets.dart';
import '../../../../core/styles/custom_colors.dart';
import '../../../../core/styles/dimension.dart';
import '_components/menu_section.dart';
import '_components/info_section.dart';

class ProfileContent extends StatefulWidget {
  const ProfileContent({super.key});

  @override
  State<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            color: context.isDarkMode() ? Colors.white : CustomColors.gray2,
            fontSize: 25.0,
            fontWeight: FontWeight.w600
          ),
        ),
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoSection(),
            Dimension.spacingMedium.height(),
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
              tintColor: (context.isDarkMode() ? Colors.white : CustomColors.gray2),
              onButtonPressed: () => context.push(AppRoutes.editProfile),
            ),
            MenuSection(
              icon: Assets.icLock, 
              title: "Change Password", 
              tintColor: (context.isDarkMode() ? Colors.white : CustomColors.gray2),
              onButtonPressed: () {}
            ),
            MenuSection(
              icon: Assets.icSupport, 
              title: "Help & Support", 
              tintColor: (context.isDarkMode() ? Colors.white : CustomColors.gray2),
              onButtonPressed: () {}
            ),
            MenuSection(
              icon: Assets.icDocument, 
              title: "Terms & Conditions", 
              tintColor: (context.isDarkMode() ? Colors.white : CustomColors.gray2),
              onButtonPressed: () {}
            ),
            MenuSection(
              icon: Assets.icSettings, 
              title: "Settings", 
              tintColor: (context.isDarkMode() ? Colors.white : CustomColors.gray2),
              onButtonPressed: () {}
            ),
            MenuSection(
              icon: Assets.icLogout,
              title: "Log out", 
              iconColor: Colors.red,
              tintColor: Colors.red,
              overlayColor: Colors.red,
              onButtonPressed: () => context.go(AppRoutes.login),
            ),
            Dimension.spacingLarge.height()
          ],
        ),
      ),
    );
  }
}