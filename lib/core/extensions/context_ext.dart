import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:taskly/core/extensions/double_ext.dart';
import 'package:taskly/core/extensions/int_ext.dart';
import '../common_widgets/common_elevated_button.dart';
import '../styles/custom_colors.dart';
import '../styles/dimension.dart';

extension ContextExtension on BuildContext {

  bool isDarkMode() => Theme.of(this).brightness == Brightness.dark;

  double screenWidth() => MediaQuery.sizeOf(this).width;
  double screenHeight() => MediaQuery.sizeOf(this).height;

  double dpToPixels(double dp) => dp * (screenWidth() / 720);

  void popSafely<T extends Object?>({bool closeOverlay = false, T? result}) {
    if (canPop()) {
      pop(result);
      if (closeOverlay) {
        Future.delayed(300.milliseconds(), () {
          if (GoRouter.of(this).canPop()) {
            GoRouter.of(this).pop(result);
          }
        });
      }
    } else if (GoRouter.of(this).canPop()) {
      GoRouter.of(this).pop(result);
    }
  }

  void showAnimatedSuccessDialog({
    required String title,
    VoidCallback? onButtonPressed,
  }) {
    showGeneralDialog(
      context: this,
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(this).modalBarrierDismissLabel,
      transitionDuration: 400.milliseconds(),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 300,
              decoration: BoxDecoration(
                color: context.isDarkMode() ? CustomColors.gray2 : Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.green.shade600,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.green.shade400,
                      child: Icon(Icons.check, color: Colors.white, size: 40.0),
                    )
                  ),
                  Dimension.spacingLarge.height(),
                  Text(
                    "Success",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: isDarkMode() ? Colors.white : CustomColors.gray2,
                    ),
                  ),
                  Dimension.spacingSmall.height(),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: isDarkMode() ? Colors.white : CustomColors.gray2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Dimension.spacingMedium.height(),
                  CommonElevatedButton(
                    text: "OK",
                    fontColor: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    borderRadius: BorderRadius.circular(10.0),
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimension.paddingExtraLarge
                    ),
                    onButtonPressed: onButtonPressed ?? () => popSafely(closeOverlay: true),
                  ),
                  Dimension.spacingMedium.height(),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: Tween<double>(begin: 0.8, end: 1.0).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
          ),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
    );
  }

  void showAnimatedErrorDialog({
    required String title,
    VoidCallback? onButtonPressed,
  }) {
    showGeneralDialog(
      context: this,
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(this).modalBarrierDismissLabel,
      transitionDuration: 400.milliseconds(),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 300,
              decoration: BoxDecoration(
                color: context.isDarkMode() ? CustomColors.gray2 : Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.red.shade600,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.red.shade400,
                      child: Icon(Icons.error, color: Colors.white, size: 40.0),
                    )
                  ),
                  Dimension.spacingLarge.height(),
                  Text(
                    "Oops!",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: isDarkMode() ? Colors.white : CustomColors.gray2,
                    ),
                  ),
                  Dimension.spacingSmall.height(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimension.paddingSmall
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: isDarkMode() ? Colors.white : CustomColors.gray2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Dimension.spacingMedium.height(),
                  CommonElevatedButton(
                    text: "OK",
                    fontColor: Colors.white,
                    backgroundColor: Colors.red.shade600,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    borderRadius: BorderRadius.circular(10.0),
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimension.paddingExtraLarge
                    ),
                    onButtonPressed: onButtonPressed ?? () => popSafely(closeOverlay: true),
                  ),
                  Dimension.spacingMedium.height(),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: Tween<double>(begin: 0.8, end: 1.0).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
          ),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
    );
  }

  void showAnimatedAlertDialog({
    required String title,
    VoidCallback? onButtonPressed,
  }) {
    showGeneralDialog(
      context: this,
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(this).modalBarrierDismissLabel,
      transitionDuration: 400.milliseconds(),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 300,
              decoration: BoxDecoration(
                color: context.isDarkMode() ? CustomColors.gray2 : Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.orange.shade600,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.orange.shade400,
                      child: Icon(Icons.warning, color: Colors.white, size: 40.0),
                    )
                  ),
                  Dimension.spacingLarge.height(),
                  Text(
                    "Warning!",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: isDarkMode() ? Colors.white : CustomColors.gray2,
                    ),
                  ),
                  Dimension.spacingSmall.height(),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: isDarkMode() ? Colors.white : CustomColors.gray2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Dimension.spacingMedium.height(),
                  CommonElevatedButton(
                    text: "OK",
                    fontColor: Colors.white,
                    backgroundColor: Colors.orange.shade600,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    borderRadius: BorderRadius.circular(10.0),
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimension.paddingExtraLarge
                    ),
                    onButtonPressed: onButtonPressed ?? () => popSafely(closeOverlay: true),
                  ),
                  Dimension.spacingMedium.height(),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: Tween<double>(begin: 0.8, end: 1.0).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
          ),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
    );
  }

  void showLoadingDialog() {
    showGeneralDialog(
      context: this,
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(this).modalBarrierDismissLabel,
      transitionDuration: 400.milliseconds(),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                color: context.isDarkMode() ? CustomColors.gray2 : Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Dimension.spacingMedium.height(),
                  LoadingAnimationWidget.threeRotatingDots(
                    color: CustomColors.primaryColor,
                    size: 30.0,
                  ),
                  Dimension.spacingMedium.height(),
                  Text(
                    "Please wait...",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isDarkMode() ? Colors.white : CustomColors.gray2,
                    ),
                  ),
                  Dimension.spacingMedium.height(),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: Tween<double>(begin: 0.8, end: 1.0).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
          ),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
    );
  }
}