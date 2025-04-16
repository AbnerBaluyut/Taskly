import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskly/core/extensions/context_ext.dart';
import '../../../../core/styles/assets.dart';
import '../../../../core/styles/custom_colors.dart';
import '../../../_common_blocs/bottom_nav_cubit.dart';

class DashboardBottomNavBar extends StatefulWidget {

  const DashboardBottomNavBar({super.key, required this.tabController, this.onTap});

  final TabController? tabController;
  final Function(int index)? onTap;
  
  @override
  State<StatefulWidget> createState() => _DashboardBottomNavBarState();
}

class _DashboardBottomNavBarState extends State<DashboardBottomNavBar> {

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<BottomNavCubit, bool>(
      builder: (ctx, isVisible) {
        return AnimatedSize(
          duration: Duration(milliseconds: 300),
          child: isVisible ? Theme(
            data: ThemeData(
              useMaterial3: false
            ),
            child: BottomAppBar(
              color: context.isDarkMode() ? CustomColors.gray2 :Colors.white,
              padding: EdgeInsets.zero,
              child: TabBar(
                controller: widget.tabController,
                onTap: (index ) {
                  setState(() {
                    _selectedIndex = index;
                  });
                  widget.onTap?.call(_selectedIndex);
                },
                padding: EdgeInsets.zero,
                labelPadding: EdgeInsets.zero,
                tabAlignment: TabAlignment.fill,
                labelColor: CustomColors.primaryColor,
                labelStyle: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600
                ),
                overlayColor: WidgetStatePropertyAll(Colors.blue.shade50),
                indicator: null,
                indicatorPadding: EdgeInsets.zero,
                indicatorColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelColor: CustomColors.blueGray,
                unselectedLabelStyle: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400
                ),
                tabs: [
                  Tab(
                    icon: Image.asset((_selectedIndex == 0) ? Assets.selectedHome : Assets.unselectedHome, height: 26.0, width: 26.0), 
                    text: 'Home', 
                    iconMargin: EdgeInsets.symmetric(vertical: 5.0)
                  ),
                  Tab(
                    icon: Image.asset((_selectedIndex == 1) ? Assets.selectedCalendar : Assets.unselectedCalendar, height: 26.0, width: 26.0), 
                    text: 'Calendar', 
                    iconMargin: EdgeInsets.symmetric(vertical: 5.0)
                  ),
                  Tab(
                    icon: Image.asset((_selectedIndex == 2) ? Assets.selectedChat : Assets.unselectedChat, height: 26.0, width: 26.0), 
                    text: 'Chat', 
                    iconMargin: EdgeInsets.symmetric(vertical: 5.0)
                  ),
                  Tab(
                    icon: Image.asset((_selectedIndex == 3) ? Assets.selectedUser : Assets.unselectedUser, height: 26.0, width: 26.0), 
                    text: 'Profile', 
                    iconMargin: EdgeInsets.symmetric(vertical: 5.0),
                  ),
                ]
              )
            ),
          ) : const SizedBox.shrink(),
        );
      },
    );
  }
}