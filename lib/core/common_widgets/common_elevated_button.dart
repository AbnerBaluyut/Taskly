import 'package:flutter/material.dart';

import '../styles/custom_colors.dart';

class CommonElevatedButton extends ElevatedButton {

  factory CommonElevatedButton.circleIcon({
    Key? key,
    required VoidCallback? onPressed,
    BorderRadiusGeometry borderRadius = const BorderRadius.all(Radius.circular(80.0)),
    EdgeInsetsGeometry? padding,
    Color backgroundColor = CustomColors.primaryColor,
    Color shadowColor = Colors.transparent,
    Color overlayColor = Colors.black45,
    Widget? icon,
    OutlinedBorder? shape,
  }) {
    return CommonElevatedButton(
      key: key,
      onButtonPressed: onPressed,
      custom: icon,
      borderRadius: borderRadius,
      padding: padding,
      backgroundColor: backgroundColor,
      shadowColor: shadowColor,
      overlayColor: overlayColor,
      shape: shape,
    );
  }

  CommonElevatedButton({
    super.key, 
    this.onButtonPressed, 
    this.text,
    this.custom,
    this.fontColor = Colors.white,
    this.fontWeight = FontWeight.w400,
    this.fontSize = 16,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.elevation = 8,
    this.borderSide = BorderSide.none,
    this.padding,
    this.backgroundColor = CustomColors.primaryColor,
    this.shadowColor = Colors.transparent,
    this.overlayColor = Colors.black45,
    this.shape,
  }) : assert(text != null || custom != null), super(
      onPressed: onButtonPressed,
      child: (text != null) ? Text(
        text,
        style: TextStyle(
          fontSize: fontSize, 
          fontWeight: fontWeight,
          color: fontColor,
        ),
      ) : custom,
      style: ElevatedButton.styleFrom(
        shadowColor: shadowColor,
        backgroundColor: backgroundColor,
        overlayColor: overlayColor,
        elevation: elevation,
        shape: shape ?? RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: borderSide
        ),
        padding: padding,
        disabledBackgroundColor: Colors.grey.shade500,
      )
  );

  final VoidCallback? onButtonPressed;
  final String? text;
  final Widget? custom;
  final Color fontColor;
  final Color backgroundColor;
  final Color shadowColor;
  final Color overlayColor;
  final FontWeight fontWeight;
  final double fontSize;
  final BorderRadiusGeometry borderRadius;
  final BorderSide borderSide;
  final double elevation;
  final EdgeInsetsGeometry? padding;
  final OutlinedBorder? shape;
}