import 'package:flutter/material.dart';

class CommonBackButton extends StatelessWidget {

  const CommonBackButton({
    super.key,
    required this.onBackPressed,
    this.color
  });

  final VoidCallback onBackPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {

    return TooltipVisibility(
      visible: false,
      child: BackButton(
        onPressed: onBackPressed,
        color: color,
      ),
    );
  }
}