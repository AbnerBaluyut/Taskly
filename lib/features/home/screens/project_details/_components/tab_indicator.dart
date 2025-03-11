import 'package:flutter/material.dart';

import '../../../../../core/styles/custom_colors.dart';
import '../../../../../core/styles/dimension.dart';

class TabIndicator extends Decoration {
  final Color color;
  final double height;

  const TabIndicator({this.color = CustomColors.primaryColor, this.height = 4.0});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _TabIndicatorPainter(color, height);
  }
}

class _TabIndicatorPainter extends BoxPainter {
  final Paint _paint;
  final double height;

  _TabIndicatorPainter(Color color, this.height)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    if (cfg.size == null) return;

    final double width = cfg.size!.width;
    final double xPos = offset.dx;
    final double yPos = offset.dy + cfg.size!.height;

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTRB(xPos, yPos - height, xPos + width, yPos),
        topLeft: const Radius.circular(Dimension.radiusSmall),
        topRight: const Radius.circular(Dimension.radiusSmall),
      ),
      _paint,
    );
  }
}
