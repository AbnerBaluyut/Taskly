
import 'package:flutter/material.dart';

extension DoubleExtension on double  {

  Widget height({Widget? child}) {
    return SizedBox(height: this, child: child);
  }

  Widget width({Widget? child}) {
    return SizedBox(width: this, child: child);
  }
}