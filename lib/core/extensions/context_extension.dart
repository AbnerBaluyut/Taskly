import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {

  bool isDarkMode() => Theme.of(this).brightness == Brightness.dark;

  double screenWidth() => MediaQuery.sizeOf(this).width;
  double screenHeight() => MediaQuery.sizeOf(this).height;

  double dpToPixels(double dp) => dp * (screenWidth() / 720);
}