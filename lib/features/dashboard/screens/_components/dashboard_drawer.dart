import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskly/core/extensions/context_extension.dart';
import 'package:taskly/core/extensions/double_extension.dart';
import 'package:taskly/core/global/dark_mode_bloc.dart';

import '../../../../../core/styles/custom_colors.dart';
import '../../../../core/common_widgets/common_elevated_button.dart';
import '../../../../core/common_widgets/common_image.dart';
import '../../../../core/common_widgets/common_switch.dart';
import '../../../../core/styles/assets.dart';
import '../../../../core/styles/dimension.dart';

class DashboardDrawer extends StatelessWidget {

  const DashboardDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      backgroundColor: context.isDarkMode() ? CustomColors.gray2 : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Dimension.spacingSmall.height(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimension.paddingSmall,
              vertical: Dimension.paddingMedium
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Dimension.spacingSmall.height(),
                Text(
                  'Taskly',
                  style: TextStyle(
                    color: CustomColors.primaryColor,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Dimension.spacingSmall.height(),
                Container(
                  width: context.screenWidth(),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 1.5
                    )
                  ),
                  padding: const EdgeInsets.all(Dimension.paddingSmall),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CommonImage(
                        path: Assets.icMedalStar,
                        height: 24.0,
                        width: 24.0,
                      ),
                      SizedBox(width: Dimension.paddingSmall),
                      Text(
                        "Upgrade to PRO",
                        style: TextStyle(
                          color: context.isDarkMode() ? Colors.white : CustomColors.gray2,
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          BlocBuilder<DarkModeBloc, bool>(
            builder: (context, state) {
              return CommonElevatedButton(
                onButtonPressed: () => context.read<DarkModeBloc>().toggleDarkMode(),
                padding: EdgeInsets.zero,
                borderRadius: BorderRadius.zero,
                backgroundColor: Colors.transparent,
                custom: ListTile(
                  title: Text(
                    'Dark Mode',
                    style: TextStyle(
                      color: context.isDarkMode() ? Colors.white : CustomColors.gray2,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: Dimension.paddingMedium
                  ),
                  trailing: CommonSwitch(
                    value: context.read<DarkModeBloc>().state,
                    size: 40.0,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}