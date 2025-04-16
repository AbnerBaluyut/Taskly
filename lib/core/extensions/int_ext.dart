import 'package:flutter/material.dart';

extension IntExtension on int {

  Duration milliseconds() {
    return Duration(milliseconds: this);
  }

  Duration seconds() {
    return Duration(seconds: this);
  }

  Duration minutes() {
    return Duration(minutes: this);
  }

  Duration hours() {
    return Duration(hours: this);
  }

  // Widgets
  Widget height({Widget? child}) {
    return SizedBox(height: toDouble(), child: child);
  }
  
  Widget width({Widget? child}) {
    return SizedBox(width: toDouble(), child: child);
  }
}