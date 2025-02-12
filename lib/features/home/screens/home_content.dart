import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskly/core/extensions/context_extension.dart';
import 'package:taskly/core/extensions/double_extension.dart';

import '../../../core/common_widgets/common_scaffold.dart';
import '../../../core/global/dark_mode_bloc.dart';
import '../../../core/styles/custom_colors.dart';
import '../../../core/styles/dimension.dart';
import '../../dashboard/bloc/bottom_nav_bloc.dart';
import '_components/home_app_bar.dart';
import '_components/sections/project_section.dart';
import '_components/sections/today_task_section.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<StatefulWidget> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {

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
      appBar: HomeAppBar(
        onTapSideMenu: () => context.read<DarkModeBloc>().toggleDarkMode(),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Dimension.spacingLarge.height(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Dimension.paddingMedium
              ),
              child: Text(
                "Manage your \ndaily task",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                  color: context.isDarkMode() ? Colors.white : CustomColors.gray2,
                  height: 0.9,
                ),
              ),
            ),
            Dimension.spacingSmall.height(),
            ProjectSection(),
            Dimension.spacingMedium.height(),
            TodayTaskSection(),
            Dimension.spacingMegaLarge.height(),
          ],
        ),
      )
    );
  } 
}