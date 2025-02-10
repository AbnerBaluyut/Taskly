import 'package:flutter/material.dart';

import '../../../core/utils/enums/social.dart';

class SocialModel {

  final IconData icon;
  final Social social;
  final Color? backgroundColor;
  final Color? iconColor;

  SocialModel({required this.icon, required this.social, required this.backgroundColor, required this.iconColor});
}