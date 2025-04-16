import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_ext.dart';
import 'package:taskly/core/extensions/int_ext.dart';

import '../../../../../core/common_widgets/common_elevated_button.dart';
import '../../../../../core/enums/color_enum.dart';
import '../../../../../core/styles/custom_colors.dart';
import '../../../../../core/styles/dimension.dart';

class ColorThemeSection extends StatefulWidget {

  const ColorThemeSection({super.key, required this.onTapCallback});

  final void Function(ColorEnum) onTapCallback;

  @override
  State<ColorThemeSection> createState() => _ColorThemeSection();
}

class _ColorThemeSection extends State<ColorThemeSection> {

  final List<ColorEnum> _themes = [
    ColorEnum.blue,
    ColorEnum.yellow,
    ColorEnum.orange,
    ColorEnum.pink,
    ColorEnum.purple
  ];
  
  ColorEnum _selectedTheme = ColorEnum.blue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: Dimension.spacingSmall,
      children: [
        Text(
          "Color Theme",
          style: TextStyle(
            fontSize: 16, 
            fontWeight: FontWeight.w500,
            color: context.isDarkMode() ? Colors.white54 : CustomColors.gray
          ),
        ),
        Wrap(
          children: _themes.map((item) {
            return CommonElevatedButton(
              shape: CircleBorder(),
              padding: EdgeInsets.zero,
              backgroundColor: item.getColor,
              onButtonPressed: () {
                setState(() {
                  _selectedTheme = item;
                });
                widget.onTapCallback.call(item);
              },
              minSize: Size(40, 40),
              custom: AnimatedContainer(
                duration: 800.milliseconds(),
                curve: Curves.easeInOut,
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:  _selectedTheme == item ? Colors.black45 : Colors.transparent,
                ),
                child: AnimatedSwitcher(
                  duration: 300.milliseconds(),
                  transitionBuilder: (child, animation) {
                    return ScaleTransition(
                      scale: animation,
                      child: child,
                    );
                  },
                  child: _selectedTheme == item ? Icon(Icons.check, color: Colors.white, size: 24.0) : const SizedBox.shrink(),
                ),
              ) ,
            );
          }).toList(),
        )
      ],
    );
  }
}