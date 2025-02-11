import 'package:flutter/material.dart';

import 'custom_colors.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: CustomColors.primaryColor,
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: CustomColors.primaryColor,
    selectionColor: Colors.blue.shade300,
    selectionHandleColor: Colors.blue.shade300,
  ),
  inputDecorationTheme: InputDecorationTheme(
    suffixIconColor: WidgetStateColor.resolveWith((state) {
      if (state.contains(WidgetState.error)) {
        return Colors.red.shade400;
      } else if (state.contains(WidgetState.disabled)) {
        return Colors.grey.shade400;
      } else {
        return Colors.grey.shade600;
      }
    })
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(CustomColors.primaryColor),
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          color: Colors.white54,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        )
      )
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(color: CustomColors.gray3, fontSize: 18),
  ), 
  textTheme: TextTheme(
    bodySmall: TextStyle(color: CustomColors.gray3),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: CustomColors.primaryColor,
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: CustomColors.primaryColor,
    selectionColor: Colors.blue.shade300,
    selectionHandleColor: Colors.blue.shade300,
  ),
  inputDecorationTheme: InputDecorationTheme(
    suffixIconColor: WidgetStateColor.resolveWith((state) {
      if (state.contains(WidgetState.error)) {
        return Colors.red.shade400;
      } else if (state.contains(WidgetState.disabled)) {
        return Colors.grey.shade400;
      } else {
        return Colors.grey.shade600;
      }
    })
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(CustomColors.primaryColor),
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          color: Colors.white54,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        )
      )
    ),
  ),
  scaffoldBackgroundColor: CustomColors.gray2,
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    backgroundColor: CustomColors.gray2,
    titleTextStyle: TextStyle(color: Colors.white54, fontSize: 18),
  ),
  textTheme: TextTheme(
    bodySmall: TextStyle(color: Colors.white54),
  ),
);