import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taskly/core/extensions/context_ext.dart';
import 'package:taskly/core/extensions/double_ext.dart';

import '../../../../core/common_widgets/common_scaffold.dart';
import '../../../authentication/domain/entities/user_entity.dart';
import '../../../_common_blocs/dark_mode_cubit.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/styles/assets.dart';
import '../../../../core/styles/custom_colors.dart';
import '../../../../core/styles/dimension.dart';
import 'bloc/profile_bloc.dart';
import '_components/menu_section.dart';
import '_components/info_section.dart';
import '_components/profile_appbar.dart';

class ProfileContent extends StatefulWidget {
  const ProfileContent({super.key});

  @override
  State<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {

  UserEntity? user;

  @override
  void initState() {
    context.read<ProfileBloc>().add(LoadDataEvent());
    super.initState();
  }

  void _logOut() {
    bool isDarkMode = context.read<DarkModeCubit>().state == true;
    if (isDarkMode) {
      context.read<DarkModeCubit>().toggleDarkMode();
    }
    context.read<ProfileBloc>().add(LogOutEvent());
  }

  void _goToEditProfile(Function(bool) onSuccess) async {
    bool isSuccess = await context.push<bool>(AppRoutes.editProfile) ?? false;
    onSuccess.call(isSuccess == true);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is LogOutSuccessState) {
          context.go(AppRoutes.login);
        } else if (state is LoadDataState) {
          user = state.user;
        }
      },
      builder: (context, state) {

        if (state is LoadDataState) {
          user = state.user;
        }

        return CommonScaffold(
          body: CustomScrollView(
            slivers: [
              ProfileAppBar(),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoSection(
                      user: user,
                    ),
                    Dimension.spacingMedium.height(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Dimension.spacingMedium,
                        vertical: Dimension.spacingSmall
                      ),
                      child: Text(
                        "Account Settings",
                        style: TextStyle(
                          color: context.isDarkMode() ? Colors.white54 : CustomColors.gray,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    MenuSection(
                      icon: Assets.icEdit, 
                      title: "Edit Profile", 
                      tintColor: (context.isDarkMode() ? Colors.white : CustomColors.gray2),
                      onButtonPressed: () {
                        _goToEditProfile((isSuccess) {
                          if (!isSuccess) return;
                          context.read<ProfileBloc>().add(LoadDataEvent());
                        });
                      },
                    ),
                    MenuSection(
                      icon: Assets.icLock, 
                      title: "Change Password", 
                      tintColor: (context.isDarkMode() ? Colors.white : CustomColors.gray2),
                      onButtonPressed: () => context.push(AppRoutes.changePassword)
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
                      onButtonPressed: _logOut,
                    ),
                    Dimension.spacingLarge.height()
                  ],
                ),
              )
            ]
          ),
        );
      }
    );
  }
}