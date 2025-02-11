import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:taskly/core/extensions/double_extension.dart';
import 'package:taskly/core/extensions/int_extension.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/styles/assets.dart';
import '../../../core/styles/custom_colors.dart';
import '../../../core/styles/dimension.dart';
import '../../../core/common_widgets/common_elevated_button.dart';
import '../../../core/common_widgets/common_scaffold.dart';
import '_components/item_boarding.dart';

class OnBoardingPage extends StatefulWidget{
  const OnBoardingPage({super.key});
  
  @override
  State<StatefulWidget> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {

  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),  
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: Dimension.spacingSmall,
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              children: [
                ItemBoarding(
                  image: Assets.onBoarding1,
                  title: 'Lorem Ipsum',
                  description: 'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
                ),
                ItemBoarding(
                  image: Assets.onBoarding2,
                  title: 'Lorem Ipsum',
                  description: 'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
                ),
                ItemBoarding(
                  image: Assets.onBoarding3,
                  title: 'Lorem Ipsum',
                  description: 'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
                ),
              ],
            ),
          ), 
          SmoothPageIndicator(
            controller: pageController,
            count: 3,
            effect: ColorTransitionEffect(
              dotHeight: 10,
              dotWidth: 10,
              activeDotColor: CustomColors.primaryColor,
              dotColor: Colors.grey.shade300,
            ),
          ),
          Dimension.spacingLarge.height(),
          Padding(
            padding: const EdgeInsets.only(
              left: Dimension.spacingMedium,
              right: Dimension.spacingMedium,
              bottom: Dimension.spacingLarge
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonElevatedButton(
                  onButtonPressed: () {
                    context.go(AppRoutes.welcome);
                  }, 
                  text: "Skip",
                  fontWeight: FontWeight.w600,
                  fontColor: CustomColors.primaryColor,
                  fontSize: 14.0,
                  borderSide: BorderSide(
                    color: CustomColors.primaryColor,
                    width: 2.0
                  ),
                  backgroundColor: Colors.white,
                ),
                CommonElevatedButton(
                  onButtonPressed: () {
                    if (pageController.page == 2) {
                      context.go(AppRoutes.welcome);
                    } else {
                      pageController.nextPage(
                        duration: 300.milliseconds(), 
                        curve: Curves.easeInOut
                      );
                    }
                  }, 
                  text: "Next",
                  fontWeight: FontWeight.w600,
                  fontColor: Colors.white,
                  fontSize: 14.0,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}