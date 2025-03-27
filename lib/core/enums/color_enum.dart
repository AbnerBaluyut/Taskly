import 'package:flutter/material.dart';

import '../styles/custom_colors.dart';

enum ColorEnum {
  blue,
  yellow,
  orange,
  pink,
  purple
}

extension ColorEnumExt on ColorEnum {

  Color get getColor {

    switch (this) {
      case ColorEnum.blue: 
        return CustomColors.primaryColor;
      case ColorEnum.yellow: 
        return Colors.yellow;
      case ColorEnum.orange: 
        return Colors.orange;
      case ColorEnum.pink: 
        return Colors.pink;
      case ColorEnum.purple: 
        return Colors.purple;
    }
  }
}